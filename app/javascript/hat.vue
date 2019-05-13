<template>
  <div class="hat fog">
  	<div class="clouds"></div>
  	<div class="warriors"></div>
</div>
</template>
<script>
 
  export default {
    
    data: function (){
      return {
        
      }
    },
    methods: {
      

    }
  }
</script>
<style scoped>
@import "_variables";
@import "_extends";
.hat {
	display: flex;
	align-items: stretch;
	position: relative;
	lost-center: $lcenter;
	/*lost-utility: edit;*/
	height: 162px;
	@media (--only-small-screen) {
		height: 120px;
  }
 	@media (--only-xsmall-screen) {
		height: 80px;
  }
}
.fog {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	background-image: url('./images/_hat/fog.jpg');
}
.warriors {
	background-repeat: no-repeat;
	background-position: center bottom;
	background-size: contain;
	height: 100%;
	width: 100%;
	background-image: url('./images/_hat/warriors.gif');
	@media (--only-1600more-screen) {
		background-size: auto 90%;
    background-position: center 25px;
  }
  @media (--only-medium-screen) {
		background-size: auto 100%;
    background-position: center 25px;
  }
  @media (--only-small-screen) {
		background-size: auto 100%;
    background-position: center 25px;
  }
}
.clouds {  
	background-repeat: repeat-x;
	position: absolute;
	background-image: url('./images/_hat/clouds.png');
	background-position: center top;
	background-size: 35%  auto;
	height: 100%;
	width: 100%;
	@media (--only-xsmall-screen) {
			background-size: 65%  auto;
  }
}
</style>