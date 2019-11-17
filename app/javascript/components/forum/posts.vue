<template>
  <div class="posts">
    <h2>Форум {{this.$store.getters.role.role}}</h2>
    {{clanposts}}
    <div v-for="(item, index) in clanposts">
      <!-- {{item.title}} {{item.body}} {{item.username}} -->
      <showpost :number='item.id' :body='item.body' :title='item.title' :username='item.title'></showpost>
    </div>
    <!-- <showpost :number='number'></showpost> -->
    <newpost :section='this.$store.getters.role.role'></newpost>

    <div v-if="this.$store.getters.role.role != 'user'">
      <h2>Общий доступ</h2>
      {{userposts}}
      <div v-for="(item, index) in userposts">
        <showpost :number='item.id' :body='item.body' :title='item.title' :username='item.title'></showpost>
      </div>
      <!-- <newpost :section='"user"'></newpost> -->
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Newpost from './newpost.vue'
import Showpost from './showpost.vue'
export default {
  components: {
    'newpost': Newpost,
    'showpost': Showpost
  },
  data: function () {
    return {
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
@import "stylesheets/_variables";
.posts {
  padding: 0 0.6em;
}


</style>