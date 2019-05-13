<template>
  <div class="hat">
  	<div class="fog"></div>
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
    },
    mounted() {
    			var tl2 = new TimelineMax({repeat:-1});
			tl2.to('.clouds', 90, {backgroundPositionX: 149, ease: Power0.easeOut});
    }


  }
 // 	(function(){

	// }());
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
	background-color: #13151a;
	@media (--only-small-screen) {
		height: 120px;
  }
 	@media (--only-xsmall-screen) {
		height: 80px;
  }

}
.fog {
	align-self: flex-end;	
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center bottom;
	height: 80%;
	width: 100%;

	position: absolute;
	background-image: url('./images/_hat/fog.jpg');

}
.warriors {
	z-index: 20;
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
	background-size: 30%  auto;
	height: 100%;
	width: 100%;
	@media (--only-xsmall-screen) {
		background-size: 65%  auto;
  }
  @media (--only-small-screen) {
		background-size: 55%  auto;
  }
  @media (--only-medium-screen) {
		background-size: 35%  auto;
  }
}
</style>