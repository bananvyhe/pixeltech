<template>
	<div id="bpad">
	 <!-- {{exp}} -->
		<div class="overbpad">
		<!-- {{exptime}} -->
		<div class="bpad smalltext" v-bind:style="styleObject"> 
			<div class="logohead">
				<!-- {{exptime}} --> 
				<div class="voodoo1" v-if="!$store.getters.role">
					<div class="basecamp">
						<!-- Cyber team -->
					</div>&nbsp;&nbsp;
					<!-- <div class="swing"> -->
					<request class="request"></request>
					<!-- </div> -->
					&nbsp;&nbsp;
					<div class="basecamp1">
						<el-popover
				    placement="bottom"
				    width="100"
				    trigger="click">

					    <div style="text-align: center;">
					    	<a target="_blank" href="https://impuls-psy.ru">impuls-psy.ru</a>
					    </div>
		
						<!-- 	<el-button size="mini" slot="reference">сайты</el-button> -->
						</el-popover>
					</div>
				</div>
					<div v-if="$store.getters.role" >
						<div v-if="$store.getters.role.role == 'client'">
							Site-hosting
						</div>
<!-- 						<div v-if="$store.getters.role.role == 'user'">
							<game-board ></game-board> 
						</div> -->
						<div class="backbar "  v-if="$store.getters.role.role.find(item => item  == 'voodoo') == 'voodoo' || $store.getters.role.role.find(item => item  == 'user') == 'user'">
							<div class="mediumtext nikname">{{$store.getters.role.username}}</div>
							<div class="expbar"> 
								<!-- <span v-if="$store.getters.gamebo.expirience != null">&nbsp;Loa:&nbsp;{{$store.getters.gamebo.expirience}}</span>&nbsp;&nbsp; -->

								<div class="expline">
									<!-- v-if="$store.getters.gamebo" -->
									<el-progress v-if="$store.getters.gamebo" class="elpro aprior " :stroke-width="3" :percentage="Number(lvlConversion[1])"></el-progress>
								</div>
								<div v-if="$store.getters.gamebo" class="lvl">{{lvlConversion[0]}}&nbsp;</div>
								<span v-if="$store.getters.role.karma != null">карма:{{$store.getters.role.karma}}</span>
							</div>
							<!-- <game-board :expresult="lvlConversion"></game-board>   -->
						</div>
					</div>
					<div v-if="($store.getters.gamebo) && ($store.getters.pk == false)" class="crytop">
						<!-- камни: &nbsp;{{$store.getters.cry}} -->
						<inv class="invclass" v-if="$store.getters.role"></inv>
					</div> 
					<div v-else>
						<div v-if="($store.getters.gamebo) && ($store.getters.pk == true)">
							<el-button v-if="pkstat.exptime < nowtime" type="success" size='mini' icon="el-icon-switch-button"   @click="res">       
	        		</el-button>
							<el-button v-else type="success" size='mini' icon="el-icon-switch-button"   disabled>       
	        		</el-button>							
						</div>
        		<!-- {{pkstat}}{{nowtime}}{{$store.getters.pk}} -->
					</div>
					<div v-if="$store.getters.token == null">
						<div v-if="checklog != 'unlogged' ">
							{{nulltoken}}
						</div>
					</div>
				</div>
			<div class="maininfo">
				<div v-if="$store.getters.token != null" class="info wrap">
					<!-- {{this.$store.getters.role.username}} 
					&nbsp;&nbsp;Ваш текущий статус: {{this.$store.getters.role.role}}
					<br>Ацесс токен: {{this.$store.getters.token.access}}
					<br> -- Истекает через: {{ this.$store.getters.token.refresh_expires_at }}
					<br> Рефреш токен: {{this.$store.getters.token.refresh}}
					<br><br> -->

					<div>права: {{$store.getters.role.role}}</div>
					<div>
						<!-- &nbsp;&nbsp; Истекает через:  -->
						<!-- {{timeConversion(this.$store.getters.role.exp)}} -->
					</div>
					<!-- {{exptime}} -->
				</div> 
				<div class="wrap" v-if="$store.getters.token == null" > 
			    <reg></reg>
			  </div>
				<div class="wrap">
					<log class="wrap"></log>
				</div>
			</div>
	  </div>
	  </div>
  </div>

