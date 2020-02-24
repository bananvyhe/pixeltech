<template>
  <div class="node-tree">
    <div class="bodyComment mediumtext"> 
      <div :options="options" v-if="node.body" class="label">{{node.body}}</div>
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
          <div class="replyarea" :options="options">
            <el-input
              type="textarea"
              :autosize="{ minRows: 3, maxRows: 5}"
              placeholder="написать комментарий"
              v-model="textarea">
            </el-input>
            <!-- {{number}} -->
            <el-button size='mini' @click="sendReply(number)">отправить</el-button>          
          </div>
        <div v-if="node.body" slot="reference" class="reply" @click="visible = !visible" >ответить</div>
      </el-popover>   
      <div class="del" v-if="$store.getters.role.username == node.username && node.body != null" @click="destroy(number, node.id )">удалить</div>
    </div>
    <div v-if="node.comments && node.comments.length">
      <node v-on:sendpost="sendd" v-for="child in node.comments" :key="child.id" :node="child" :number="number" class="padding-message"></node>

    </div>
  </div>
</template>

<script>
  import vClickOutside from 'v-click-outside'  
  // import VEmbed from 'vue-embed'
import axios from 'axios'
export default {

  directives: {
    clickOutside: vClickOutside.directive
  },  
  name: "node",
  // components: {
  //   VEmbed,
  // },
  props: {
    node: Object,
    number: Number 
  },

  data: function () {
 
    return { 
      options: {
      plugins: [{ 
        name: 'youtube',
          options: {
            regex: /youtubeVideoRegex/gi, // in case you want to define a custom regex,

            // If set to false, it doesn't make API calls to Youtube for video details. Instead it just embeds the video.
            details: true,

            // This is a mandatory field.
            gAuthKey: '',

            // height of video iframe
            height: 300,

            // This is the class on clicking which the details view changes to embedded video.
            // This is only required if you providing a custom template for the details view.
            clickClass: "ejs-video-thumb",

            template(args, options, pluginOptions, dataFromApi) {
              // dataFromApi is undefined if details is set to false
            },

            // executes when element is rendered
            onLoad(options, pluginOptions) {}
          }
        }],
      },  
      blank: '123',
      visible: false,
      textarea: ''
    }
  },
  methods: {
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