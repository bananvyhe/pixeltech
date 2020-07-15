<!-- :class="{ bgclass: activatorclass }" -->
<template>
	<div class="firstpagebg">
    <div  id="bg " :style="{'background-image': 'url('+require('./images/scheme.svg')+'?id='+Math.random()+')'}" class="bgan " :class="{ bgclass: activatorclass }">
      <div class="formsZone">
        <div v-if="$store.getters.token != null" >
        <!--   <el-button type="primary" plain size="small"   @click="nulltoken">Выйти</el-button> -->
        </div>
        <div v-else>
          <!-- <log class="log"></log>  -->
        </div> 
      </div>
    </div>
    <div id="head">	
    	<div class="contain ">
    		<div class="screen">  
      		<div class="title largetext" :class="{flickerin1: activatorclass}">
      			<vue-typer 
              caret-animation='smooth'
      				:text='[" Пикселтех","Pixeltech.ru"]'
      				:repeat='0' 
      				:pre-type-delay='1600'>
      			</vue-typer> 
      		</div>
    		</div>  
        <div class="offsubj">
           <div class="oversubj">
             <p class="subj basetext">{{subj}}
              <!-- <vue-typer 
              :pre-type-delay= '1000'
              :repeat='0'
              :text= "subj"
              :shuffle='true'>
              </vue-typer> -->
            </p> 
          </div>
        </div>
       
      	<div class="borcon">
      		<div  class="cont">
  					<div class="plashka tada"><div class="overpla"><p>{{cont}}</p></div></div>
  				</div> 
          <div class="formsZone">
            <div v-if="$store.getters.token == null" >
              <transition name="fade" appear>
               <!--  <reg class="reg"></reg> -->
              </transition> 
            </div>
          </div>
      	</div>
      </div>
    </div>
	</div>
</template>

