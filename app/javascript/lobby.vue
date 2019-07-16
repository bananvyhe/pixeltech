<template>
  <div class="lobby"> 
    <h4>Выбор лидера:</h4>
    <div class="item"> 
      <!-- {{users}} -->
      <el-radio-group class="users" v-for="(item, index) in data" v-model="radio" size="mini" >
        <!-- <el-badge :value="item.id" class="mark" size="small"> -->
          <el-popover
            placement="bottom"
            width=""
            trigger="focus">
            <div class="userinterface">
              <div>
                <el-radio label="2" border>Голосовать</el-radio>
              </div>
              <div>
                <el-radio label="1" border disabled>Убить</el-radio>
              </div>

              <div>
                  <!-- <el-radio label="2" border disabled>Option B</el-radio> -->
            </div> 
            
        
            </div>
          <el-radio slot="reference" class="user" :label="item.id" border>{{item.username}}</el-radio>
        </el-popover>
        <!-- </el-badge> -->
      </el-radio-group>
    </div>
     <!-- <h5>нераспредлеленные пользователи</h5> -->
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      radio: '1',
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
          id: grname.id,
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
.userinterface {
      display: flex;
    flex-direction: row;
  div {

    margin: 0.3em 0.3em;
  }
}
.user {
  
  margin: 0.2em 0.3em;
}
.users {
  display: flex;
  padding: 0.2em 0.5em;
}
.item {
  display: flex;
  flex-wrap: wrap;
  padding: 0.2em 1em;
  
}
.lobby {
  /*background-color: #ada;*/
  padding: 2em;
  lost-center: $lostCenter;
}

</style>