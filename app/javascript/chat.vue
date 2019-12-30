<template>
  <div class="chat">
    <!-- {{chatMessages}} -->
    <el-container class="chatWindow" style="">
      <el-main v-chat-scroll>

         <div v-for="(item, index) in chatMessages" class="mediumtext">
          {{item.text}}
         </div>
      </el-main>
    </el-container>
    <!-- <div class='messages'>123</div> -->
    <div class="inputZone" v-on:keyup.enter="postingMes">
      <el-input class="inputStroke" placeholder="сообщение в чат" v-model="input" ></el-input>
      <el-button size='small' @click="postingMes">отправить</el-button>      
    </div>

  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      input: '',
      chatMessages: ''
    };
  },
  methods: {
    addMessage(data){
      console.log(data)
      this.chatMessages = this.chatMessages.concat(data);
    },
    postingMes: function(){
       axios({
        method: 'post',
        //vks#associate
        url: '/api/v1/chat',
        data: {
          text: this.input,
          clan_name: this.$store.getters.role.role
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        this.input = ''
        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      })
    },
    getChat(){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      // params: {
      //   rait: this.value,
      //   pos: this.pos
      // } 
      })
      .then((response) => { 
         
        var total = response.data
        this.chatMessages = total
        console.log(total)
      });      
    }
  },
  watch: {

  }, 
  mounted() { 
    this.getChat()
    var pusher = new Pusher('44697f69f1f93a53365c', {
      cluster: 'eu',
      forceTLS: true
    });
    var channel = pusher.subscribe('messages');
    var self = this;
    channel.bind('new', function(data) {
      self.addMessage(data);
    }); 
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
.chatWindow{
  margin: 0.0em 0.2em;
  height: 80px; 
  border: 1px 
  solid #555;
}
.inputStroke{
  padding: 0.2em 0.2em 0 0;
}
.inputZone{
  /*padding: 0.2em;*/
  display: flex;
  flex-direction: row;
}
.el-main {
  padding: 5px 7px;
  /*background-color: #E9EEF3;*/
  /*color: #333;*/
  text-align: left;
  /*line-height: 160px;*/
}
.messages{
  padding: 0.2em 0.5em;
}
.chat {
  padding: 0.2em;
  /*background-color: #dad;*/
}


</style>