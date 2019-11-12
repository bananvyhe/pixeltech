<template>
  <div>
    <div type="text" @click="handleClick">
      {{this.title}} {{this.body}} {{this.username}}{{this.number}}
    </div>
    <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false" :width="calcul">
      <div class="dialogframe">
        <div class="plashka2">{{post.body }}{{post.id }}</div>
        {{postComm}}
        <div v-for="(item, index) in postComm" class="comm-area plashka2">
          <div v-if='item.parent_id == null'>
            <!-- {{typeof item.comments}} -->
            <tree :tree-data="item"></tree>
          </div>
        </div>
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
			post: [],
      postComm: []
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
       // var self = this;
       // setTimeout(function(){
      this.getComments(this.number) 
       // },4800 ); 
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