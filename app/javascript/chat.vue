<template>
  <div class="chat" v-if="this.$store.getters.role.role != 'client'" @click="chatHeight = 50" >
    <!-- {{chatMessages}} -->
    <el-tabs  tab-position="top"  >
      <el-tab-pane label="User" v-if="this.$store.getters.role.role != 'user'">
        <el-container class="chatWindow" v-bind:style="{height: this.chatHeight +'vh'}" >
          <el-main v-chat-scroll v-click-outside="onClickOutside">
            <div v-for="(item, index) in userChatMessages" class="mediumtext">
              <div class="chatString">
                <div class="nickname">
                  {{item.username}}  
                </div>
                <div>
                  {{item.text}}            
                </div>            
              </div>
            </div>
          </el-main>
        </el-container>        
      </el-tab-pane>

      <el-tab-pane :label="this.$store.getters.role.role">
        <el-container class="chatWindow" v-bind:style="{height: this.chatHeight +'vh'}" >
          <el-main v-chat-scroll v-click-outside="onClickOutside">
            <div v-for="(item, index) in chatMessages" class="mediumtext">
              <div class="chatString">
                <div class="nickname">
                  {{item.username}}  
                </div>
                <div>
                  {{item.text}}            
                </div>            
              </div>
            </div>
          </el-main>
        </el-container>
      </el-tab-pane>

      <el-tab-pane label="System">System</el-tab-pane>
    </el-tabs>
    
    <!-- <div class='messages'>123</div> -->
    <div class="inputZone" v-on:keyup.enter="postingMes">
      <el-input size='mini'class="inputStroke" placeholder="сообщение в чат" v-model="input" ></el-input>
      <el-button size='mini' @click="postingMes">отправить</el-button>      
    </div>

  </div>
</template>

<script>
import vClickOutside from 'v-click-outside'
import axios from 'axios'
export default {
  directives: {
    clickOutside: vClickOutside.directive
  },
  data: function () {
    return {
      chatUserMessages: '',
      chatHeight: 14,
      exptime: '',
      input: '',
      userChatMessages: '',
      chatMessages: ''
    };
  },
  methods: {
    onClickOutside (event) {
      console.log('Clicked outside. Event: ', event)
      this.chatHeight = 14
    },
    checkRelevanceToken(){
      this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    },    
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
    getUserChat(){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      params: {
        clan: "user"
      }, 
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      })
      .then((response) => { 
        var total = response.data
        this.userChatMessages = total
      });      
    },    
    getChat(role){
      axios({
      method: 'get',
      url: '/api/v1/chat',
      params: {
        clan: role
      }, 
      headers: {
        'Authorization': 'bearer '+this.$store.getters.token.access
      } 
      })
      .then((response) => { 
        var total = response.data
        this.chatMessages = total
      });      
    }
  },
  watch: {
    exptime() {
      var trig = false;
      var self = this;
      if ((this.exptime > 0)&&(!trig)){
        self.getChat(this.$store.getters.role.role)
        self.getUserChat()
        var trig = true;     
      }
    }
  }, 
  mounted() { 
    var pusher = new Pusher('44697f69f1f93a53365c', {
      cluster: 'eu',
      forceTLS: true
    });
    var channel = pusher.subscribe('messages');
    var self = this;
    channel.bind(this.$store.getters.role.role, function(data) {
      self.addMessage(data);
    }); 
    var timer1 = setInterval(function(){
      self.checkRelevanceToken()
      if (self.exptime > 0){
        clearInterval(timer1) 
      }         
    },50 );       
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";

.chatHead{
  display: flex;
  flex-direction: row;
  height: 1.6em;
  div{
    padding: 0 0.5em;
    margin: 0 0.1em;
    background-color: #333;
  }
}
.nickname{
  color: #666;
  padding: 0 0.3em 0 0;
}
.chatString{
  display: flex;
  flex-direction: row;
}
.chatWindow{
  margin: 0.0em 0.2em;
  /*height: 80px; */
  border: 1px 
  solid #555;
}
.inputStroke{
  padding: 3px 0.0em 0 0;
}
.inputZone{
  /*padding: 0.2em 0em;*/
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