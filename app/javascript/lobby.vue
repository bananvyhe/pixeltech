<template>
  <div class="lobby">
    <div class="headlobby"><h4>пул клана</h4> </div>
    
    <div class="item"> 
      <!-- {{users}} -->
      <el-button-group class="users" v-for="(item, index) in liveusers"  size="mini" >
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
                  <el-button type="danger" label="1" border size="mini" class="aprior pk" @click='pkconfirm'> 
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

            <el-button v-if="item.pk == false" slot="reference" class="user"    border>{{username(item.user_id)}}
            </el-button>            
 

          </el-popover>
          <el-dialog
            title="Вы уверены?"
            :visible.sync="dialogVisible"
            width="40%"
            >
            <span class="plashka2">противник теряет 4% опыта</span>
            <span slot="footer" >
              <el-button @click="dialogVisible = false">Отмена</el-button>
              <el-button :label="item.user_id" type="primary" @click="kill(item.user_id)" >Подтвердить</el-button>
            </span>
          </el-dialog>
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
      dialogVisible: false,
      radio: '1',
      users: '',
      data: [],
      liveusers: []
    };
  },
  mounted(){
    this.getUsers()
  },
  watch: {
  }, 
  computed: {


  },
 
  methods: {
    username(event) {
      for (let i = 0; this.data[i]; i++) {
        if (this.data[i].id == event){
          return this.data[i].username
 
        }
       }
     
    },
    pkconfirm() {
      this.dialogVisible = true;
    },
    kill(event) {
      this.dialogVisible = false;
      let pos = 0
      this.liveusers.forEach(function(item, index, object) {
        // console.log(event);
        // console.log(item);
        // console.log(object);

        if (item.user_id == event) {
          object.splice(pos, 1);
        }
        if (item.user_id != event) {
          pos += 1
          // console.log(pos);
          // console.log(item.user_id);
          // console.log(event);
        }

      });
      // console.log(event.id);
      axios({
        method: 'post',
        url: '/api/v1/kill',
        data: {
          killid: event
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 

      })
    },
    handleClose(done) {
        this.$confirm('Are you sure to close this dialog?')
          .then(_ => {
            done();
          })
          .catch(_ => {});
      },
    getUsers() {
      axios({
        method: 'get',
        url: '/api/v1/gameboard',
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
        // params: {
        //   rait: this.value,
        //   pos: this.pos
        // } 
        })
        .then((response) => { 
           
          var total = response.data
          this.liveusers = total
        });
     
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