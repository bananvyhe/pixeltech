<template>
  <div id="head">
  	<div class="contain basetext">
    <h2 class="title">{{ message }}</h2>
     <p class="subj">{{subj}}</p> 
     <div  class="cont"><h2>{{cont}}</h2></div>
    </div>
  </div>
</template>

<script>
import ScrambleText from 'scramble-text'; 
export default {
  data: function () {
    return {
    	subj: 'Разработка веб-приложений, сайтов на Ruby on Rails + Vue.js',
      message: "Pixeltech",
      cont: "admin@pixeltech.ru"
    }
  },
  mounted() {
  var cont = document.querySelector(".cont");
  var scrambleText = new ScrambleText( cont,
		{
			timeOffset : 50,
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
			callback: function () { console.log( 'ended' ); }
		} ).play();
		this.tween();
    setTimeout(function(){
       
      // self.cropText();
       scrambleText.start();  

    },3500 );

	

		 
  },
  methods: {
  	tween() {
      var selectedWork = new TimelineMax() ;
      selectedWork
      .staggerFromTo('.title', 12, {
        autoAlpha:0,
        
      }, {
        autoAlpha:1,
        yPercent: 0,
        ease:Back.easeOut.config(4)}, 0.1, "+=0.5")
      .staggerFromTo('.subj', 1, {
         autoAlpha:0,
         xPercent: 10,
      }, {
         autoAlpha:1,
         xPercent: 0,
        ease:Power4.easeOut,}, 0, "-=12")
      .staggerFromTo('.cont', 5, {
      	 
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
#head {
	lost-center: 250px;
	height: 100vh;
	display: flex;
	@media (--only-medium-screen) {
  	align-items: center;
  	lost-center: 300px;
  }
  @media (--only-1600more-screen) {
  	align-items: center;
  	lost-center: 680px;
  }
	 
}
.contain {  
	overflow: hidden;
	position: relative;
	display: flex;
	flex-direction: column;
}
.title {
/*	opacity: 0;*/
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
	padding: 0.2em 0.5em 0 0.5em;
	 
}


</style>
