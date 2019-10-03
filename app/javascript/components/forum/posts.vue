<template>
  <div class=" ">
    {{ userposts }}
  </div>
</template>

<script>
import axios from 'axios'
 
export default {

  data: function () {
    return {
			userposts: ''
    };
  },
  methods: {
  },
  mounted() {
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
}
</script>

<style scoped>
@import "stylesheets/_variables";


</style>