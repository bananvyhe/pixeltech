<template>
  <div class="lobby"> 
    <!-- {{users}} -->
    <div class="headlobby"><h4>пул клана</h4> </div>
    
    <div class="item"> 
      <!-- {{users}} -->
      <el-button-group class="users" v-for="(item, index) in data" v-model="radio" size="mini" >
        <!-- <el-badge :value="item.id" class="mark" size="small"> -->
          <el-popover
            placement="bottom"
            width=""
            trigger="hover"
             >
            <div class="userinterface ">
              <div  >
                  <el-button label="2" border size="mini"  class="aprior">Сообщение</el-button>
              </div>
              <div >
                <el-tooltip  v-if="$store.getters. cry >= 100" placement="top">
                  <div slot="content"  class="smalltext notif"><i>плюс в карму<br>+7 открывают<br> возможности лидера</i> 
                  </div>
                  <el-button type="warning"  label="4" border size="mini"  class="aprior"> + </el-button>
                </el-tooltip>
              </div>
              <div>
                <el-tooltip  v-if="$store.getters. cry >= 100" placement="top">
                  <div slot="content"  class="smalltext notif">минус в карму
                  </div>
                  <el-button type="warning"  label="3" border size="mini"  class="aprior"> - </el-button>
                </el-tooltip>
              </div>
              <div>
                <el-tooltip  v-if="$store.getters. cry >= 100" placement="top">
                  <div slot="content"  class="smalltext notif"> <span style="color: green;">стоимость 500 камней</span> <br> <i> нейтрализует оппонента <br> <span style="color: red;">ваша карма будет испорчена</span> </i> </div>
                  <el-button type="danger" label="1" border size="mini" class="aprior pk" @click='kill(item)'> 
                    ПК 
                  </el-button>
                </el-tooltip>
                <el-button v-else  type="danger" label="1" border size="mini"  disabled class="aprior"> 
                  ПК 
                </el-button>
              </div>
              <div>
                <!-- <el-radio label="2" border disabled>Option B</el-radio> -->
              </div>      
            </div>
          <el-button slot="reference" class="user" :label="item.id" border>{{item.username}}</el-button>
        </el-popover>
        <!-- </el-badge> -->
      </el-button-group>
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
    kill(event) {
      // console.log(event.id);
      axios({
        method: 'post',
        url: '/gameboards#kill',
        data: {
          killid: event.id
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 

      })
    },
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
          // console.log(response.data)
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
@import "stylesheets/_typography";

.notif {
  text-align: center;
  line-height: 1.4em;
}
.userinterface {
  padding: 0 0.2em;
  margin: -0.9em;
  display: flex;
  flex-direction: row;
  div {
   padding: 0.2em 0.0em ;
  }
}
.user {
  margin: 0.2em 0.3em;
}
.users {
  display: flex;
  padding: 0.2em -0.0em;
  margin: 0 -0.15em;
}
.item {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  padding: 0.2em 1em;
  
}
.headlobby {
  display: flex;
  justify-content: center;
}
.lobby {
  /*background-color: #ada;*/
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 2em;
  lost-center: $lostCenter;
}

</style>