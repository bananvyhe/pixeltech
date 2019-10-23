<template>
  <div class="">
    <div>
      <div type="text" @click="handleClick">{{this.title}} {{this.body}} {{this.username}}</div>
      <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false">
        <div>{{post}}</div>  
        {{postComm}}
        <br><br>

        <div v-for="(item, index) in postComm">
          <div v-if='item.parent_id == null'>
            <div style="background: #222; margin: 0.1em 0;">
              {{item.id}} {{item.body}} parent_id:{{item.parent_id}} <br><span style="background: #333;">commentable_id:{{item.commentable_id}}</span> <br>{{item.created_at}}        
            </div>            
          </div>
          <!-- <div v-if='item.parent_id != null'> -->
            <div style="background: #115;" v-if="item.comments">
              {{item.comments}}
            </div>
          <!-- </div> -->
        </div>
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
			post: '',
      postComm: []
    };
  },
  mounted(){
    // this.getPost(this.number)
  },
  methods: {
    handleClick(){
      this.dialogVisible = true 
      this.getPost(this.number) 
      this.getComments(this.number) 
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
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
 

</style>