<script>
import axios from 'axios'
import ScrambleText from 'scramble-text'; 
import { VueTyper } from 'vue-typer'
export default {
	components: {
		'vue-typer': VueTyper
	},
  data: function () {
    return {
    	activatorclass: false,
    	subj: 'Разработка умных сайтов, автоматизация бизнеса, индивидуальный поход, очень простая система администрирования',
      title: "Pixeltech",
      cont: " опыт разработки с 2001г."
    }
  },
  
  updated(){
  
  },
  mounted() {
   // var  cof = $(".bgan");
   //  if (cof.hasClass('bganjs')) {
   //    cof.removeClass("bganjs");
   //    cof.addClass("bganjs1");
   //  }
   //  setTimeout(function(){
   //     cof.removeClass("bganjs1");
   //    $(".bgan").addClass("bganjs");
   //  },1000 );
 
  var cont = document.querySelector(".overpla");
  var scrambleText = new ScrambleText( cont,
		{
			timeOffset : 150,
			// chars: [
			// 	'安','以','宇','衣','於',
			// 	'加','幾','久','計','己',
			// 	'左','之','寸','世','曽',
			// 	'太','知','川','天','止',
			// 	'奈','仁','奴','称','乃',
			// 	'波','比','不','部','保',
			// 	'末','美','武','女','毛',
			// 	'也','為','由','恵','与',
			// 	'良','利','留','礼','呂',
			// 	'和','遠','无'
			// ],
			callback: function () { 
				// self.activatorclass = true;
        $('.cont').addClass('tada');

				console.log( 'ended' ); 
			}}).play();
		this.tween();
		var self = this
    setTimeout(function(){
      // self.cropText();
       scrambleText.start();
    },8000 );


  },
  methods: {
    nulltoken: function (){
      
      axios.delete('/users/sign_out', {
        
      
      }) 
      this.$store.commit('tokensend', null) 
      location.reload(true);
    },
    onSubmit: function () {
      // axios.post('/users', {
      //   user: {
      //     email: this.email,
      //     password: this.password
      //   }
      // })
      // .then(response => {
      //   // whatever you want
      // })
      // .catch(error => {
      //   // whatever you want
      // })
    },
  	tween() {
      var selectedWork = new TimelineMax() ;
      selectedWork
      // .staggerFromTo('.oversubj', 1.5, {  
      //   scaleX: 0,
      //  	scaleY: 0, 
      //   // xPercent: -350,
      // }, {
      //  transformOrigin: '50% 50%',
      // 	  scaleX: 1,
      // 	scaleY: 0.02, 
      //   // autoAlpha:1,
      //   // xPercent: 0,
      //   ease:Circ.easeOut}, 0.4, "-=0.9")
      // .staggerFromTo('.oversubj', 0.4, {
	      
         
      //  	scaleY: 0.02, 
      //   // xPercent: -350,
      // }, {
      //  transformOrigin: '50% 50%',
      // 	  scaleY: 1,
      	 
      //   // autoAlpha:1,
      //   // xPercent: 0,
      //   ease: Expo.easeOut}, 0.3, "+=0.1")
      .staggerFromTo('.title', 0.4, {
	      // autoAlpha:0,
        // scaleX: 0.8,
       	scaleY: 0, 
        // xPercent: -350,
      }, {
       transformOrigin: '50% 50%',
      	// scaleX: 1,
      	scaleY: 1, 
        // autoAlpha:1,
        // xPercent: 0,
        ease:Expo.easeIn}, 0.5, "-=2.9")
       .staggerFromTo('.offsubj', 0.4, {
         // autoAlpha:0,
         // xPercent: 40,
         scaleY: 0,
      }, {
         // autoAlpha:1,
         scaleY: 1,
         // xPercent: 0,
        ease: Back.easeOut.config(1.7),}, 0, "+=0.5")
      .staggerFromTo('.oversubj', 1, {
         autoAlpha:0,
         // xPercent: 40,
         // scaleY: 0,
      }, {
         autoAlpha:1,
         // scaleY: 1,
         // xPercent: 0,
        ease: RoughEase.ease.config({ template:  Power0.easeNone, strength: 1, points: 20, taper: "none", randomize:  true, clamp: false}),}, 0, "+=0.25")
      .staggerFromTo('.plashka', 1, {
         autoAlpha:1,
         // xPercent: 40,
      }, {
         autoAlpha:1,
         // xPercent: 0,
        ease: RoughEase.ease.config({ template:  Power0.easeNone, strength: 1, points: 20, taper: "none", randomize:  true, clamp: false}),}, 0, "+=3.2")
      .staggerFromTo('.cont', 1.5, {
         autoAlpha:0,yPercent: -100,
         // xPercent: 40,
      }, {
         autoAlpha:1,yPercent: 0,
         // xPercent: 0,
        ease: Elastic.easeOut.config(0.3, 0.18),}, 0, "-=3.2");
  	}
  }
}
</script>
<style scoped>
@import "stylesheets/_variables";
@import "stylesheets/_extends";
.test {
  background: #dad;
}
/*.bganjs {
  background: url('./images/scheme.svg?id="+Math.random()');
}*/
.bganjs1 {
  background: url('./images/bg.png');
}
.formsZone{
   
}
/*.reg{
  margin-bottom: 0.0em;
  padding: 0.40em 0em 0 0em;
}*/
/*.log{
   padding: 0.5em 0.5em 0 0em;
}*/
.firstpagebg { 
  height: 100vh; display: flex;align-items: center;
 
}
.login { 
  background: #dad;
  height: 100px;
}
#head { 

  position: relative;
  
  /*lost-utility: edit;*/
  lost-center: 20em;
  /*height: 100vh;*/

  display: flex;
  align-items: stretch;
  @media (--only-xsmall-screen) {
    .screen { margin: 0 ;} 
     h2 {
      adjust-font-size: fs medium;
     }
  }
  @media (--only-small-screen) {
 
  }
  @media (--only-medium-screen) {
 
    h1 {
      margin-top: spacing(0);
    }
  }
  @media (--only-1600more-screen) {
 
    lost-center: 380px;
    h1 {
      margin-top: spacing(0);
    }
  }
}
.bgan { 
	/*opacity: 0.20;*/
	
	background-position: 50% 50%;
	background-repeat: no-repeat;
 
	background-size: 130% auto;
	position: absolute;
	height: 100vh;
	width: 100%;
  @media (--only-1600more-screen) {
    background-size: 75% auto;
    background-position: 49% calc(50% + 25px);
  }
  @media (--only-medium-screen) {
    background-size: 1350px auto;
    background-position: 52% calc(50% + 25px);
  }
	@media (--only-small-screen) {
 		background-size: 200% auto;
    background-position: 51% calc(50% + 25px);
  }
  @media (--only-xsmall-screen) {
 		background-size: 300% auto;
 		background-position: 50% calc(50% + 25px);
  }
}
.bgclass  {
  background-image: radial-gradient(ellipse 30% 70% at 50% top,rgba(255, 255, 255, 0.99) 0%,rgba(142, 212, 241, 0) 100.1%);
}
/* IE8- CSS hack */
@media \0screen\,screen\9 {
  .gradient {
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#fcffffff",endColorstr="#008ed4f1",GradientType=0);
  }
}

