<template>
  <div class=" ">
    {{ userposts }}
    <div v-for="(item, index) in userposts">
                {{item.title}} {{item.body}}
    </div>
    <showpost :number='number'></showpost>
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
      number: 2,
			userposts: []
    };
  },
  methods: {
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
  mounted() {
    var self = this;
    setTimeout(function(){
      self.getPosts()
    },4800 ); 
  }
}
</script>

<style scoped>
@import "stylesheets/_variables";


</style>