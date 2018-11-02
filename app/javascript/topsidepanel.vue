<template>
	<div class="topside">
		<div v-if="$store.getters.token != null">{{this.$store.getters.username}} &nbsp;&nbsp;Ваш текущий статус: {{this.$store.getters.role}}<br>Ацесс токен: {{this.$store.getters.token.token}} -- Истекает через: {{timeConversion(this.$store.getters.exp)}}<br> Рефреш токен: {{this.$store.getters.token.refreshToken}} -- Истекает через: {{timeConversion(this.$store.getters.exp2)}}</div>
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
	  methods: {
	  	timeConversion: function (millisec){
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
	  		axios.defaults.headers.common['Authorization'] = 
                                'Bearer ' + this.$store.getters.token.refreshToken;
	  		this.token = this.$store.getters.token.token
	  		let jwtData = this.token.split('.')[1]
				let decodedJwtJsonData = window.atob(jwtData)
				let decodedJwtData = JSON.parse(decodedJwtJsonData)
				let role = decodedJwtData.role
				this.$store.commit('rolensend', role)
				let username = decodedJwtData.username
				this.$store.commit('username', username)
				let exp = decodedJwtData.exp
				this.$store.commit('expsend', exp)
				let usid = decodedJwtData.sub	
				console.log(usid)  
				this.refreshToken = this.$store.getters.token.refreshToken
				
				let jwtData2 = this.refreshToken.split('.')[1]
				let decodedJwtJsonData2 = window.atob(jwtData2)
				let decodedJwtData2 = JSON.parse(decodedJwtJsonData2)
				let exp2 = decodedJwtData2.exp 
				this.$store.commit('expsend2', exp2)

				var current_time = new Date().getTime() / 1000;
				if (current_time > this.$store.getters.exp) { 
					// this.$store.commit('tokensend', null) 
					// axios.delete('/users/sign_out', {
			  //   }).then((response) => {
	    //   		window.location.href = '/';
		   //  	}) 
		    		axios.post('/api/v1/refresh', {
		    			usernameid: usid
		        	
		        // password_confirmation: this.form.password_confirmation
		       
			    }).then((response) => {
	      		if (response.data.errors) {
		    		console.log(response.data.errors)
		    		this.error = response.data.errors;
		    	}else{
		    		  this.$store.commit('tokensend', response.data)
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
	lost-flex-container: row;
}
 
</style>
