<template>
  <div class=" ">
    {{ userposts }}
    <div v-for="(item, index) in userposts">
                {{item.title}}
    </div>
  </div>
</template>

<script>
import axios from 'axios'
 
export default {

  data: function () {
    return {
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