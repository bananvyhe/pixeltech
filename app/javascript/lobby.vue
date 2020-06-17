<template>
  <!-- <div class="lobby" v-if="$store.getters.pk == false"> -->
    <div class="lobby" v-if="$store.getters.dead == false">
      <!-- {{liveusers}} -->
    <div class="headlobby"><h4>пул клана</h4> </div>
    
    <div class="item"> 
      <!-- {{users}} -->
      <!-- {{liveusers}}<br><br> -->
      <!-- {{data}}  -->
      <el-button-group class="users"  size="mini" >
        <div v-for="(item, index) in liveusers" :key="item.id" >

          <el-popover
            placement="bottom"
            width=""
            trigger="hover"
            >
            <userinfo :ref="item.id" ></userinfo>
            <el-button v-if="item.dead == false" slot="reference" class="user" border>
              <div class="item" @mouseover="mouseOverUser(item.id)" v-bind:style="item.karma > 0 ? 'color: red;' : ''">
                {{item.username}}
              </div> 
            </el-button>        
          </el-popover>


          <el-dialog
            title="Вы уверены?"
            :visible.sync="dialogVisible"
            width="25em"
            >
            <div class="plashka2">противник теряет 4% опыта</div>
            <div slot="footer"  class="uiframe">
              <el-button @click="dialogVisible = false">Отмена</el-button>
              <el-button :label="item.user_id" type="primary" @click="kill(pkid)" >Подтвердить</el-button>
            </div>
            <div slot="footer" class="footpostshow basetext font3">
              &nbsp;
            </div>
          </el-dialog>

          </div>
      </el-button-group>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import userinfo from './components/userinfo.vue'

export default {

  data: function () {
    return { 
      exptime: '',

      pkid: '',
      dialogVisible: false,
      radio: '1',
      users: '',
      data: [],
      liveusers: []
    };
  },

  mounted(){
    var self = this;     
    var timer1 = setInterval(function(){
      self.checkRelevanceToken()
      if (self.exptime > 0){
        clearInterval(timer1) 
      }         
    },50 );  
    // setTimeout(function(){
    // },4800 ); 
  },
  components: {
    'userinfo': userinfo
  },  
  watch: {
    exptime() {
      var trig = false;
      var self = this;
      if ((this.exptime > 0)&&(!trig)){
        self.getUsers()  
        var trig = true;     
      }
    }
  }, 
  computed: {
  },
  methods: {
    // ...mapMutations([
    //   'crysendplus'
    // ]),
    checkRelevanceToken(){
      this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    },
    mouseOverUser(ref){
      // console.log(ref)
      this.$refs[ref][0].getInfoUser(ref)
    //   axios({
    //     method: 'get',
    //     url: '/api/v1/userinfo',
    //     headers: {
    //       'Authorization': 'bearer '+this.$store.getters.token.access
    //     }, 
    //     params: {
    //       user_id: id
    //     }
    //   })
    //   .then((response) => {        
    //     var totalplus = response.headers.userplus
    //     var arrsizeminus = response.headers.arraysizemin
    //     var totalminus = response.headers.usermin
    //     var arrsizeplus = response.headers.arraysizeplus
    //     var userkarma = response.headers.userkarma
    //     this.userminus = totalminus
    //     this.minusvotes = arrsizeminus
    //     this.userplus = totalplus
    //     this.plusvotes = arrsizeplus
    //     this.userkarma = userkarma
    //   });
    },
    vote(id){
      axios({
        method: 'post',
        url: '/api/v1/vote',
        data: {
          minus: id
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        this.mouseOverUser(id)
      })
    },
    voteplus(id){
      axios({
        method: 'post',
        url: '/api/v1/vote',
        data: {
          plus: id
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        this.mouseOverUser(id)
      })
    },
    // username(event) {
    //   for (let i = 0; this.data[i]; i++) {
    //     if (this.data[i].id == event){
    //       return this.data[i].username
    //     }
    //   }
     
    // },
    pkconfirm(event) {
      this.dialogVisible = true;
      this.pkid = event
    },
    kill(event) {
      this.crysendplus({
        amount: -100
      })
      this.dialogVisible = false;
      let pos = 0
      this.liveusers.forEach(function(item, index, object) {
        console.log(event);
        console.log(item);
        console.log(object);

        if (item.id == event) {
          object.splice(pos, 1);
        }
        if (item.id != event) {
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
     
      // axios({
      //   method: 'get',
      //   url: '/api/v1/lobbyall',
      //   headers: {
      //     'Authorization': 'bearer '+this.$store.getters.token.access
      //   } 
      //   })
      //   .then((response) => { 
      //     var alld = response.data
      //     this.users = alld
      //     this.data = []
      //     this.datavalue = []
      //     var self = this
      //     for (let i = 0; alld[i]; i++) {
      //       const data = [];
      //       const grname = alld[i]
      //       console.log(grname)
      //       data.push({
      //         username: grname.username,
      //         id: grname.id,
      //       });
      //       self.data = self.data.concat(data)
      //     }      
      //   });
      }
    }
  }

</script>

<style scoped>
@import "stylesheets/_variables";
@import "stylesheets/_typography";
.uiframe{
  padding: 0.5em 0 0;
}

.item {
  margin: -0.5em -1em;
}
.userinfo {
  display: flex;
   margin: -0.9em 0;
  padding: 1em;
}

.user {
  padding: 0.9em;
  margin: 0.2em 0.2em;
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
  padding: 0em 2em 2em;
  lost-center: $lostCenter;
}

</style>