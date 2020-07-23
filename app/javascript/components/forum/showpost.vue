<template>
  <div class="mainst">
    <div type="text" class="text">
      <div class="itempost">
        <div class="posthead" @click="handleClick">
          <div class="mediumtext">
            {{this.title}}             
          </div>
          <div class="mediumtext cssbody">
            {{this.body}}             
          </div>
        </div>
      </div>
    </div>
    <div class="rightpad">
      <div v-if="this.username != $store.getters.role.username" class="smalltext username">
        {{this.username}}
      </div>
      <el-button v-if="$store.getters.role.username == this.username"  type='danger' size='mini' icon="el-icon-delete" circle @click="deleting(number)" class="delbutt">         
      </el-button>      
    </div>

    <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false" :width="calcul">
      <div class="dialogframe plashka3">            
        <v-embed :options="options" v-if="post.body" class="postbody plashka2">
         {{post.body }} 
        </v-embed> 
        <div class="user-info">
          <div>
            <el-input-number @change="handleChange" size="mini" v-model="num4" :step="this.num"></el-input-number>
          </div>

          <div class="postnikname basetext aprior ">
            написал: {{post.username}}
          </div>           
        </div>


        <el-input 
        class="plashka2"
        type="textarea"
        :autosize="{ minRows: 4, maxRows: 8}"
        placeholder="написать комментарий"
        v-model="textarea"> 
        </el-input> 
        <emoji-picker @emoji="insert" >
          <div
            class="emoji-invoker"
            slot="emoji-invoker"
            slot-scope="{ events: { click: clickEvent } }"
            @click.stop="clickEvent"
              >
            <svg   viewBox="0 0 24 24"  xmlns="http://www.w3.org/2000/svg">
              <path d="M0 0h24v24H0z" fill="none"/>
              <path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"/>
            </svg>
          </div>
          <div slot="emoji-picker" slot-scope="{ emojis, insert, display }">
            <div class="emoji-picker" :style="{ top: display.y + 'px', left: display.x + 'px' }">
             <!--  <div class="emoji-picker__search">
                <input type="text" v-model="search" v-focus>
              </div> -->
              <div>
                <div v-for="(emojiGroup, category) in emojis" :key="category">
                  <!-- <h5>{{ category }}</h5> -->

                  <div class="emojis">
                    <span
                      v-for="(emoji, emojiName) in emojiGroup"
                      :key="emojiName"
                      @click="insert(emoji)"
                      :title="emojiName"
                    >{{ emoji }}</span>
                  </div>
                  <br/>
                </div>
              </div>
            </div>
          </div>
        </emoji-picker>
        <el-button v-if="$store.getters.dead == true" style="margin-top: 0.8em;" disabled>отправить</el-button> 
        <el-button  v-else style="margin-top: 0.8em;" @click="sendReply(number)">отправить</el-button>   
        <div v-for="(item, index) in postComm" class="comm-area plashka2">
          <div v-if='item.parent_id == null'>
            <!-- {{ item}} -->             
            <tree v-on:sendposttwo="send" :tree-data="item" :number="number"></tree>
          </div>
        </div>        
      </div>
      <div slot="footer" class="footpostshow basetext font3">
        &nbsp;
      </div>
    </el-dialog>
  </div>
</template>
<script>

