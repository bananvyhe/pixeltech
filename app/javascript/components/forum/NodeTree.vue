<template>
  <div class="node-tree">
    <div class="bodyComment mediumtext">
      <span v-if="node.body" class="label">{{node.body}}</span>
      <span v-else class="label basetext">(сообщение удалено)</span>      
    </div>

    <div class="tinytext sign">
      <span class="">написал {{node.username}}</span>      
    </div>
  <!-- {{typeof node }} -->
    <div class="replyBlock">
      <el-popover
        placement="bottom"
        width="400"
        trigger="manual"
        v-model="visible">
          <div class="replyarea">
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
import axios from 'axios'
export default {
  name: "node",
  props: {
    node: Object,
    number: Number 
  },
  data: function () {
    return { 
      blank: '123',
      visible: false,
      textarea: ''
    }
  },
  methods: {
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
  padding: 0.3em 0 0;
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