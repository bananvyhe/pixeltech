<template>
  <div id="head">
  	<div class="contain">
    <p class="title">{{ message }}</p>
     <p class="subj">{{subj}}</p> 
     <p class="subj">{{cont}}</p> 
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
.subj {display: flex;
  color: $titleColor;
	padding: 0em;
	align-self: center;
	font-size: 1em;
}
.title {
	display: flex;
	justify-content: center;
	padding: 1em 1em 0.3em 1em;
	color: $titleColor;
  font-size: 2em;
}
</style>