let screenwidth = {value: ''}
function parseCalc() {
  let screenw = document.body.clientWidth;
  screenwidth.value = document.body.clientWidth;
}
window.addEventListener('resize', _.throttle(parseCalc, 100));
import axios from 'axios'
import Tree from "./tree";
import VEmbed from 'vue-embed'
export default {
  name: 'showpost',
  

  props:['number', 'body', 'title', 'username'],
  data: function () {
    return {
       input: '',
      search: '',
      loading: true,
      options: {
        plugins: [
        // {
        //   name: 'emoji',
        //   options: {
        //     // regex: /emojiRegex/gi, // in case you want to define a custom regex
        //     // template(emojiName) {
        //     //   // optional template
        //     // }
        //   }
        // },
        {
          name: 'noembed',
        }
        ]
      },
      options2: {
        plugins: [
        // {
        //   name: 'emoji',
        //   options: {
        //     // regex: /emojiRegex/gi, // in case you want to define a custom regex
        //     // template(emojiName) {
        //     //   // optional template
        //     // }
        //   }
        // },
]
      },           
      num: 1,
      num4: 0,
      textarea: '',
      screenwidth: screenwidth,
      dialogVisible: false,
			post: [],
      postComm: []
    };
  },
  watch: {
    textarea() {
      console.log('sss')
    }
  },
  computed: {
    calcul: function(){
      return screenwidth.value < 850 ? '90' +'%' : '70'+'em'
    }
  },
  mounted(){
    // this.getPost(this.number)

  },
  methods: {
    insert(emoji) {
      this.textarea += emoji
    },    
    deleting(id){
      console.log(id)
      axios.delete('/posts/'+id,{
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
        this.$emit('delpost', id);        
      })
      .catch(function (error) {
        console.log(error);
      }); 
    },
    send(val){
      console.log('val')
      console.log(val)
      this.getComments(this.number) 
    },
    handleChange(curVal, oldVal){
      this.votePost(curVal, oldVal)
    },
    getRaitPost(){
      axios({
        method: 'get',
        url: '/api/v1/getrait',
        params: {
          id: this.number
        }, 
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
        var totalrait = response.headers.totalrait
        var postmin = response.headers.postmin
        var postplus = response.headers.postplus
        this.num4 = totalrait
        console.log(totalrait)
        console.log(postmin)
        console.log(postplus)
      })
      .catch(function (error) {
        console.log(error);
      });         
    },
    votePost(curVal, oldVal){
      var self = this
      axios({
        method: 'post',
        url: '/api/v1/votepost',
        data: {
          id: self.number,
          oldval: oldVal,
          newval: curVal
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        this.getRaitPost()         
      })      
    },
    sendReply(we){
      axios.post('/posts/'+we+'/comments',{
        comment: {
          parent_id: "",
          body: this.textarea
        }, 
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
        this.getComments(this.number) 
        this.textarea = ''
        // this.postComm = response.data
      })
      .catch(function (error) {
        console.log(error);
      });                   
    },
    handleClick(){
      parseCalc()
      this.dialogVisible = true 
      this.getPost(this.number)
      this.getComments(this.number) 
      this.getRaitPost()
    },
    delpost(postId) {
      if (this.$store.getters.token.access) {
        axios.delete('/api/v1/vueposts/'+postId,{
 
          headers: {
            'Authorization': 'bearer '+this.$store.getters.token.access
          } 
        })
        .then((response) => {
          
        })
        .catch(function (error) {
          console.log(error);
        });             
      }       
    },
    getPost(postId) {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepostshow',
          params: {
            id: postId
          }, 
          headers: {
            'Authorization': 'bearer '+this.$store.getters.token.access
          } 
        })
        .then((response) => {
          this.post = response.data
          var voteweight = response.headers.voteweight
          this.num = Number(voteweight)
        })
        .catch(function (error) {
          console.log(error);
        });             
      }       
    },
    getComments(postId) {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuecommshow',
          params: {
            id: postId
          }, 
          headers: {
            'Authorization': 'bearer '+this.$store.getters.token.access
          } 
        })
        .then((response) => {
          this.postComm = response.data
        })
        .catch(function (error) {
          console.log(error);
        });             
      }             
    }
  },
  directives: {
    focus: {
      inserted(el) {
        el.focus()
      },
    },
  },
  components: {
    Tree,
    VEmbed, 
  }
}
</script>

<style scoped>
@import "../../stylesheets/_variables";
.user-info{
  display: flex;
  margin: 0.5em 0 0.5em;
  div {
    margin: 0 0.5em 0 0;
  }
}
.cssbody{
  margin: 0.2em 0;
}
.postbody{
  overflow: hidden;
}
.mainst{
  position: relative;
  justify-content: space-between;
  width: 100%;
  background-color: color($almond shade(15%));    
  margin: 0.2em 0;
  /*lost-utility: edit;*/
  /*lost-column: 1/1;*/
  display: flex;
  flex-direction: row;
  border-top-right-radius: 2em;
  border-bottom-right-radius: 2em;
}
.rightpad{
  display: flex;
  align-items: flex-end;
  padding: 0.1em 0.4em 0.1em 0.2em; 
}
.plashka3{
  /*background-color: #dad;*/
}
.text {
  /*word-break: normal;*/
/*  outline: 6px solid #1E1E21;
  outline-offset:-6px;*/
  margin: 0.1em 0;
  /*background-color: $earthyellow;*/
  /*background-color: color(#1E1E21 shade(6%));*/
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}
.itempost{
  color: $HeadBackColor; 
  /*height: 2.0em;*/
  border-top-right-radius: 0.3em;
  border-bottom-right-radius: 0.3em;
 
  justify-content: space-between;
  display: flex;
  flex-direction: row;
  /*background-color: color( $spacecadet tint(15%));*/
  /*background-color: color($spacecadet shade(0%));*/
  padding: 0.2em 0.4em 0.3em 0.2em;
}

.posthead{
/*  white-space: nowrap;
  overflow: hidden;*/
  /*justify-content: space-between;*/
  position: relative;
   
  cursor: pointer;
  align-items: center;
  flex-direction: row;
  display: flex;
  padding: 0 0.2em;
  div{
    padding: 0em 0.3em;
  }
}
.username{
  position: absolute;
  right: 1em;
  /*padding: 0 1em;*/
  display: flex;
  align-self: center;
 
  /*width: 100%;*/
  /*justify-content: flex-end;*/
}
.delbutt{
  display: flex;
  align-self: center; 
}
.postnikname{
  /**/
  /*float: right;*/
}
.footpostshow{
  color: #dad;
}
.comm-area {
  padding: 0 1em;
}
.dialogframe {

  margin: 0 1em 0 0em;
}
 

</style>