<template>
  <div >
    
      <div type="text" @click="handleClick">{{this.title}} {{this.body}} {{this.username}}</div>
      <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false" :width="calcul">
        <div class="dialogframe">
          <div class="plashka2">{{post.body }}</div>
          <div></div>  
          <!-- {{postComm}} -->
   
          
          <div v-for="(item, index) in postComm" class="comm-area plashka2">
            <div v-if='item.parent_id == null'>
              <!-- {{typeof item.comments}} -->
              <tree :tree-data="item"></tree>
            </div>
          </div>


          <!-- <div v-for="(item, index) in postComm">
            <div v-if='item.parent_id == null'>
              <div style="background: #222; margin: 0.1em 0;">
                {{item.id}} {{item.body}} parent_id:{{item.parent_id}} <br><span style="background: #333;">commentable_id:{{item.commentable_id}}</span> <br>{{item.created_at}}
              </div>            
            </div>
            <div v-if="item.comments != 0">
              <div style="background: #115;">
                {{item.comments}}
              </div>
            </div>
          </div> -->
          </div>
          <div slot="footer" class="footpostshow basetext font3">
            {{post.username}}
          </div>
        
      </el-dialog>
    
    
  </div>
</template>

<script>
let screenwidth = {value: ''}
function parseCalc() {
  let screenw = document.body.clientWidth;
  screenwidth.value = document.body.clientWidth;
}
window.addEventListener('resize', _.throttle(parseCalc, 100));
import axios from 'axios'
import Tree from "./tree";
export default {
  props:['number', 'body', 'title', 'username'],
  data: function () {
    return {
      screenwidth: screenwidth,
      dialogVisible: false,
			post: '',
      postComm: ''
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
    handleClick(){
      parseCalc()
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
          // console.log( "тип");
          // console.log( typeof response.data);
          this.postComm = response.data
          console.log( this.postComm);
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
@import "stylesheets/_variables";
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