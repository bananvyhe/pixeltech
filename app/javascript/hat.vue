<template>
  <div class="hat">

  	<div class="fog"></div>

  	<div class="flash"></div>
  	<div class="clouds2"></div>
  	  	<div class="bgshad"></div>
  	<div class="clouds"></div>

  	<div class="warriors"></div>
  	<div class="warriors brightness"></div>
  	  	<div class="bgshad2"></div>
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
    	tlwar.from('.warriors', 2.2, {backgroundPositionY: 140, ease: SlowMo.ease.config(0.3, 1.0, false)}, '+=0.5');
    	 
    	var tl2 = new TimelineMax({repeat:-1});
			tl2.to('.clouds', 1200, {backgroundPositionX: 903, ease: Power0.easeNone});

			var tl3 = new TimelineMax({repeat:-1});
			tl3.to('.clouds2', 80, {backgroundPositionX: -903, ease: Power0.easeNone});

			var repDelay = 8;
			var firsFlash = 0.05;
			var secondFlash = 0.05;
			var flashTime = 0.6;

			// var repDelay = 8;
			// var self = this;
			// function randomize() {
			// 	var min = 3.0
			// 	var max = 12.0
			// 	var repDelay = Math.random() * (max - min) + min;
			// 	self.repDelay =  Math.round(repDelay)
			// 	console.log(repDelay)
			// }



			// var tlfl1 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			// tlfl1.to('.clouds', firsFlash, {css:{className:'+=brightness'}}, '+=2.6')
			// .to('.clouds', 0.05, {css:{className:'-=brightness'}})
			// .to('.clouds', secondFlash, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.clouds', 0.05, {css:{className:'-=brightness'}})
			// .to('.clouds', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.clouds', 0.05, {css:{className:'-=brightness'}});

 		// 	var tlfl2 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			// tlfl2.to('.clouds2', firsFlash, {css:{className:'+=brightness'}}, '+=2.6')
			// .to('.clouds2', 0.05, {css:{className:'-=brightness'}})
			// .to('.clouds2', secondFlash, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.clouds2', 0.05, {css:{className:'-=brightness'}})
			// .to('.clouds2', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.clouds2', 0.05, {css:{className:'-=brightness'}});
			// var tldn1 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			// tldn1.set('.flash', {visibility: "hidden"})
			// .to('.flash', firsFlash, {visibility: "visible"}, '+=2.6')
			// .to('.flash', 0.05, {visibility: "hidden"})
			// .to('.flash', secondFlash, {visibility: "visible"}, '+=0.05')
			// .to('.flash', 0.05, {visibility: "hidden"})
			// .to('.flash', flashTime, {visibility: "visible"}, '+=0.05')
			// .to('.flash', 0.05, {visibility: "hidden"});
			// var tlfl = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			// tlfl.to('.warriors', firsFlash, {css:{className:'+=brightness'}}, '+=2.6')
			// .to('.warriors', 0.05, {css:{className:'-=brightness'}})
			// .to('.warriors', secondFlash, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.warriors', 0.05, {css:{className:'-=brightness'}})
			// .to('.warriors', flashTime, {css:{className:'+=brightness'}}, '+=0.05')
			// .to('.warriors', 0.55, {css:{className:'-=brightness'}}, '+=0.55');
			var tldn7 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tldn7.set('.brightness', {opacity: "0"})
			// .to('.brightness', firsFlash, {opacity: "1"}, '+=2.6')
			// .to('.brightness', 0.05, {opacity: "0"})
			.to('.brightness', secondFlash, {opacity: "1"}, '+=0.0')
			.to('.brightness', 3.5, {opacity: "0", ease: Expo.easeOut}, '+=0.0')
			.to('.brightness', firsFlash, {opacity: "1"}, '-=0.0')
			.to('.brightness', 4.0, {opacity: "0", ease: Expo.easeOut});	


			var tldn1 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tldn1.set('.flash', {opacity: "0"})
			// .to('.flash', firsFlash, {opacity: "1"}, '+=2.6')
			// .to('.flash', 0.05, {opacity: "0"})
			.to('.flash', secondFlash, {opacity: "1"}, '+=0.0')
			.to('.flash', 3.5, {opacity: "0", ease: Expo.easeOut}, '-=0.0')
			.to('.flash', firsFlash, {opacity: "1"}, '-=0.0')
			.to('.flash', 4.0, {opacity: "0", ease: Expo.easeOut});	



			var tldn5 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			tldn5.set('.clouds2', {visibility: "visible"})
			// .to('.clouds2', firsFlash, {visibility: "hidden"}, '+=2.6')
			// .to('.clouds2', 0.05, {visibility: "visible"})
			.to('.clouds2', secondFlash, {visibility: "hidden"}, '+=0.0')
			.to('.clouds2', 3.5, {visibility: "visible"}, '-=0.0')
			.to('.clouds2', firsFlash, {visibility: "hidden"}, '-=0.0')
			.to('.clouds2', 4.0, {visibility: "visible"});		

			// var tldn6 = new TimelineMax({repeat:-1, repeatDelay: repDelay});
			// tldn6.set('.clouds', {visibility: "visible"})
			// .to('.clouds', firsFlash, {visibility: "hidden"}, '+=2.6')
			// // .to('.flash', 0.05, {visibility: "hidden"})
			// .to('.clouds', secondFlash, {visibility: "hidden"}, '+=0.05')
			// .to('.clouds', 0.05, {visibility: "visible"})
			// .to('.clouds', flashTime, {visibility: "hidden"}, '+=0.05')
			// .to('.clouds', 0.05, {visibility: "visible"});		
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
	position: absolute;
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
	filter: brightness(35%);
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
	opacity: 0.5;
	background-repeat: repeat-x;
	position: absolute;
	background-image: url('./images/_hat/clouds.png');
	background-position: center -15px;
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
		background-size: 45%  auto;
  }
}
.clouds2 {  
	background-repeat: repeat-x;
	position: absolute;
	background-image: url('./images/_hat/clouds.png');
	background-position: center -15px;
	background-size: 90%  auto;
	height: 100%;
	width: 100%;
	@media (--only-xsmall-screen) {
		background-position: center 0px;
		background-size: 100%  auto;
  }
  @media (--only-small-screen) {
  	background-position: center 0px;
		background-size: 100%  auto;
  }
  @media (--only-medium-screen) {
		background-size: 95%  auto;
  }
}
.bgshad {
background: rgb(0,0,0);
background: linear-gradient(0deg,  rgba(9,66,121,0) 0%, rgba(6,45,82,0) 20%, rgba(0,0,0,0.8071603641456583) 100%);
	position: absolute;

	height: 100%;
	width: 100%;
}
.bgshad2 {
	z-index: 21;
background: rgb(0,0,0);
background: linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,0.1) 60%, rgba(0,0,0,0.2) 80%,rgba(0,0,0,0.3) 95%, rgba(0,0,0,0.4) 100%);
	position: absolute;
	height: 100%;
	width: 100%;
}
</style>