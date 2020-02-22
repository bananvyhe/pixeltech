<template>
  <div>
    <div type="text" class="text">
      <div class="itempost">
        <div class="posthead" @click="handleClick">
          <div class="mediumtext">
            <!-- {{this.number}} -->
            {{this.title}}             

          </div>
          <div   class="mediumtext">
            {{this.body}}             
          </div>

          <!-- {{this.number}} -->
        </div>

      </div>
                <div v-if="this.username != $store.getters.role.username" class="smalltext username">
            {{this.username}}
          </div>
        <el-button v-if="$store.getters.role.username == this.username"  type='danger' size='mini' icon="el-icon-delete" circle @click="deleting(number)">         
        </el-button>
    </div>
    <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false" :width="calcul">
      <div class="dialogframe plashka3">            
        <!-- {{postComm}} -->
        {{post.body }}
        <!-- <v-embed :options="options">{{post.body }}</v-embed>  -->
        <!-- <v-embed :options="options">:smile:</v-embed> -->
        <div>
          <el-input-number @change="handleChange" size="mini" v-model="num4" :step="this.num"></el-input-number>
        </div>
        <div class="postnikname basetext font3">
          автор: {{post.username}}
        </div> 
        <!-- postComm{{postComm}} --> 
        <el-input
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8}"
          placeholder="написать комментарий"
          v-model="textarea">
        </el-input> 
        <el-button size='mini' @click="sendReply(number)">отправить</el-button>   
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
  // import VEmbed from 'vue-embed'
let screenwidth = {value: ''}
function parseCalc() {
  let screenw = document.body.clientWidth;
  screenwidth.value = document.body.clientWidth;
}
window.addEventListener('resize', _.throttle(parseCalc, 100));
import axios from 'axios'
import Tree from "./tree";
export default {
 // name: 'Hello',
  // components: {
  //   'v-embed': VEmbed,
  // },  
  props:['number', 'body', 'title', 'username'],
  data: function () {
    return {
      // options: {
      //   plugins: [{
      //     name: 'emoji',
      //     options: {
      //       // regex: /emojiRegex/gi, // in case you want to define a custom regex
      //       // template(emojiName) {
      //       //   // optional template
      //       // }
      //     }
      //   }]
      // },  
      num: 1,
      num4: 0,
      textarea: '',
      screenwidth: screenwidth,
      dialogVisible: false,
			post: [],
      postComm: []
    };
  },
  computed: {
    calcul: function(){
      return screenwidth.value > 880 ? '55'+'em' : '90' +'%'
    }
  },
  mounted(){
    // this.getPost(this.number)

  },
  methods: {
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
  components: {
    Tree
  }
}
</script>

<style scoped>
@import "../../stylesheets/_variables";
.plashka3{
  /*background-color: #dad;*/
}
.text {
/*  outline: 6px solid #1E1E21;
  outline-offset:-6px;*/
  margin: 0.3em 0;
  /*background-color: $earthyellow;*/
  background-color: color(#1E1E21 shade(6%));
  display: flex;
  flex-direction: row;
   justify-content: space-between;
   align-items: center;
}
.itempost{
  color: $navajowhite; 
  height: 2.0em;
  border-top-right-radius: 0.3em;
  border-bottom-right-radius: 0.3em;
  margin: 0.0em 0;
  justify-content: space-between;
  display: flex;
  flex-direction: row;
  /*background-color: color( $spacecadet tint(15%));*/
  background-color: color($spacecadet shade(15%));
  padding: 0 0.4em 0 0.2em;
}

.posthead{
  /*justify-content: space-between;*/
  position: relative;
  width: 100%;
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
 
  /*width: 100%;*/
  /*justify-content: flex-end;*/
}
.postnikname{
  padding: 0 0 0.5em;
  float: right;
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