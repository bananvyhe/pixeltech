<template>
  <div class="chat">
    <el-container class="chatWindow" style="">
      <el-main>123</el-main>
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
      input: ''
    };
  },
  methods: {
    postingMes: function(){
       axios({
        method: 'post',
        //vks#associate
        url: '/api/v1/chat',
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      })
    }



  },
  watch: {

  }, 
  mounted() { 

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
  padding: 0.2em;
}
.inputZone{
  display: flex;
  flex-direction: row;
}
.el-main {
  /*background-color: #E9EEF3;*/
  /*color: #333;*/
  text-align: center;
  line-height: 160px;
}
.messages{
  padding: 0.2em 0.5em;
}
.chat {
  /*background-color: #dad;*/
}


</style>