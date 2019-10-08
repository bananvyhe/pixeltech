<template>
  <div class=" ">
    {{number}}{{post}}
  </div>
</template>

<script>
import axios from 'axios'
export default {
  props:['number'],
  data: function () {
    return {
			post: ''
    };
  },
  mounted(){
    this.getPost()
  },
  methods: {
    getPost() {
      if (this.$store.getters.token.access) {
        axios({
          method: 'get',
          url: '/api/v1/vuepostshow',
          params: {
            id: this.number
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