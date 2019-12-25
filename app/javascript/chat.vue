<template>
  <div class="chat">
    <el-container style="height: 80px; border: 1px solid #555">
      <el-main>123</el-main>
    </el-container>
    <!-- <div class='messages'>123</div> -->
    <el-input placeholder="сообщение в чат" v-model="input"></el-input>
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




  },
  watch: {

  }, 
  mounted() { 

  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
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