<template>
  <div class="lobby">
    {{users}}
    {{data}}
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      users: '',
      data: []
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
        this.data = []
        this.datavalue = []
        var self = this
        for (let i = 0; alld[i]; i++) {
          const data = [];
          const grname = alld[i]
          console.log(grname)
 
          self.data = self.data.concat(data)
 
        }      
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