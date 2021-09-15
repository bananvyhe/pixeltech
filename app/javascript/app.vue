<template>
  <div  class="vmain">
    <v-app >
      <v-container
        class="py-0 px-0 app">
        <v-app-bar 
          height="42px"
          hide-on-scroll
          dense>
          <port></port>
          <div class="wrap" v-if="$store.getters.token == null" > 
            <request></request>
          </div>
          <v-spacer ></v-spacer>
          <gamebo></gamebo>
          <div class="wrap" v-if="$store.getters.token == null" > 
            <reg></reg>
          </div>            &#x20bd; {{ballance}}
          <div class="wrap">
            <log ></log>
             <div v-if="$store.getters.token == null" > {{$store.getters.token}} </div>
            <!-- |||||{{exptime}}++++{{errored}} -->
          </div>
        </v-app-bar>
      </v-container>
      <v-main>
        <div v-if="$store.getters.role">
                <div v-if="$store.getters.role == null"  class="heado">
          <heado></heado>
        </div>
        <!-- <topsidepanel></topsidepanel> -->
        <div v-if="$store.getters.role != 0 ">
          <!-- {{$store.getters.role }} -->
          <div v-if="$store.getters.role.role.includes('client') == true">

           <siteown></siteown>
            
          </div>
        </div>
        </div>
  
      </v-main>

      <v-container
      class="py-1 pb-0  px-0">
        <v-footer
        width="100%"
        class="appbar"
        v-bind="localAttrs"
        :padless="padless">
          <v-card
            flat
            tiless
            width="100%"
            class=" text-center">
            <v-card-text class="white--text">
              {{ new Date().getFullYear() }} — <strong>Pixeltech</strong>
            </v-card-text>
          </v-card>
        </v-footer>
      </v-container>
    </v-app>
  </div>
</template>
<script>
import axios from 'axios'  
  export default {
    data: function (){
      return {
        ballance:"",
        errored:'',
        exptime: '',
        icons: [
          'mdi-home',
          'mdi-email',
          'mdi-calendar',
          'mdi-delete',
        ],
        items: [
          'default',
          'absolute',
          'fixed',
        ],
        padless: false,
        variant: 'default',
          
      }
    },
    watch: {
      exptime() {
        if ((this.exptime < 20)&&(this.$store.getters.token.refresh )){
          this.refreshToken() 
        }else if ((this.exptime < 20)&&(!this.$store.getters.token.refresh )){
          this.nulltoken
        }else if ((this.exptime < 0)&&( checklog == 'unlogged')){
          this.nulltoken
        }
        var self = this;
        if ((self.exptime > 0)&&(!self.trig)){
          self.storeCommitGbData()
          self.getPkStatus()
          self.trig = true; 
           console.log('gamebo')   
        }       
      }
    }, 
    computed: {
      localAttrs () {
        const attrs = {}
        if (this.variant === 'default') {
          attrs.absolute = false
          attrs.fixed = false
        } else {
          attrs[this.variant] = true
        }
        return attrs
      },
    },      
    methods:{
      getBallance(){
        if (this.$store.getters.role) {
          axios({
          method: 'get',
          url: '/clients',
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          })
          .then((response) => {
            console.log(response.data)
            if (response.data){
              this.ballance = response.data 
            }
          })
          .catch(function (error) {
            console.log(error);
          });             
        }       
      },      
      nulltoken: function(){
        axios.delete('/users/sign_out', {
        }) 
        .then((response) => {  
          this.$store.commit('rolensend', null) 
          this.$store.commit('tokensend', null) 
          this.$store.commit('gamesend', null) 
          if (document.location.pathname != '/'){
            window.location.replace('/');
          }else{
            document.location.reload()
          }
        })
      },  
      storeCommitGbData(){
        if (this.$store.getters.role) {
          axios({
          method: 'get',
          url: '/gameboards',
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          })
          .then((response) => {
            console.log(response.data)
            if (response.data){
              this.$store.commit('gamesend', response.data.expirience )
              this.$store.commit('crysend', response.data.cry )
              this.$store.commit('deadsend', response.data.dead )
              this.$store.commit('killsend', response.data.kill )
            }
          })
          .catch(function (error) {
            console.log(error);
          });             
        }       
      },            
      getPkStatus(){
        if (this.$store.getters.gamebo){
          axios({
            method: 'get',
            url: '/api/v1/getPkStatus',
            params: {
            }, 
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            }           
          }).then((response) => { 
            if (response.data){
              this.pkstat = response.data
              var nowtime = response.headers.nowtime
              this.nowtime = nowtime
            }
          });         
        }
      },      
      refreshToken(){
        axios({
          method: 'post',
          url: '/api/v1/refr',
          headers: {
            'X-Refresh-Token': this.$store.getters.token.refresh
          }
          }).then((response) => {
          if (response.data.errors) {


          }else{
            this.$store.commit('tokensend', response.data)
            this.token = this.$store.getters.token 
            let jwtData = this.token.access.split('.')[1]
            let decodedJwtJsonData = window.atob(jwtData)
            let decodedJwtData = JSON.parse(decodedJwtJsonData)
            let role = decodedJwtData
            this.$store.commit('rolensend', role)
            this.accessToken = this.$store.getters.token.access
            console.log(this.$store.getters.role.exp) 
            let jwtData2 = this.accessToken.split('.')[1]
            let decodedJwtJsonData2 = window.atob(jwtData2)
            let decodedJwtData2 = JSON.parse(decodedJwtJsonData2)
            this.accessToken = decodedJwtData2
            let usid = decodedJwtData2.user_id

            console.log(decodedJwtJsonData2) 
            var current_time = new Date().getTime() / 1000;

            var millisecremains = this.$store.getters.role.exp - current_time

          }
        })
        .catch( error => {
          console.log('555')
            this.nulltoken()
        }); 
      },
      stopTimer() {
        clearTimeout(this.timer)
      },      
      exptimer() {
        var self = this
        setInterval(function(){ 
          self.checkRelevanceToken()
        },4000 );
      },
      checkRelevanceToken(){
        if (this.$store.getters.role){
          this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
        }
      },
    },
    mounted() {
       this.getBallance()
      //проверка условий на существования логина 
      if (!this.exptime){
        this.checkRelevanceToken()
        // console.log('mounted checkRelevanceToken')
        //проверка условия что имеется доступ и берется запрос
      }
      if (this.$store.getters.token != null) {
          this.exptimer();
          console.log('mounted exptimer')
        // axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.$store.getters.token.token;
        // let username =  decodedJwtData.username
        // this.$store.commit('username', username)
        // let exp = decodedJwtData.access_expires_at
        // this.$store.commit('expsend', acctokexp)
        // let usid = decodedJwtData.sub  
        // console.log(usid) 
        // if (self.$store.getters.token.refresh){
      }
    }
  }
</script>
<style scoped>
@import "stylesheets/_variables";
/*.app{
  position: relative;
  z-index: 9999;
}*/
.appbar{
  /*lost-center: $lcenter;*/
}
.vmain{
  /*lost-center: $lcenter;*/
}
.heado{
  display: flex;
  /*overflow: visible;*/
  align-items: justify;
  justify-content: center;
  height: 100%;

  /*background-color: #dad;*/
}

.test{
  background-color: #dad;
}
.plash{

  /*background-color: #ada;*/
  position: relative;
 height: 100%;
}
.app{
  /*background-color: #dad;*/
  /*background-color: var(--v-background-base) !important;*/
}
  .v-app-bar{
  /*float: left;*/
  
}
.topsidepanel{
  margin-top: 4em;
  /*background-color: #dad;*/
}
</style>