</template>
<script>

	import Inv from './components/inventory.vue';
	import axios from 'axios'
	let screenwidth = {value: ''}
	export default {
		data() {
			return {
				trig: false,
				nowtime: '',
				pkstat: '',
				isOpen: false,
				exptime: '',
				checklog: checklog,
	    	token: '',
	    	accessToken: '',
	   		exp: this.$store.getters.gamebo
	    } 
	  },
		components: {
			'inv': Inv
		},
	  computed: {
	  	lvlConversion: function () {
	  		var exp = this.$store.getters.gamebo
	  		if (exp > 0 && exp <= 68){
	  			var total = 68;
	  			var calcproc = exp - 0;
	  			var result = calcproc/total*100
	  			return [1,result.toFixed(2)];
	  		}else if(exp > 68 && exp <= 369){
	  			var total = 295;
	  			var calcproc = exp - 68;
	  			var result = calcproc/total*100
	  			return [2,result.toFixed(2)];
	  		}else if(exp > 369 && exp <= 1168){
	  			var total = 805;
	  			var calcproc = exp - 369;
	  			var result = calcproc/total*100
	  			return [3,result.toFixed(2)];
	  		}else if(exp > 1168 && exp <= 2884){
	  			var total = 1716;
	  			var calcproc = exp - 1168;
	  			var result = calcproc/total*100
	  			return [4,result.toFixed(2)];
	  		}else if(exp > 2884 && exp <= 6038){
	  			var total = 3154;
	  			var calcproc = exp - 2884;
	  			var result = calcproc/total*100
	  			return [5,result.toFixed(2)];
	  		}else if(exp > 6038 && exp <= 11287){
	  			var total = 5249;
	  			var calcproc = exp - 6038;
	  			var result = calcproc/total*100
	  			return [6,result.toFixed(2)];
	  		}else if(exp > 11287 && exp <= 19423){
	  			var total = 8136;
	  			var calcproc = exp - 11287;
	  			var result = calcproc/total*100
	  			return [7,result.toFixed(2)];
	  		}else if(exp > 19423 && exp <= 31378){
	  			var total = 11955	;
	  			var calcproc = exp - 19423;
	  			var result = calcproc/total*100
	  			return [8,result.toFixed(2)];
	  		}else if(exp > 31378 && exp <= 48229){
	  			var total = 16851;
	  			var calcproc = exp - 31378;
	  			var result = calcproc/total*100
	  			return [9,result.toFixed(2)];
	  		}else if(exp > 48229 && exp <= 71202){
	  			var total = 22973;
	  			var calcproc = exp - 48229;
	  			var result = calcproc/total*100
	  			return [10,result.toFixed(2)];
	  		}else if(exp > 71202 && exp <= 101677){
	  			var total = 30475;
	  			var calcproc = exp - 71202;
	  			var result = calcproc/total*100
	  			return [11,result.toFixed(2)];
	  		}else if(exp > 101677 && exp <= 141193){
	  			var total = 39516;
	  			var calcproc = exp - 101677;
	  			var result = calcproc/total*100
	  			return [12,result.toFixed(2)];
	  		}else if(exp > 141193 && exp <= 191454){
	  			var total = 50261;
	  			var calcproc = exp - 141193;
	  			var result = calcproc/total*100
	  			return [13,result.toFixed(2)];
	  		}else if(exp > 191454 && exp <= 254330){
	  			var total = 62876;
	  			var calcproc = exp - 191454;
	  			var result = calcproc/total*100
	  			return [14,result.toFixed(2)];
	  		}else if(exp > 254330 && exp <= 331867){
	  			var total = 77537;
	  			var calcproc = exp - 254330;
	  			var result = calcproc/total*100
	  			return [15,result.toFixed(2)];
	  		}else if(exp > 331867 && exp <= 426288){
	  			var total = 94421;
	  			var calcproc = exp - 331867;
	  			var result = calcproc/total*100
	  			return [16,result.toFixed(2)];
	  		}else if(exp > 426288 && exp <= 540000){
	  			var total = 113712;
	  			var calcproc = exp - 426288;
	  			var result = calcproc/total*100
	  			return [17,result.toFixed(2)];
	  		}else if(exp > 540000 && exp <= 675596){
	  			var total = 135596;
	  			var calcproc = exp - 540000;
	  			var result = calcproc/total*100
	  			return [18,result.toFixed(2)];
	  		}else if(exp > 675596 && exp <= 835862){
	  			var total = 160266;
	  			var calcproc = exp - 675596;
	  			var result = calcproc/total*100
	  			return [19,result.toFixed(2)];
	  		}else if(exp > 835863 && exp <= 920357){
	  			var total = 84495;
	  			var calcproc = exp - 835863;
	  			var result = calcproc/total*100
	  			return [20,result.toFixed(2)];
	  		}else if(exp > 920357 && exp <= 1015431){
	  			var total = 95074;
	  			var calcproc = exp - 920357;
	  			var result = calcproc/total*100
	  			return [21,result.toFixed(2)];
	  		}else if(exp > 1015431 && exp <= 1123336){
	  			var total = 107905;
	  			var calcproc = exp - 1015431;
	  			var result = calcproc/total*100
	  			return [22,result.toFixed(2)];
	  		}else if(exp > 1123336 && exp <= 1246808){
	  			var total = 123472;
	  			var calcproc = exp - 1123336;
	  			var result = calcproc/total*100
	  			return [23,result.toFixed(2)];
	  		}else if(exp > 1246808 && exp <= 1389235){
	  			var total = 142427;
	  			var calcproc = exp - 1246808;
	  			var result = calcproc/total*100
	  			return [24,result.toFixed(2)];
	  		}else if(exp > 1389235 && exp <= 1554904){
	  			var total = 165669;
	  			var calcproc = exp - 1389235;
	  			var result = calcproc/total*100
	  			return [25,result.toFixed(2)];
	  		}else if(exp > 1554904 && exp <= 1749413){
	  			var total = 194509;
	  			var calcproc = exp - 1554904;
	  			var result = calcproc/total*100
	  			return [26,result.toFixed(2)];
	  		}else if(exp > 1749413 && exp <= 1980499){
	  			var total = 231086;
	  			var calcproc = exp - 1749413;
	  			var result = calcproc/total*100
	  			return [27,result.toFixed(2)];
	  		}else if(exp > 1980499 && exp <= 2260321){
	  			var total = 279822;
	  			var calcproc = exp - 1980499;
	  			var result = calcproc/total*100
	  			return [28,result.toFixed(2)];
	  		}else if(exp > 2260321 && exp <= 2634751){
	  			var total = 374430;
	  			var calcproc = exp - 2260321;
	  			var result = calcproc/total*100
	  			return [29,result.toFixed(2)];
	  		}else if(exp > 2634751 && exp <= 2844287){
	  			var total = 209536;
	  			var calcproc = exp - 2634751;
	  			var result = calcproc/total*100
	  			return [30,result.toFixed(2)];
	  		}else if(exp > 2844287 && exp <= 3093068){
	  			var total = 248781;
	  			var calcproc = exp - 2844287;
	  			var result = calcproc/total*100
	  			return [31,result.toFixed(2)];
	  		}else if(exp > 3093068 && exp <= 3389496){
	  			var total = 296428;
	  			var calcproc = exp - 3093068;
	  			var result = calcproc/total*100
	  			return [32,result.toFixed(2)];
	  		}else if(exp > 3389496 && exp <= 3744042){
	  			var total = 354546;
	  			var calcproc = exp - 3389496;
	  			var result = calcproc/total*100
	  			return [33,result.toFixed(2)];
	  		}else if(exp > 3744042 && exp <= 4169){
	  			var total = 425860;
	  			var calcproc = exp - 3744042;
	  			var result = calcproc/total*100
	  			return [34,result.toFixed(2)];
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
						
					}
		    })
	  	},
    	styleObject: function () {
      }
	  },
	  watch: {
		 	exp() {
		 		console.log('exp')
		 	},
	    exptime() {
	    	if ((this.exptime < 20)&&(this.$store.getters.token.refresh )){
	    		this.refreshToken() 
 				}else if ((this.exptime < 20)&&(!this.$store.getters.token.refresh )){
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
	  methods: {
	  	res(){
	      axios({
	        method: 'post',
	        url: '/api/v1/ressurect',
	        headers: {
	          'Authorization': 'bearer '+this.$store.getters.token.access
	        } 	        
	      }).then((response) => { 
	      	this.$store.commit('pksend', false )
	      });
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
	      .catch(function (error) {
	          location.reload(true);
	    	}); 
	  	},
	  	stopTimer() {
      	clearTimeout(this.timer)
    	},
    	checkRelevanceToken(){
    		if (this.$store.getters.role){
    			this.exptime = this.$store.getters.role.exp - new Date().getTime()/1000
    		}
    	},
    	//чекает как там дела со свежестью токена каждые 4сек
	  	exptimer() {
	  		var self = this
		  	setInterval(function(){	
		  		self.checkRelevanceToken()
		  	},4000 );
	  	},
	  	timeConversion: function (millisec){
	  		var current_time = new Date().getTime() / 1000;
	  		var millisecremains = millisec - current_time
	  		this.exptime = millisecremains

	  		var seconds = (millisecremains ).toFixed(1);
        var minutes = (millisecremains / (  60)).toFixed(1);
        var hours = (millisecremains / (  60 * 60)).toFixed(1);
        var days = (millisecremains / (  60 * 60 * 24)).toFixed(1);

        if (seconds  < 60) {
          return seconds + " Sec";
        } else if (minutes < 60) {
            return minutes + " Min";
        } else if (hours < 24) {
            return hours + " Hrs";
        } else {
          return days + " Days"
        }
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
		          this.$store.commit('pksend', response.data.pk )							
						}


	        })
	        .catch(function (error) {
	          console.log(error);
	    		}); 						
		  	}		  	
		  },		  
	  },

	  updated() {

	  },
	  created() {

	  },
	  mounted() {
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
	//подсчет ширины вьюпорта и отправление в переменную
</script>
<style scoped>
@import "stylesheets/_variables";
@import "stylesheets/_extends";
.backbar {
	    border-radius: 0.3em;
	background-color: color( #1E1E21 shade(6%));
	padding: 0.3em 0.4em 0.3em;
	margin: 0.2em 0;
}
.elpro {
	/*padding: 0.5em 0 0;*/
	font-size: 11px;
	color: $str5;
}
.crytop {
 display: flex;
 justify-content: center;
 /*align-self: flex-start;*/
 align-items: center;
 /*padding: 0.1em;*/
}
/*.hat {
	height: 440px;
}*/
/*.item {
	clear: both;
}*/
.voodoo1 {
	position: relative;
	display: flex;
	
}
.basecamp, .basecamp1 {
	align-self: center;
}
.basecamp {position: relative;
	justify-content: center;
/*  @media (--only-small-screen) {
		display: none;
  }	
  @media (--only-xsmall-screen) {
		display: none;
  }	  */
}
.request {position: relative;
/*  -webkit-animation: pulsate-fwd 3s ease-out infinite both;
  animation: pulsate-fwd 3s ease-out infinite both; */
}
.swing {
  -webkit-animation: swing-fwd 3s ease-out infinite both;
  animation: swing-fwd 3s ease-out infinite both; 
}
@-webkit-keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  30% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  100% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
}
@keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  30% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  100% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
}
@-webkit-keyframes swing-fwd {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  15% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  20% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }
  25% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  30% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }   
  35% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  40% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }           
  45% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }  
  100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
}
@keyframes swing-fwd {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  15% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  20% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }
  25% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  30% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }   
  35% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  40% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }           
  45% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }  
  100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
}
.nikname {
	width: 100%;
	color: $color-1;
	text-align: right;
	padding-right: 0.4em;
	/*padding-bottom: 0.2em;*/
}
.lvl, .expbar {
	margin-top: -0.2em;
}
.lvl {
	line-height: 1.1;
	box-shadow: inset 0px 0px 4px rgba(0,0,0,0.8);
	padding-right: 0.3em;
	display: flex;
	justify-content: flex-end;
	/*border: 1px solid grey;*/
	position: relative;
 	color: $str5;
	/*border-radius: 0.7em;*/
	height: 1.1em;
	width: 2.6em;
	background-color: color( #1E1E21 shade(6%));
 	
	margin-top: 0.9em;
	margin-left: -3.5em;
	/*padding: 0 0.2em 0 0.1em;*/
 	display: flex;
	align-self: center;

}
.expbar { 
	 
	adjust-font-size: fs medium;
	display: flex;
	 
}
/deep/ .expline {
	width: 8em;
}
#bpad{ 
	/*position: relative;*/
	overflow: visible;
	position: sticky;
	z-index: 6000;
	margin-bottom: -3.3em;
	
   top: 0;
	/*height: $topBlank;*/
	/*z-index: 800;*/
 

	/*background-color: color( #1E1E21 shade(30%));*/
	/*display: flex;*/
 justify-content: space-between;
		lost-center: $lcenter;
}
.overbpad{
	width: 100%;
	display: flex;
}
.bpad { 
	width: 100%;
	padding: 0.1em;
	/*border-bottom: 2px solid $color-blue;*/
 	display: flex;
	/*position: sticky;*/
	/*top: 0em;  */
	z-index: 6000;
	
            
	/*height: 2.6em;*/
	
	/*height: $topSizePanel;*/
	/*z-index: 10;*/

	/*background-color: color( #1E1E21 shade(46%));*/
}
.hiderailsblock {
	display: none;
}
/*.main {
	position: fixed;
	height: $topSizePanel;
	z-index: 10;
	display: flex;
	align-items: center;
}*/
.logohead{

	position: relative;
	/*z-index: 50;*/
	display: flex;
	align-items: center;
	lost-column: 1/2 2 0em; 
	/*align-self: center;*/
	padding: 0.1em 1.3em 0em;
	@media (--only-small-screen) {
		lost-column: 1/2 2 0em; 
  }
  @media (--only-xsmall-screen) {
		lost-column: 2/5 2 0em; 
		padding: 0.1em 0.3em 0em;
  }
}
.invclass {
	/*background-color: #dad;*/
	padding-left: 0.0em;
	z-index: 5000;
	position: relative;

}
.maininfo {
	z-index: 5000;
	/*position: fixed;*/
/*	top: 0.5em;
	right: 0.5em;*/
	/*z-index: 49;*/
	overflow-x: auto;
	white-space: nowrap;
	padding: 0 0.4em;

	/*align-self: center;*/
	lost-column: 1/2 2 0em; 
	lost-flex-container: row;
	justify-content: flex-end;
	align-items: center;
	@media (--only-small-screen) {
		lost-column: 1/2 2 0em; 
  }
  @media (--only-xsmall-screen) {
		lost-column: 3/5 2 0em; 
  }
	.info {
		display: flex;
		 background-color: color( #1E1E21 shade(6%));
		padding: 0.3em 0.5em;
	}

}
.wrap {
	padding: 0.1em 0.1em;
	display: inline-block;
}
/*.topside { 
	position: absolute;
	right: 0;
	padding: 0.35em;
}*/
 

 
</style>
