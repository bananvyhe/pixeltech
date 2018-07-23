<template>
  <div id="head">
  	<div class="contain basetext">
    <h2 class="title">{{ message }}</h2>
     <p class="subj">{{subj}}</p> 
     <h2 class="cont">{{cont}}</h2> 
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
    	subj: 'Разработка веб-приложений, сайтов на Ruby on Rails + Vue.js',
      message: "Pixeltech",
      cont: "admin@pixeltech.ru"
    }
  }
}
</script>
<style scoped>
@import "_variables";
#head {
	display: flex;
	height: 100vh;
	align-items: center;
	justify-content: center;
}
.contain {  
	position: relative;
	display: flex;
	flex-direction: column;
}
.title {
	display: flex;
	justify-content: center;
	padding: 1em 1em 0.3em 1em;
	color: $titleColor;
}
.subj {
	margin-bottom: spacing(0);
	display: flex;
  color: $titleColor;
	padding: 0em 0.5em 0 0.5em;
	align-self: center;
}
.cont {
	padding-top: 0.1em;
	text-align: center;
}


</style>