.contain {
  margin-bottom: 0%;
	width: 100%;
	padding-left: 0.6em; 
	padding-right: 0.6em; 
	/*overflow: hidden;*/
	position: relative;
}
.screen { 
 /* color: $isabelline;*/
  /* color: color($warningLine shade(80%));*/
	/*margin: 0 1em 0 1em;*/
	/*border-top-left-radius: 0.3em;
	border-top-right-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
	border-bottom-right-radius: 0.3em;
	overflow: hidden;
	@extend %screenbg;
	padding: 0em 1em 0.2em 0em;*/
	display: flex;
	justify-content: center;
}

.title { 
  width: 6.3em;
	font-size: 1.7em;
	text-align: left;
	line-height: 1.2em;
	padding: 0.2em 0.4em;
	vertical-align: top;
	margin-bottom: spacing(0.1); 
  
}

.oversubj {z-index: 1000;
  position: relative;

}
.subj {
  line-height: 1.2em;
  /*min-height: 5.5em;*/
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3) inset,
  0 0 30px rgba(0, 0, 0, 0.1) inset,
  0 0 20px rgba(0, 0, 0, 0.2) inset; 
  background: radial-gradient(at top, #FFFEFF, #A7CECC);
	border: 1px solid color($paleaqua shade(40%));
	border-radius: 0.2em; 
	/*background-color: color($isabelline shade(10%));*/
	/*margin-bottom: spacing(0);*/
/*	margin: 0.3em 0 0.1em 0;*/
	padding: 0.5em 0.5em 0.6em 0.8em;
  color:  color($warningLine blackness(80%));
}
.offsubj{
  background:  $siteBG;
  border-radius: 0.2em; 
  border: 1px solid color($HeadBackColor shade(0%));
}

.borcon {
	display: flex;
  justify-content: center;
}
.cont { 
  z-index: 1;
  position: relative;
  white-space: nowrap;
  overflow: hidden;
 /* border-bottom-right-radius: 0.1em;
  border-bottom-left-radius: 0.1em;
  border-top-right-radius: 0.1em;
  border-top-left-radius: 0.1em;*/
/*  background-color: #18231a;
  border-color: #279c1d;*/
  /*background-color: color($spacecadet blackness(20%));*/
  text-align: left;
	/*margin: 0 5em 0 5em;*/
	width: 13.4em;
/*@extend %screenbg;*/
	margin: 0.00em 0.4em 0 0em;
	p {
		margin-bottom: spacing(0);
		color: color($str4 shade(5%));
		padding: 0.2em 0em 0em 1.1em;
	}
	min-width: 7em;
}
.plashka {
 padding-bottom: 0.2em;
 /* border: 1px solid color($diamond shade(50%));*/
}
.overpla { 
  overflow: hidden;
  width: 14.4em;
}
.dotted {
  
  background-image: -webkit-repeating-radial-gradient(center center, rgba(0,0,0,.2), rgba(0,0,0,.2) 1px, transparent 1px, transparent 100%);
  background-image: -moz-repeating-radial-gradient(center center, rgba(0,0,0,.2), rgba(0,0,0,.2) 1px, transparent 1px, transparent 100%);
  background-image: -ms-repeating-radial-gradient(center center, rgba(0,0,0,.2), rgba(0,0,0,.2) 1px, transparent 1px, transparent 100%);
  background-image: repeating-radial-gradient(center center, rgba(0,0,0,.2), rgba(0,0,0,.2) 1px, transparent 1px, transparent 100%);
  -webkit-background-size: 3px 3px;
  -moz-background-size: 3px 3px;
  background-size: 3px 3px; 
}
.tada {
  animation: tada 0.8s cubic-bezier(0.455, 0.030, 0.515, 0.955) both;
 
}

