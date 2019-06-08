<template>
  <div class="hat">
  	<div class="fog"></div>
  	<div class="flash"></div>
  	<div class="clouds"></div>
  	<div class="warriors"></div>
	</div>
</template>
<script>
 
  export default {
    data: function (){
      return {
      	repDelay: 8
        
      }
    },
    methods: {
    },
    mounted() {
    	var tlwar = new TimelineMax();
    	tlwar.from('.warriors', 1.2, {backgroundPositionY: 150, ease: Power2.easeOut}, '+=0.8');
    	 
    	var tl2 = new TimelineMax({repeat:-1});
			tl2.to('.clouds', 3, {backgroundPositionX: 1149, ease: Expo.easeOut});

			var repDelay = 8;
			var firsFlash = 0.05;
			var flashTime = 0.5;

			// var repDelay = 8;
			// var self = this;
			// function randomize() {
			// 	var min = 3.0
			// 	var max = 12.0
			// 	var repDelay = Math.random() * (max - min) + min;
			// 	self.repDelay =  Math.round(repDelay)
			// 	console.log(repDelay)
			// }

			var tlfl = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tlfl.to('.warriors', firsFlash, {css:{className:'+=brightness'}}, '+=2.6')
			.to('.warriors', 0.05, {css:{className:'-=brightness'}})
			.to('.warriors', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			.to('.warriors', 0.05, {css:{className:'-=brightness'}})
			.to('.warriors', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			.to('.warriors', 0.05, {css:{className:'-=brightness'}});

			var tlfl1 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tlfl1.to('.clouds', firsFlash, {css:{className:'+=brightness'}}, '+=2.6')
			.to('.clouds', 0.05, {css:{className:'-=brightness'}})
			.to('.clouds', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			.to('.clouds', 0.05, {css:{className:'-=brightness'}})
			.to('.clouds', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			.to('.clouds', 0.05, {css:{className:'-=brightness'}});
 
			var tldn1 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tldn1.set('.flash', {visibility: "hidden"})
			.to('.flash', firsFlash, {visibility: "visible"}, '+=2.6')
			.to('.flash', 0.05, {visibility: "hidden"})
			.to('.flash', flashTime, {visibility: "visible"}, '+=0.05')
			.to('.flash', 0.05, {visibility: "hidden"})
			.to('.flash', flashTime, {visibility: "visible"}, '+=0.05')
			.to('.flash', 0.05, {visibility: "hidden"});
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
	border-bottom: 4px solid color( #1E1E21 shade(30%));
	border
	@media (--only-small-screen) {
		height: 120px;
  }
 	@media (--only-xsmall-screen) {
		height: 100px;
  }

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
.fog {
	align-self: flex-end;	
	background-repeat: no-repeat;
	background-size: contain;
	/*background-size: 80% auto;*/
	background-position: center bottom;
	height: 100%;
	width: 100%;
	position: absolute;
	background-image: url('./images/_hat/fog.jpg');
}
.brightness{
	filter: brightness(25%);
}
.flash {
 	/*visibility: hidden;*/
	position: absolute;
	height: 100%;
	width: 100%;
	background-repeat: no-repeat;
	background-position: center bottom;
	background-size: cover;
	background-image: url('./images/_hat/flash.jpg');
	@media (--only-1600more-screen) {
    background-position: center -20px;
  }
  @media (--only-medium-screen) {
    background-position: center -20px;
  }
}
.dvis {
	visibility: visible;
}
.clouds {  
	background-repeat: repeat-x;
	position: absolute;
	background-image: url('./images/_hat/clouds.png');
	background-position: center top;
	background-size: 40%  auto;
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