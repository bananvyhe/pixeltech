<template>
	<div id="bpad">
		<div class="smalltext main bpad" v-bind:style="styleObject"> 
			<div class="logohead">
				<div class="voodoo" v-if="!$store.getters.role">
					<div class="basecamp">Voodoo team basecamp</div>&nbsp;&nbsp;
					<!-- <div class="swing"> -->
						<request class="request"></request>
					<!-- </div> -->
					&nbsp;&nbsp;<div class="basecamp">разработка сайтов</div>
				</div>
					<div v-if="$store.getters.role">
						<div v-if="$store.getters.role.role == 'client'">
							Site-hosting
						</div>
<!-- 						<div v-if="$store.getters.role.role == 'user'">
							<game-board ></game-board> 
						</div> -->
						<div v-if="$store.getters.role.role == 'voodoo' || $store.getters.role.role == 'user'">
							<div><span class="largertext">{{$store.getters.role.username}}</span>&nbsp;&nbsp;</div> 
							<div class="expbar">
								
								<!-- <span v-if="$store.getters.gamebo.expirience != null">&nbsp;Loa:&nbsp;{{$store.getters.gamebo.expirience}}</span>&nbsp;&nbsp; -->
								<div class="lvl">lvl:{{lvlConversion[0]}}&nbsp;</div>
								<div class="expline">
									<el-progress class="elpro" :stroke-width="6" :percentage="lvlConversion[1]"></el-progress>
								</div>
								<span v-if="$store.getters.role.karma != null">карма:{{$store.getters.role.karma}}</span>
							</div>
							<!-- <game-board :expresult="lvlConversion"></game-board>   -->
						</div>
					</div>
					<div v-if="$store.getters.token == null">
						<div v-if="checklog != 'unlogged' ">
							{{nulltoken}}
						</div>
					</div>
				</div>
			<div class="maininfo">
				<div v-if="$store.getters.token != null" class="info">
					<!-- {{this.$store.getters.role.username}} 
					&nbsp;&nbsp;Ваш текущий статус: {{this.$store.getters.role.role}}
					<br>Ацесс токен: {{this.$store.getters.token.access}}
					<br> -- Истекает через: {{ this.$store.getters.token.refresh_expires_at }}
					<br> Рефреш токен: {{this.$store.getters.token.refresh}}
					<br><br> -->
					<div style="textAlign: center;">права: {{$store.getters.role.role}}</div>
					<div>
						<!-- &nbsp;&nbsp; Истекает через:  -->
						<!-- {{timeConversion(this.$store.getters.role.exp)}} -->
					</div>
					<!-- {{exptime}} -->
				</div> 
				<div v-if="$store.getters.token == null" > 
			    <reg></reg>
			  </div>
				<div>
					<log></log>
				</div>
			</div>
	  </div>
  </div>

</template>
<script>
	import axios from 'axios'
	let screenwidth = {value: ''}
	export default {
		data() {
			return {
				exptime: '',
				checklog: checklog,
	    	token: '',
	    	accessToken: '',
	    } 
	  },
	  // components: {
   //  'game-board': {
   //  	props: ['expresult'],
   //  	template: ''
   //  	}
   //  },
	  computed: {
	  	lvlConversion: function () {
	  		var exp = this.$store.getters.gamebo.expirience
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
		    	if (document.location.pathname != '/'){
						window.location.href = '/';
					}else{
						document.location.reload()
					}
 				//  this.$store.commit('tokensend', null) 
		    })
	  	},
    	styleObject: function () {
       	var tok = this.$store.getters.token
        if (tok != null) {
        	return {
        		position: 'relative'
        	}
       	}else{
         	return {
        		position: 'relative',
        		// height: '5em'
        	}
       	}
      }
	  },
	  methods: {
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
		  }
	  },
	  updated() {

	  },
	  mounted() {
	  	if (this.$store.getters.token != null) {
	  		// axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.$store.getters.token.token;
	  		// let username =  decodedJwtData.username
				// this.$store.commit('username', username)
				// let exp = decodedJwtData.access_expires_at
				// this.$store.commit('expsend', acctokexp)
				// let usid = decodedJwtData.sub	
				// console.log(usid) 
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
				// let exp2 = decodedJwtData2.exp 
				// this.$store.commit('expsend2', exp2)
				console.log(decodedJwtJsonData2) 
				var current_time = new Date().getTime() / 1000;
    		  var current_time = new Date().getTime() / 1000;
		  		var millisecremains = this.$store.getters.role.exp - current_time
		  		this.exptime = millisecremains
				var self = this;
				if (self.$store.getters.token.refresh){
	      setInterval(function(){
		    	axios({
	    			method: 'post',
	    			url: '/api/v1/refr',
	    			headers: {
		  				'X-Refresh-Token': self.$store.getters.token.refresh
						}
		        }).then((response) => {
	      		if (response.data.errors) {
			    		console.log(response.data.errors)
			    		self.error = response.data.errors;
		    		}else{
		    		  self.$store.commit('tokensend', response.data)
				    	// location.reload(true);
				    }
		    	})
		      //var current_time = new Date().getTime() / 1000;
		  		// var millisecremains = self.$store.getters.role.exp - current_time
		  		// self.exptime = millisecremains
	      },self.exptime*1000 );							
				}
	
	  	}
	  }
	}
	//подсчет ширины вьюпорта и отправление в переменную
</script>
<style scoped>
@import "_variables";
@import "_extends";
.voodoo {
	display: flex;
	
}
.basecamp {
	align-self: center;
}

.lvl {
display: flex;
align-self: center;
}
.expbar { 
	adjust-font-size: fs medium;
	display: flex;
	width: 220px;
}
/deep/ .expline {
	width: 120px;
}
#bpad{
	position: fixed;
	height: 2.4em;
	z-index: 3005;
	width: 100%;
	background-color: color( #1E1E21 shade(10%));
}
.bpad {
	height: 2.4em;
/*background-color: color( #1E1E21 shade(10%));*/
}
.hiderailsblock {
	display: none;
}
.main {
	position: fixed;
	height: $topSizePanel;
	lost-column: 1/1 flex; 
	z-index: 10;
	lost-flex-container: row;
}
/*.topside { 
	position: absolute;
	right: 0;
	padding: 0.35em;
}*/
.logohead{
	lost-column: 1/2; 
	align-self: center;
	padding: 0 1.3em;
}
.maininfo {
	padding: 0 1.3em;
	align-self: center;
	lost-column: 1/2; 
	lost-flex-container: row;
	justify-content: flex-end;
	.info {
		align-self: center;
		padding: 0 1em;
	}
}
</style>
