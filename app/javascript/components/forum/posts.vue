<template>
  <div class=" ">
    <div v-for="(item, index) in userposts">
      <!-- {{item.title}} {{item.body}} -->
      <showpost :number='item.id'></showpost>
    </div>
    <!-- <showpost :number='number'></showpost> -->
    <newpost></newpost>
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
			userposts: []
    };
  },
  methods: {
    checkRelevanceToken(){
      this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    },
    getPosts() {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepost',
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
    }

  },
  watch: {
    exptime() {
      var trig = false;
      var self = this;
      if ((this.exptime > 0)&&(!trig)){
        self.getPosts()
        var trig = true;     
      }
    }
  }, 
  mounted() { 
    var self = this;     
    var timer1 = setInterval(function(){
      self.checkRelevanceToken()
      if (self.exptime > 0){
        var trig = true; 
        clearInterval(timer1) 
      }         
    },50 );     
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";


</style>