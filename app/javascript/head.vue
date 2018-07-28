<!-- :class="{ bgclass: activatorclass }" -->
<template>
	<div><div class="bgan" :class="{ bgclass: activatorclass }" >  </div>
  <div id="head">	
  	<div class="contain ">
  		  <div class="screen">  
  			<div class="title largetext" :class="{flickerin1: activatorclass}">
  				<vue-typer 

  				text="Pixeltech" 
  				:repeat='1' 
  				:shuffle='true'
  				:pre-type-delay='1600'
  				>
  					
  				</vue-typer> 
  			</div>
  		  </div>  
  
    	<p class="subj basetext">
    		<vue-typer 
    		:pre-type-delay= '1000'
    		:repeat='0'
    		:text= "subj"
    		:shuffle='true'>
    			
    		</vue-typer>
    	</p> 
    	<div class="borcon">
    		<div  class="cont   ">
					<div class="plashka "><p>{{cont}}</p></div>
				</div>
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

    },1000 );

	

		 
  },
  methods: {
  	addlightclass() {

  	},
  	tween() {
      var selectedWork = new TimelineMax() ;
      selectedWork
      .staggerFromTo('.subj', 0.2, {
	      
        scaleX: 0,
       	scaleY: 0, 
        // xPercent: -350,
      }, {
       transformOrigin: '50% 50%',
      	  scaleX: 1,
      	scaleY: 0.1, 
        // autoAlpha:1,
        // xPercent: 0,
        ease:Expo.easeIn}, 0.3, "+=0.5")
      .staggerFromTo('.subj', 0.2, {
	      
         
       	scaleY: 0.1, 
        // xPercent: -350,
      }, {
       transformOrigin: '50% 50%',
      	  scaleY: 1,
      	 
        // autoAlpha:1,
        // xPercent: 0,
        ease:Power4.easeIn}, 0.3, "+=0")
      .staggerFromTo('.title', 0.2, {
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
        ease:Expo.easeIn}, 0.5, "+=0.5")
      .staggerFromTo('.subj', 1, {
         autoAlpha:0,
         yPercent: 100,
      }, {
         autoAlpha:1,
         yPercent: 0,
        ease:Power4.easeOut,}, 0, "-=12")
      .staggerFromTo('.plashka', 5, {
      	 
         xPercent: -250,
      }, {
         
        xPercent: 0,
        ease:Circ.easeIn}, 0, "-=16.4");
  	}
  }
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
.bgan { 
	opacity: 0.2;
	background: url('./images/scheme.svg');
	background-position: 55% 45%;
	background-repeat: no-repeat;
 
	background-size: 130% auto;
	position: absolute;
	height: 100%;
	width: 100%;
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

 
#head { 
	position: relative;
	align-items: center;
	/*lost-utility: edit;*/
	lost-center: 24em;
	height: 100vh;
	display: flex;
	@media (--only-xsmall-screen) {
		.screen { margin: 0 ;}
		.cont {	margin: 0;}
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
 
  	lost-center: 600px;
	  h1 {
			margin-top: spacing(0);
		}
  }
}
.contain {margin-bottom: 10%;
	width: 100%;
	padding-left: 0.6em; 
	padding-right: 0.6em; 
	overflow: hidden;
	position: relative;
}
.screen { color: $color-5;
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

.title { width: 5.5em;
	font-size: 2em;
	 
	 text-align: left;
	line-height: 1.4em;
	padding: 0.0em 0.4em;
	vertical-align: top;
	margin-bottom: spacing(0); 

	
}
.subj {
	min-height: 5em;
	border: 1px solid $x11gray;
	/*@extend %minimalradius;*/
	background-color: $palespringbud;
	margin-bottom: spacing(0);
	margin: 0.3em 0 0.3em 0;
  color: $titleColor;
	padding: 1.2em 1em 1.2em 1em;
	/*border-bottom: 1px solid $x11gray;*/
}
.borcon {
	display: flex;justify-content: center;
}
.cont {
	/*margin: 0 5em 0 5em;*/
	width: 10em;

	
	/*@extend %screenbg;*/

	padding: 0.15em 0.5em 0 0em;
	
	p {

		margin-bottom: spacing(0);
		color: $color-5;
		padding: 0em 0.2em 0.2em 0.5em;
	}
	min-width: 10em;
}
.plashka {border-bottom-right-radius: 0.3em;
	border-bottom-left-radius: 0.3em;
	border-top-right-radius: 0.3em;
	border-top-left-radius: 0.3em;
	background-color: color($spacecadet blackness(80%));
	text-align: left;
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