@-webkit-keyframes tada {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }

  10%,
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
  }

  30%,
  50%,
  70%,
  90% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  }

  40%,
  60%,
  80% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  }

  to {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}

@keyframes tada {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }

  10%,
  20% {
    -webkit-transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(0.9, 0.9, 0.9) rotate3d(0, 0, 1, -3deg);
  }

  30%,
  50%,
  70%,
  90% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  }

  40%,
  60%,
  80% {
    -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
    transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  }

  to {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}




.shake-bottom {
  animation: shake-bottom 0.8s cubic-bezier(0.455, 0.030, 0.515, 0.955) both;
}
@keyframes shake-bottom {
  0%,
  100% {
    transform: rotate(0deg);
    transform-origin: 50% 100%;
  }
  10% {
    transform: rotate(2deg);
  }
  20%,
  40%,
  60% {
    transform: rotate(-4deg);
  }
  30%,
  50%,
  70% {
    transform: rotate(4deg);
  }
  80% {
    transform: rotate(-2deg);
  }
  90% {
    transform: rotate(2deg);
  }
}


.fade-enter-active, .fade-leave-active {
  transition: opacity 1.8s;
  transition-delay: 0s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
  opacity: 0;
}
.flickerin1 {
	-webkit-animation: flicker-in-1 2s linear both;
	        animation: flicker-in-1 2s linear both;
} 
/* ----------------------------------------------
 * Generated by Animista on 2018-7-24 14:32:43
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */

/**
 * ----------------------------------------
 * @animation flicker-in-1
 * ----------------------------------------
 */
@-webkit-keyframes flickerin1 {
 
}
@keyframes flicker-in-1 {
  0% {
    opacity: 1;
  }
  9.9% {
    opacity: 1;
 
  }
  10% {
    opacity: 1;
 
  }
  15.1% {
    opacity: 1;
  
  }
  15.2% {
    opacity: 0;
 
  }
  20% {
    opacity: 0;
 
  }
  20.1% {
    opacity: 0;
 
  }
  20.6% {
    opacity: 0;
 
  }
  30% {
    opacity: 0;
 
  }
  30.1% {
    opacity: 1;
 
  }
  30.5% {
    opacity: 1;
 
  }
  30.6% {
    opacity: 1;
 
  }
  45% {
    opacity: 1;
 
  }
  45.1% {
    opacity: 1;
 
  }
  50% {
    opacity: 1;
 
  }
  55% {
    opacity: 1;
 ;
  }
  55.1% {
    opacity: 1;
 
  }
  57% {
    opacity: 1;
 
  }
  57.1% {
    opacity: 0;
 
  }
  60% {
    opacity: 0;

  }
  60.1% {
    opacity: 0;
    box-shadow: none;
  }
  65% {
    opacity: 0;
 
  }
  65.1% {
    opacity: 1;
 
  }
  75% {
    opacity: 1;
 
  }
  75.1% {
    opacity: 0;
     
  }
  77% {
    opacity: 0;
     
  }
  77.1% {
    opacity: 1;
 
  }
  85% {
    opacity: 1;
 ;
  }
  85.1% {
    opacity: 0;
    
  }
  86% {
    opacity: 0;
 
  }
  86.1% {
    opacity: 1;
 
  }
  100% {
    opacity: 1;
     
  }
}
 

</style>
