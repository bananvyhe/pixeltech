<template>
	<div>
		<div class="smalltext main bpad" v-bind:style="styleObject"> 
			<div class="logohead" >
				<div v-if="!$store.getters.role">
					Voodoo team basecamp
				</div>
					<div v-if="$store.getters.role">
						<div v-if="$store.getters.role.role == 'client'">
							Site-hosting
						</div>
						<div v-if="$store.getters.role.role == 'user'">
							<game-board></game-board> 
						</div>
						<div v-if="$store.getters.role.role == 'voodoo'">
							<game-board></game-board>  
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
					<div>&nbsp;&nbsp; Истекает через: 
						<!-- {{timeConversion(this.$store.getters.role.exp)}} -->
					</div>{{exptime}}
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
	  components: {
    'game-board': {
    	template: '<div><span class="largertext">{{$store.getters.role.username}}</span>&nbsp;<span v-if="$store.getters.gamebo.expirience != null">&nbsp;Loa:&nbsp;{{$store.getters.gamebo.expirience}}</span><span v-if="$store.getters.role.karma != null">карма:{{$store.getters.role.karma}}</span></div>'
    	}
    },
	  computed: {
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
        		height: '5em'
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
		    		  var current_time = new Date().getTime() / 1000;
				  		var millisecremains = self.$store.getters.role.exp - current_time
				  		self.exptime = millisecremains
				    	// location.reload(true);
				    }
		    	})
	      },self.exptime*1000 );			
	  	}
	  }
	}
	//подсчет ширины вьюпорта и отправление в переменную
</script>
<style scoped>
@import "_variables";
@import "_extends";
.hiderailsblock {
	display: none;
}
.main {
	height: 5em;
	lost-column: 1/1 flex; 
	z-index: 4000;
	lost-flex-container: row;
}
/*.topside { 
	position: absolute;
	right: 0;
	padding: 0.35em;
}*/
.logohead{
	lost-column: 1/3; 
	align-self: center;
	padding: 0 1em;
}
.maininfo {
	padding: 0.3em 0.5em;
	align-self: center;
	lost-column: 2/3; 
	lost-flex-container: row;
	justify-content: flex-end;
	.info {
		align-self: center;
		padding: 0 1em;
	}
}
</style>
