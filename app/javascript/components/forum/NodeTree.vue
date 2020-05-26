<template>
  <div class="node-tree">
    <div class="bodyComment mediumtext"> 
      <v-embed :options="options" v-if="node.body" class="label">{{node.body}}</v-embed>
      <span v-else class="label basetext">(сообщение удалено)</span>      
    </div>

    <div class="tinytext sign">
      <span class="smalltext">написал {{node.username}}</span>      
    </div>
  <!-- {{typeof node }} -->
    <div class="replyBlock" v-click-outside="onClickOutside">
      <el-popover
        placement="bottom"
        width="400"
        trigger="manual"
        v-model="visible">
          <!-- <v-embed class="replyarea" :options="options"> -->
            <el-input
              type="textarea"
              :autosize="{ minRows: 3, maxRows: 5}"
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
            <!-- {{number}} -->
            <el-button size='mini' @click="sendReply(number)">отправить</el-button>          
          <!-- </v-embed> -->
        <div v-if="node.body && $store.getters.pk != 1" slot="reference" class="reply" @click="visible = !visible" >ответить</div>
      </el-popover>   
      <div class="del" v-if="$store.getters.role.username == node.username && node.body != null && $store.getters.pk != 1" @click="destroy(number, node.id )">удалить</div>
       
    </div>

    <div v-if="node.comments && node.comments.length">
      <node v-on:sendpost="sendd" v-for="child in node.comments" :key="child.id" :node="child" :number="number" class="padding-message"></node>

    </div>
  </div>
</template>

<script>
  import VEmbed from 'vue-embed'
  import vClickOutside from 'v-click-outside'  
  // import VEmbed from 'vue-embed'
import axios from 'axios'
export default {

  directives: {
    clickOutside: vClickOutside.directive,
    focus: {
      inserted(el) {
        el.focus()
      },
    },
  },  
  name: "node",
  // components: {
  //   VEmbed,
  // },
  props: {
    node: Object,
    number: Number 
  },
  components: {
    VEmbed, 
  },
  data: function () {
 
    return { 
      options: {
        plugins: [
 
        {
          name: 'noembed',
        }
        ]
      },
      blank: '123',
      visible: false,
      textarea: ''
    }
  },
 

  methods: {
    insert(emoji) {
      this.textarea += emoji
    },      
    onClickOutside(event) {
      console.log('Clicked outside. Event: ', event)
      this.visible = false
    },    
    sendd(val){
      console.log('val')
      console.log(val)
      this.$emit('sendpost', val);
    },
    destroy(num, id){
      axios.delete('/posts/'+num+'/comments/'+id,{

        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
        this.$emit('sendpost', num);        
      })
      .catch(function (error) {
        console.log(error);
      });  
    },
    sendReply(we){
      axios.post('/posts/'+we+'/comments',{
        comment: {
          parent_id: this.node.id,
          body: this.textarea
        }, 
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      })
      .then((response) => {
        this.textarea = ''
        this.visible = false
        var rand = Math.random()
        this.$emit('sendpost',rand );
        // this.postComm = response.data
      })
      .catch(function (error) {
        console.log(error);
      });                   
    }
  }
};
</script>
<style>
.sign{
  /*line-height: 0.8em;*/
}
.bodyComment{
  line-height: 0.8em;
  padding: 0.7em 0 0.2em;
}
.replyarea{
  margin: -0.7em;
}
.replyBlock{
  display: flex;
  flex-direction: row;
}
.del{
  width: 80px;
  padding: 0 0 0.5em;
  line-height: 0.8em;
  cursor: pointer;
  color: red;
  /*background-color: #ada;*/
}
.pked{
  width: 80px;
  padding: 0 0 0.5em;
  line-height: 0.8em;
  cursor: pointer;
  color: gray;
  /*background-color: #ada;*/
}
.reply{
  /*background-color: #dad;*/
  flex-direction: row;
  width: 5em;
  padding: 0 0 0.5em;
  line-height: 0.8em;
  cursor: pointer;
  color: #279c1d;
}
.padding-message {
  padding-left: 0.7em;
  margin: 0 0;
}
.label {
  /*background-color: #dad;*/
}

</style>