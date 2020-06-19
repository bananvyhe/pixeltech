<template>


  <div class="posts"  >
    <template v-for="(item, index) in this.$store.getters.role.role" class="mediumtext" v-if="item != 'lead' && item != 'elder'"> 
      <div v-if="$store.getters.role.role != 'client' && item != 'user'">
        <div class="headblock">   <div><h2 > &bull; {{item}} </h2></div></div>
        <div v-for="(itemch, index) in clanposts" v-if="itemch.clan_name == item">
          <showposta class="headertext" v-on:delpost="getPosts" :number='itemch.id' :body='itemch.body' :title='itemch.title' :username='itemch.username'></showposta>
        </div>
        <newposta class="headertext" v-on:newpost="getPosts" :section='item'></newposta>         
      </div>

    </template>
<!--     <div v-if="this.$store.getters.role.role != 'user'">
      <h2>Общий доступ</h2>
      <div v-for="(item, index) in userposts">
        <showposta class="headertext" v-on:delpost="getUserPosts" :number='item.id' :body='item.body' :title='item.title' :username='item.username'></showposta>
      </div>
      <newposta v-on:newpost="getUserPosts" :section='"user"'></newposta>
    </div> -->

  </div>
</template>

<script>
import Vembed from 'vue-embed';    
import axios from 'axios'
import Newpost from './newpost.vue'
import Showpost from './showpost.vue'
export default {
  name: 'post',
  components: {
    'newposta': Newpost,
    'showposta': Showpost,
    // 'v-embed': Vembed,
  },
  data: function () {
    return {
       
      options: {
        plugins: [
        // {
        //   name: 'emoji',
        //   options: {
        //     // regex: /emojiRegex/gi, // in case you want to define a custom regex
        //     // template(emojiName) {
        //     //   // optional template
        //     // }
        //   }
        // },
]
      },      
      exptime: '',      
      number: '',
			clanposts: [],
      userposts: []
    };
  },
  methods: {
    checkRelevanceToken(){
      this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    },
    getUserPosts() {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepost',
          params: {
            clan_name: 'user'
          }, 
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          })
          .then((response) => {
            console.log(response.data);
            this.userposts = response.data
          })
          .catch(function (error) {
            console.log(error);
          });             
      }       
    },
    getPosts() {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepost',
          params: {
            clan_name: this.$store.getters.role.role
          }, 
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          })
          .then((response) => {
            console.log(response.data);
             this.clanposts = response.data
          })
          .catch(function (error) {
            console.log(error);
          });             
      }       
    }

  },
  watch: {
    exptime() {
      var trig = false;
      var self = this;
      if ((this.exptime > 0)&&(!trig)){
        self.getPosts()
        self.getUserPosts()
        var trig = true;     
      }
    }
  }, 
  mounted() { 
    var self = this;     
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
/*@import "../../stylesheets/_variables";*/

.headertext{
  /*lost-utility: edit;*/
  display: flex;
   width: 100%;
  /*white-space: nowrap;*/
  overflow: hidden;
}
.posts {

   width: 100%;
  padding: 0 0.6em;
}


</style>