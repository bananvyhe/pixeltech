<template>
  <div>
    <div type="text" >
      <div class="itempost">
        <div class="posthead" @click="handleClick">
          <div>
            {{this.title}}             
          </div>
          <div class="mediumtext">
            {{this.body}}             
          </div>
          <div class="smalltext">
            {{this.username}}
          </div>
          <!-- {{this.number}} -->
        </div>
        <el-button v-if="$store.getters.role.username == this.username" @click="delpost(number)" type='danger' size='mini' icon="el-icon-delete" circle ></el-button>
      </div>
    </div>
    <el-dialog :title="this.title" :visible.sync="dialogVisible" :lock-scroll="false" :width="calcul">
      <div class="dialogframe">
        <div class="plashka2">{{post.body }}{{post.id }}</div>
        <div class="postnikname basetext font3">
          автор: {{post.username}}
        </div> 
        <!-- postComm{{postComm}} --> 
        <el-input
          type="textarea"
          :autosize="{ minRows: 4, maxRows: 8}"
          placeholder="написать комментарий"
          v-model="textarea2">
        </el-input> 
        <div v-for="(item, index) in postComm" class="comm-area plashka2">
          <div v-if='item.parent_id == null'>
            <!-- {{ item}} -->             
            <tree :tree-data="item"></tree>
          </div>
        </div>        
      </div>
      <div slot="footer" class="footpostshow basetext font3">

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
      textarea2: '',
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
      this.getComments(this.number) 
       // var self = this;
       // setTimeout(function(){
      
       // },4800 ); 
    },
    delpost(postId) {
      if (this.$store.getters.token.access) {
        axios.delete('/api/v1/vueposts/'+postId,{
 
          headers: {
            'Authorization': 'bearer '+this.$store.getters.token.access
          } 
        })
        .then((response) => {
          
        })
        .catch(function (error) {
          console.log(error);
        });             
      }       
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
.itempost{
  border-top-right-radius: 1em;
  border-bottom-right-radius: 1em;
  margin: 0.2em 0;
  justify-content: space-between;
  display: flex;
  flex-direction: row;
  background-color: color( $spacecadet shade(40%));
  /*background-color: $spacecadet;*/
}
.posthead{
  width: 100%;
  cursor: pointer;
  align-items: center;
  flex-direction: row;
  display: flex;
  padding: 0 0.2em;
  div{
    padding: 0em 0.3em;
  }
}
.postnikname{
  padding: 0 0 0.5em;
  float: right;
}
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