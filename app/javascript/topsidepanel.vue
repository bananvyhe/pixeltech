<template>
	<div  class="topside"v-bind:style="styleObject"> {{this.$store.getters.token}}
		<div v-if="$store.getters.token != null">{{this.$store.getters.role.username}} &nbsp;&nbsp;Ваш текущий статус: {{this.$store.getters.role.role}}<br>Ацесс токен: {{this.$store.getters.token.access}} -- Истекает через: {{ this.$store.getters.token.access_expires_at }}<br> Рефреш токен: {{this.$store.getters.token.refresh}} -- Истекает через: {{timeConversion(this.$store.getters.role.exp)}}</div> 
		<div v-if="$store.getters.token == null" > 
      <reg></reg>
    </div>
		<div>
			<log></log>
		</div>
  </div>
</template>
<script>
	import axios from 'axios'
	
	// var state = {
	// 	token: localStorage.getItem("token")
	// }

	// let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	// axios.defaults.headers.common['X-CSRF-Token'] = token
	// axios.defaults.headers.common['Accept'] = 'application/json'
	let screenwidth = {value: ''}
	export default {
		data() {
			return {
	    	token: '',
	    	refreshToken: '',
	    	} 
	  },
	  computed: {
    	styleObject: function () {
       	var tok = this.$store.getters.token
        if (tok != null) {
        	return {
        		position: 'relative'
        	}
         	
       	}else{
         	return {
        		position: 'absolute'
        	}
       	}
      }
	  },
	  methods: {
	  	timeConversion: function (millisec){
	  		console.log(millisec)
	  		var current_time = new Date().getTime() / 1000;
	  		
	  		var millisecremains = millisec - current_time
	  		console.log(millisecremains)
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
	  mounted() {
	  	function timeConversion(millisec) {

       
		    }
	  	if (this.$store.getters.token != null) {
	  		console.log('dgdgdsdgas43342523521')
	  		// axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.$store.getters.token.token;
	  		
			


				// let username =  decodedJwtData.username
				// this.$store.commit('username', username)
				// let exp = decodedJwtData.access_expires_at
				// this.$store.commit('expsend', acctokexp)
				// let usid = decodedJwtData.sub	
				// console.log(usid)  
				this.refreshToken = this.$store.getters.token.refresh
				
				let jwtData2 = this.refreshToken.split('.')[1]
				let decodedJwtJsonData2 = window.atob(jwtData2)
				let decodedJwtData2 = JSON.parse(decodedJwtJsonData2)
				this.refreshToken = decodedJwtData2
				let usid = decodedJwtData2.user_id
				// let exp2 = decodedJwtData2.exp 
				// this.$store.commit('expsend2', exp2)
				console.log(decodedJwtJsonData2) 
				var current_time = new Date().getTime() / 1000;
				if (current_time > this.$store.getters.role.exp) { 
					// this.$store.commit('tokensend', null) 
					// axios.delete('/users/sign_out', {
			  //   }).then((response) => {
	    //   		window.location.href = '/';
		   //  	}) 
		    		axios.post('/api/v1/refr', {
		    			headers: {
			  				'Authorization': "bearer " + this.$store.getters.token.access
							},   
		    			usernameid: usid,

		        	// headers: {'Authorization': "bearer " + this.$store.getters.token.token}
		        	 
		       
		       
			    }).then((response) => {

	      		if (response.data.errors) {
		    		console.log(response.data.errors)
		    		this.error = response.data.errors;
		    	}else{
		    		  this.$store.commit('tokensend', response.data),
 
				    		// this.$store.commit('loginUser');
				  		// const token = resp.data.token
				  		// localStorage.setItem('user-token', token)
				    	location.reload(true);

				    }

		    	}) 
					console.log('expired token') 

				}
				// if (current_time + (this.$store.getters.exp/2)  > this.$store.getters.exp) { 
				// 	this.$store.commit('tokensend', null) 
				// 	axios.delete('/users/sign_out', {
			 //    }).then((response) => {
	   //    		window.location.href = '/';
		  //     	// location.reload(true);
		  //   	}) 
				// 	console.log('expired token') 

				// }

	  	}
	  }
	}
	//подсчет ширины вьюпорта и отправление в переменную
	 
</script>
<style scoped>
@import "_variables";
@import "_extends";
.topside { 
	z-index: 4000;
	lost-flex-container: row;
	position: absolute;
	right: 0;
	padding: 0.35em;
}

 
</style>
