<template>
  <div class="lobby"> 
    <h4>Формирование кланов:</h4>
    <div class="item">

      <!-- {{users}} -->
      <div  class="users" v-for="(item, index) in data">
        <div>
          {{item.username}}
        </div> 
      </div>
    </div>
     <h5>новые пользователи</h5>
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
        data.push({
          username: grname.username,
 
        });
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
.users {
  padding: 0em 0.5em;
}
.item {
  display: flex;
  padding: 0.2em 1em;
  
}
.lobby {
  padding: 2em;
  lost-center: $lostCenter;
}

</style>