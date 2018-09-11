мос<!-- :class="{ bgclass: activatorclass }" -->
<template>
	<div class="firstpagebg">
    <div class="bgan" :class="{ bgclass: activatorclass }" > </div>
 <!--    <div class="login"></div> -->
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
        <div class="oversubj">
      	<p class="subj basetext">
      		<vue-typer 
      		:pre-type-delay= '1000'
      		:repeat='0'
      		:text= "subj"
      		:shuffle='true'>
      		</vue-typer>
      	</p> 
        </div>
      	<div class="borcon">
      		<div  class="cont">
  					<div class="plashka" ><div class="overpla "><p>{{cont}}</p></div></div>
  				</div> <transition name="fade" appear><reg class="reg"></reg></transition>
      	</div>

      </div>
    </div>
	</div>
</template>

<script>
import ScrambleText from 'scramble-text'; 
import { VueTyper } from 'vue-typer'
export default {
	components: {
		'vue-typer': VueTyper
	},
  data: function () {
    return {
    	activatorclass: false,
    	subj: 'Разработка веб-приложений, сайтов на Ruby on Rails + Vue.js',
      title: "Pixeltech",
      cont: "admin@pixeltech.ru"
    }
  },
  mounted() {
  var cont = document.querySelector(".plashka");
  var scrambleText = new ScrambleText( cont,
		{
			timeOffset : 100,
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
				console.log( 'ended' ); 
			}}).play();
		this.tween();
		var self = this
    setTimeout(function(){
       
      // self.cropText();
       scrambleText.start();  

    },3000 );

	

		 
  },
  methods: {
    onSubmit: function () {
      axios.post('/users', {
        user: {
          email: this.email,
          password: this.password
        }
      })
      .then(response => {
        // whatever you want
      })
      .catch(error => {
        // whatever you want
      })
    },
  	tween() {
      var selectedWork = new TimelineMax() ;
      selectedWork

      .staggerFromTo('.plashka', 1, {
      	 
         yPercent: -200,
      }, {
         
        yPercent: 0,
        ease:Circ.easeOut}, 0, "-=4")
      .staggerFromTo('.oversubj', 1.5, {
	      
        scaleX: 0,
       	scaleY: 0, 
        // xPercent: -350,
      }, {
       transformOrigin: '50% 50%',
      	  scaleX: 1,
      	scaleY: 0.02, 
        // autoAlpha:1,
        // xPercent: 0,
        ease:Circ.easeOut}, 0.4, "-=0.9")
      .staggerFromTo('.oversubj', 0.4, {
	      
         
       	scaleY: 0.02, 
        // xPercent: -350,
      }, {
       transformOrigin: '50% 50%',
      	  scaleY: 1,
      	 
        // autoAlpha:1,
        // xPercent: 0,
        ease: Expo.easeOut}, 0.3, "+=0.1")
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
      .staggerFromTo('.oversubj', 1, {
         autoAlpha:0,
         yPercent: 100,
      }, {
         autoAlpha:1,
         yPercent: 0,
        ease:Power4.easeOut,}, 0, "-=12");
  	}
  }
}
</script>
<style scoped>
@import "_variables";
@import "_extends";

.firstpagebg {
  background: radial-gradient(circle at center, #3C6997  -5%, #003459 38%, #00171F 100%);
}
.login { 
  background: #dad;
  height: 100px;

}
#head { 
  position: relative;
  align-items: center;
  /*lost-utility: edit;*/
  lost-center: 19em;
  height: 100vh;
  display: flex;
  @media (--only-xsmall-screen) {
    .screen { margin: 0 ;}
    .cont { margin: 0;}
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
	opacity: 0.20;
	background: url('./images/scheme.svg');
	background-position: 50% 50%;
	background-repeat: no-repeat;
 
	background-size: 130% auto;
	position: absolute;
	height: 100%;
	width: 100%;
  @media (--only-1600more-screen) {
    background-size: 75% auto;
 background-position: 49% 46%;
  }
  @media (--only-medium-screen) {
    background-size: 1350px auto;
    background-position: 52% 44%;
  }
	@media (--only-small-screen) {
 		background-size: 200% auto;
    background-position: 51% 43%;
  }
  @media (--only-xsmall-screen) {
 		background-size: 300% auto;
 		background-position: 50% 40%;
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
.screen { color: $isabelline;
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
	padding: 0.0em 0.4em;
	vertical-align: top;
	margin-bottom: spacing(0); 
  
}

.oversubj {
}
.reg{
  margin-bottom: 0.3em;
  padding: 0.40em 0em 0 0em;
}
.subj {
  line-height: 1.5em;
  min-height: 5.5em;
  /*box-shadow: 0 0 40px rgba(0, 0, 0, 0.8) inset,
  0 0 30px rgba(0, 0, 0, 0.1) inset,
  0 0 20px rgba(0, 0, 0, 0.2) inset; */
  background: radial-gradient(at top, #FEFFFF, #A7CECC);
	border: 1px solid color($paleaqua shade(40%));
	border-radius: 0.1em; 
	/*background-color: color($isabelline shade(10%));*/
	margin-bottom: spacing(0);
	margin: 0.3em 0 0.1em 0;
	padding: 1.2em 1.5em 1.2em 1.5em;

}

.borcon {
	display: flex;
  justify-content: center;
}
.cont {
	/*margin: 0 5em 0 5em;*/
	width: 11.3em;
/*@extend %screenbg;*/
	padding: 0.45em 0.5em 0 0em;
	p {
		margin-bottom: spacing(0);
		color: $teagreen;
		padding: 0.2em 0em 0.2em 1.2em;
	}
	min-width: 10em;
}
.plashka {
  white-space: nowrap;
  overflow: hidden;
  border-bottom-right-radius: 0.1em;
	border-bottom-left-radius: 0.1em;
	border-top-right-radius: 0.1em;
	border-top-left-radius: 0.1em;
	background-color: color($spacecadet blackness(80%));
	text-align: left;
 /* border: 1px solid color($diamond shade(50%));*/
}
.overpla {
  overflow: hidden;
  width: 9.7em;
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
