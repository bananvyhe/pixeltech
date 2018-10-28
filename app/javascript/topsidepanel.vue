<template>
	<div class="topside">
		<div v-if="$store.getters.token != null">{{this.$store.getters.username}} &nbsp;&nbsp;Ваш текущий статус: {{this.$store.getters.role}} {{this.$store.getters.token}} ------ {{this.$store.getters.exp}} </div>
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
	    	} 
	  },
	  mounted() {
	  	if (this.$store.getters.token != null) {
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
