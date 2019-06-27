<template>
  <div class="lobby">
{{users}}
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {

    return {
      users: ''
    };
  },
  mounted(){
    this.getUsers()
  },
  watch: {


  }, 
  computed: {

  },
 
  mounted() {
    this.getUsers()
  },
  methods: {
  getUsers() {
    axios({
      method: 'get',
      url: '/api/v1/lobbyall',
      // params: {
      //   rait: this.value,
      //   pos: this.pos
      // } 
      })
      .then((response) => { 

        console.log(response.data)
        var alld = response.data
      
      // const data = [];
      this.users = alld
      
      // return data;
        // this.data = data;
      });
    }
  }
}

</script>

<style scoped>
@import "stylesheets/_variables";

.lobby {
  padding: 1em;
  lost-center: $lostCenter;
}

</style>