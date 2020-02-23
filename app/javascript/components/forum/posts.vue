<template>
  <div class="posts" v-if="$store.getters.pk == false">
    <h2>Форум {{this.$store.getters.role.role}}</h2>
    <!-- {{clanposts}} -->
    <div v-for="(item, index) in clanposts">
      <!-- {{item.title}} {{item.body}} {{item.username}} -->
      <showposta class="headertext" v-on:delpost="getPosts" :number='item.id' :body='item.body' :title='item.title' :username='item.username'></showposta> 

<!--       <v-embed  :options="options">{{item.body}}</v-embed> -->
    </div>
    <!-- <showpost :number='number'></showpost> -->
    <newposta v-on:newpost="getPosts" :section='this.$store.getters.role.role'></newposta>

    <div v-if="this.$store.getters.role.role != 'user'">
      <h2>Общий доступ</h2>
      <!-- {{userposts}} -->
      <div v-for="(item, index) in userposts">
        <showposta class="headertext" v-on:delpost="getUserPosts" :number='item.id' :body='item.body' :title='item.title' :username='item.username'></showposta>
      </div>
      <newposta v-on:newpost="getUserPosts" :section='"user"'></newposta>
    </div>
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
        plugins: [{
          name: 'emoji',
          options: {
            // regex: /emojiRegex/gi, // in case you want to define a custom regex
            // template(emojiName) {
            //   // optional template
            // }
          }
        },
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
.posts {
  padding: 0 0.6em;
}


</style>