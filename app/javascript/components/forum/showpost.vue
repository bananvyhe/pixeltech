<template>
  <div class="">
    <div>
      <div type="text" @click="handleClick">{{this.title}} {{this.body}} {{this.username}}</div>
      <el-dialog title="Shipping address" :visible.sync="dialogVisible">
        {{number}} {{post.title}} {{post.body}} {{post.username}}
      </el-dialog>
      
    </div>
    
  </div>
</template>

<script>
import axios from 'axios'
export default {
  props:['number', 'body', 'title', 'username'],
  data: function () {
    return {
      dialogVisible: false,
			post: ''
    };
  },
  mounted(){
    // this.getPost(this.number)
  },
  methods: {
    handleClick(){
      this.dialogVisible = true 
      this.getPost(this.number) 
    },
    getPost(par) {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepostshow',
          params: {
            id: par
          }, 
          headers: {
            'Authorization': 'bearer '+this.$store.getters.token.access
          } 
        })
        .then((response) => {
 
          this.post = response.data
        })
        .catch(function (error) {
          console.log(error);
        });             
      }       
    }
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";


</style>