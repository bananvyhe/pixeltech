<template>
	<div>
		<div v-if="$store.getters.token == null" > 
      <reg></reg>
    </div>

    <log></log>
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
	    	 
	    } 
	  }
	}
	//подсчет ширины вьюпорта и отправление в переменную
	 
</script>
<style scoped>
@import "_variables";
@import "_extends";
 
</style>
