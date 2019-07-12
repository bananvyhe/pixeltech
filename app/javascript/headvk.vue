<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app" class="app"> 
  <el-dialog
    class="containerpop"
    :visible.sync="dialogVisible"
    width="90%"
    >
    <a :href='empid.replace(/"/g,"")' target="_blank" >
    <div class="avatarSect1" v-bind:style="{backgroundImage: 'url('+ empid.slice(1, -1)}">
    </div></a>
    <span slot="footer" class="dialog-footer"></span>
  </el-dialog>
  <div class="inputForm">
    <div class='sliderRait'>
      <div class="bord">
        <div class="labelSlide plashka">
          рейтинг:
        </div>
        <el-slider 
        class=""
        :marks='marks'
        v-model="value"
        range
        :max='60'
        >
        </el-slider>
        <!-- кнопка отправки  -->
        <div class="filterBut">
          <el-button class="plashka" v-on:click="filterRes" size='mini' round type="info" plain>показать</el-button> 
        </div>
        <!-- фильтр категорий -->
        <div class="filterbutton">
          <filther :myFilterInc ="filterInc" @filterRes="filterInc = $event"></filther>
        </div>
      <!-- {{filterInc}} -->

<!--         <div class="addpublic">
          <addpublic></addpublic>
        </div> -->
      </div> 



    </div>  
    


<!--     <el-select
      class="elselect"
      v-model="optionsValue"
      multiple
      filterable
      allow-create
      default-first-option
      placeholder="выбрать контент">
      <el-option
        v-for="item in options"
        :key="item.value"
        :label="item.label"
        :value="item.value">
      </el-option>
    </el-select> -->
  </div>
  <div v-if="alldata.length === 0" class="loading" v-loading="loading"  element-loading-background="#1E1E21" element-loading-spinner="el-icon-loading" element-loading-text="Загрузка...">
  </div>
  <div v-for="(data, index) in alldata" class="vkpost" :class="{inview: checkView(index)}" >
    <div class="namewww2" v-if="data.url">
      {{data.url.substr(15).toUpperCase()}}
    </div>
    <div class="namewww hugetext"  v-if="data.url">
      {{data.url.substr(15).toUpperCase()}}
    </div>

    <div >
      <div class="itembg2" :style="{height: carouselh}" v-if="data.thumb_map_img_as_div.split(',').length > 1">
        <el-carousel type="card" :height="carouselh">
          <!-- {{data.thumb_map_img_as_div}} -->
          <el-carousel-item v-for="item in data.thumb_map_img_as_div.split(',')" :key="item">
            <div class="imgstyle" v-bind:style="{backgroundImage: 'url('+ item}"  @click="clickhandler(item, $event) "></div> 
          </el-carousel-item>
        </el-carousel>
      </div>

    <div v-else class="itembg"  v-for="item in data.thumb_map_img_as_div.split(',')" :key="item" @click="clickhandler(item, $event) "> 
      <!-- <el-button @click="dialogVisible = true"  icon="el-icon-search" circle></el-button> -->
      <div v-if="data.thumb_map_img_as_div == 'nil'" class="noimage">
        нет фото
      </div>
      
      
        <div class="imgstyle" v-bind:style="{backgroundImage: 'url('+ item}" > 
           
        </div> 

    </div>

    <div :class="[data.thumb_map_img_as_div.split(',').length > 1 ? slideInfoClass :  simpleInfoClass]">
      {{data.title}}

      <div class="raitingdate" >
        <div class="vkdate">{{data.posted_at}}</div>
        <div class="vkraiting largertext">{{data.raiting}}</div>        
      </div>
      <div v-if="data.medias_row" class="mediabutton"> 
        <energy-button class="js-newWindow" :testString="data.id" :userId="data.user" data-popup="width=780,height=950,top=250,left=150, scrollbars=yes"" v-bind:href='"https://vk.com"+data.wall.slice(2, -2)'></energy-button> 
      </div>
    </div>
    </div>
  </div>
  <div v-if="this.bottom == true" class="loading" v-loading="loading"  element-loading-background="#1E1E21" element-loading-spinner="el-icon-loading" element-loading-text="Загрузка..."></div>
</div>
</template>

<script>
import axios from 'axios'
import { mapMutations } from 'vuex';
 
var cmp = {
  props: {
    testString:{
      type: Number
    },
    userId:{
      type: Array
    }
  },
  data: function(){
    return {
      status: '',
      link: '',
    };
  },
  computed: {
    classlink() {
      // if (this.userId) {
        if (this.userId && this.userId.length > 0 || this.link == 'visited' || !this.userId) {
          return 'linkVisited';
        }else{
          return 'link';
        }        
      // }

    }
  },

  mounted() {
  // if (this.userId){
    if (!this.$store.getters.token){
     this.status = 'link'
    }        
  // }

    //jq для открытия нового окна заданных размеров
    $('.js-newWindow').click(function (event) {
      event.preventDefault();
      var $this = $(this);
      var url = $this.attr("href");
      var windowName = "popUp";
      var windowSize = $this.data("popup");
      setTimeout(function(){
        window.open(url, windowName, windowSize);
      },800 ); 
    });           
  },
  watch: {
 
  },
  // template: '<a @click="changeStatus" @mouseover="overAction" @mouseleave="leaveAction" class="energy" :class="status" target="_blank" ></a>',
  template: '<a @click="changeStatus" @mouseover="overAction"  @mouseleave="leaveAction" class="energy" :class="[classlink, status]"></a>',

  methods: {
    ...mapMutations([
      'gamesendplus'
    ]),
    overAction: function() {
      if (this.userId && this.userId.length < 1  && this.link != 'visited' ){
        this.status = 'linkactive';
      }else if (this.userId && this.userId.length > 0  || this.link == 'visited'){
        this.status = 'linkVisited';
      }     
    },
    leaveAction: function() {
      // this.status = '';
      if ( this.link != 'visited' &&  this.userId && this.userId.length < 1 ) {
        this.status = 'link';
      }else if( this.link == 'visited' || this.userId && this.userId.length > 0 ){
        this.status = '';
      } else if(!this.userId){
        this.status = '';
      }
    },
    exppush: function(){
      // axios.post('/clients', {
     //    client: {
     //      ballance: 1000
     //    }
     //  })
     var min = 60
     var max = 120
     var loa = Math.random() * (max - min) + min;
     loa =  Math.round(loa)
     loa = Number(loa)
      this.$notify({
        // title: 'Опыт',
        message: 'получено '+loa+ ' опыта',
        position: 'bottom-left'
      });
     // this.$message('получено '+loa+ ' опыта');
      axios({
        method: 'post',
        url: '/gameboards',
        data: {
          expirience: loa
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 
        // this.$store.commit('gamesendplus', 100)
        this.gamesendplus({
          amount: loa
        })
      })
    },
    makeProceedLink: function() {
      axios({
        method: 'post',
        //vks#associate
        url: '/api/v1/vkwall',
        data: {
          user_id: this.$store.getters.role.user_id,
          wallStr: this.testString
        },
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
      }).then((response) => { 


        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      })
    },
    changeStatus: function() {
                  if (!this.$store.getters.token){
              this.status = 'link';
            }
      if (this.$store.getters.token){
        this.status = 'linkactive2';
      }

      if (this.link != 'visited' &&  this.userId.length < 1) {
        this.exppush() 
      }

      var self = this;
      setTimeout(function(){
        self.status = 'linkVisited';
        self.link = 'visited';
        // self.status = '';
      },800 );


      if (this.userId.length < 1) {
        this.makeProceedLink() 
      }
    }
  }
};
 
export default {
  data: function () {
    return {
      filterInc: [],
      empid: '',
      dialogVisible: false,
      value: [10, 60],
      marks: {
        10: '10',
        60: '60'
      },
      loading: true,
      scrollTop: '',
      scrollBottom: '',
      animate: '',
      linkswicher: false,
      linkactive: 'linkactive',
      link: 'link',
      bganim: {
        backgroundPosition: "center",
      },
      slideInfoClass: 'infobg2',
      simpleInfoClass: 'infobg', 
      carouselh: "",
      width: '',
      alldata: [], 
      pos: 0,
      bottom: false,
      beers: [] 
    }
  },
  components: {
    'energy-button': cmp
  },
  watch: {
    alldata() {
      var self = this
      setTimeout(function(){
        self.anim()
      },300 );
    },
    bottom(bottom) {
      if (bottom) {
        this.addBeer()
      }
    },
    filterInc(){

    }
  },
  updated() {

  },
  created() {
    if(document.body.clientWidth > 980) {
      this.carouselh = "40em"
    }else if(document.body.clientWidth <480){
      this.carouselh = "20em"
    }else{
      this.carouselh = "35em"
    }
    window.addEventListener('scroll', () => {
      this.bottom = this.bottomVisible()
      // this.bganim.backgroundPosition = "center"
    })
    var self = this
    if (this.pos == false) {
      setTimeout(function(){
        self.addBeer()
    },1000 );
    }

  },
  mounted(){
    
  },
  updated() {

  },
  methods: {
    clickhandler( event) {
      this.dialogVisible = true;
      this.empid = event;
       
    },
    filterRes() {
      this.alldata = [];
      this.pos = 0;
      var self = this
      setTimeout(function(){
        self.addBeer()
      },300 );
      
    },
    anim() {
      this.scrollTop = window.scrollY;
      this.scrollBottom = window.scrollY + window.innerHeight;
      window.addEventListener('scroll', _.throttle(this.scrollHandler, 300))
      this.animate = document.querySelectorAll(".vkpost")
      console.log(this.animate)
    },
    animHarvest() {

    },
    checkView(e){
      if(this.animate && this.animate.length == this.alldata.length){
        let element = this.animate[e];
        let elTop = element.offsetTop;
        let elBottom = element.offsetTop + element.scrollHeight;
        if(this.scrollBottom > (elTop + 20) && (elBottom - 10) > this.scrollTop){
          return true;
        } else {
          return false;
        }
      }
    },
    scrollHandler(){
      this.scrollBottom = window.scrollY + window.innerHeight;
      this.scrollTop = window.scrollY;
    },
    bottomVisible() {
      const scrollY = window.scrollY
      const visible = document.documentElement.clientHeight 
      const pageHeight = document.documentElement.scrollHeight
      const bottomOfPage = visible + scrollY+1000 > pageHeight
      return bottomOfPage || pageHeight < visible 

    },
    addBeer() {
      axios({
        method: 'get',
        url: '/api/v1/vks',
        params: {
          vis: this.filterInc,
          rait: this.value,
          pos: this.pos
        } 
      })
      .then((response) => { 
        var alld = response.data
        console.log(this.filterInc)
        this.alldata = this.alldata.concat(alld);
        this.pos = this.alldata.length
        this.bottom = false

      });
      // if (this.$store.getters.token){
      //   axios({
      //     method: 'get',
      //     url: '/api/v1/vks/visited',
      //     headers: {
      //       'Authorization': 'bearer '+this.$store.getters.token.access
      //     } 
      //   })
      //   .then((response) => { 
      //     var vis = response.data
      //     console.log(response.data)
      //   });
      // }
    }
  }
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
.filterbutton, .addpublic {
  display: flex;
  align-items: right;
  @media (--only-xsmall-screen) {
    /*lost-column: 1/1;*/
  }

}
.namewww{
  /*  -moz-transform: rotate(-4deg);
  -webkit-transform: rotate(-4deg);
  -o-transform: rotate(-4deg);
  -ms-transform: rotate(-4deg);
  transform: rotate(-4deg);*/
  /*font-size: 1em;*/
  font-weight: bold;
  color: color( $tuscan shade(67%));
  /*color: color( #1E1E21 shade(7%));*/
  position: absolute;
/* */

align-items: flex-start;
justify-content: flex-end;
margin:  0.1em -1.2em;
  height: 100%;
  display: flex;

  width: 100%;
  @media (--only-xsmall-screen) {
    align-items: flex-end;
    padding: 0.6em 1em;
  }
    @media (--only-small-screen) {
      margin: -0.7em -1.4em;

    }
}
.namewww2{
  z-index: -1;
  transform-origin: 100% 0;
  /*transform: perspective(500px) scaleY(0.6) scaleX(0.6) rotateY( 65deg);*/
 transform: rotate(-0deg);
  font-size: 3em;
  font-weight: bold;
  /*color: color( $tuscan shade(67%));*/
  /*color: color( #1E1E21 shade(7%));*/

  position: absolute;
/* */
  display: flex;
   height: 100%;
  justify-content: flex-end;
   
  margin: 0.0em -0.3em;
   /*background-color: #ada;*/
  /*bottom: 0;*/
  /*padding: -4.5em 0.5em;*/
  width: 100%;
  @media (--only-xsmall-screen) {
    margin: -0.4em -0.2em;
    align-items: flex-end;

    transform-origin: 50% 100%;
    transform: rotate(-6deg);
  }
}
.namewww2:nth-child(even){
  color: color( $HeadBackColor  shade(46%));
}
.avatarSect1 {
  display: flex;
  height: 80vw;

 
  background-position: center;
  background-size: contain; 
  background-repeat: no-repeat;
}
.elselect {
  width: 100%;
}
.inputForm {
  display: flex;
  flex-direction: row;
  position: relative;
  width: 100%;
  /*lost-column: 2/3;*/
  padding: 0.2em 0.5em;
  margin-bottom: 0.5em;
}
/*.optionSlider {

  width: 400px;
  background-color: #dad;
}*/
.labelSlide {
  padding-right: 1em;
}
.filterBut {
  margin: 0 0 0 2em;
  align-items: center; 
}
.sliderRait {
  /*background-color: color( #1E1E21 shade(30%));*/
  
  padding: 0.2em 0em 0.2em 1.7em;
  margin: 0.3em 0em;
  /*height: 4em;*/
  /*width: 25em;*/
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: flex-start;
  /*lost-column: 1/2;*/
    @media (--only-small-screen) {
    /*lost-column: 3/4;*/
  }
  @media (--only-xsmall-screen) {
    lost-column: 1/1;
  }
  .bord {
    display: flex;
    align-items: center;
      @media (--only-xsmall-screen) {
    lost-column: 1/1;
  }

  }

}
.vkpost:nth-child(odd) {
  transition: 0.1s ease-out;
  left: -1000px;
  opacity: 0;
}
.inview:nth-child(odd) {
  left: 0px;
  opacity: 1
}
.vkpost:nth-child(even) {
  transition: 0.1s ease-out;
  right: -1000px;
  opacity: 0;
}
.inview:nth-child(even) {
  right: 0px;
  opacity: 1
}
.link, .linkactive, .linkactive2, .linkVisited {
  white-space: nowrap;
}
.linkVisited {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
   margin-top: -15px;
}

.linkVisited:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
.linkVisited:after {
  /*content: url('./images/energy29.gif');*/
  position: absolute; 
  top: -15px; right: 0;
  bottom: 0; left: -19px;
}
/*.link {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
  margin-top: -15px;
}

.link:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
.link:after {
  content: url('./images/energy29.gif');
  position: absolute; 
  top: 0px; right: 0;
  bottom: 0; left: -19px;
}*/
.link {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
  margin-top: -15px;
  -webkit-animation: pulsate-fwd 1s ease-out infinite both;
  animation: pulsate-fwd 1s ease-out infinite both;
}

.link:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
.link:after {
/*  content: url('./images/energy29.gif');*/
  position: absolute; 
  top: 0px; right: 0;
  bottom: 0; left: -19px;
}
@-webkit-keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  50% {
    -webkit-transform: scale(1.1);
            transform: scale(1.1);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  50% {
    -webkit-transform: scale(1.1);
            transform: scale(1.1);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

.linkb {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
  margin-top: -15px;
}
.linkb:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
 /*content: url('./images/energy_32.gif');*/
.linkb:after {
  /*content: url('./images/energy_32.png');*/
  content: url('./images/energy29b.gif');
  position: absolute; 
  top: 0px; right: 0;
  bottom: 0; left: -19px;
}
.linkactive {
  margin-top: -15px;
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
}
.linkactive:hover {

}
.linkactive:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
.linkactive:after {
  background-size: 10px 10px ;
  content: url('./images/29c.gif');
  position: absolute; 

  top: -3px; right: 0;
  bottom: 0; left: -8px;
}
.linkactive2 {
  margin-top: -15px;
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;

}
.linkactive2:before {
  -webkit-animation: shake-vertical 0.6s cubic-bezier(0.455, 0.030, 0.515, 0.955) both;
  animation: shake-vertical 0.6s cubic-bezier(0.455, 0.030, 0.515, 0.955) both;
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 22px; right: 0;
  bottom: 0; left: 5px; z-index: -1;
}
.linkactive2:after {
  content: url('./images/energy27.gif');
  position: absolute; 
  top: -9px; right: 0;
  bottom: 0; left: -26px;
}
.bottom {
  position: relative;
}
#app { 
  lost-center: $lostCenter;
  /*padding-top: 1.4em;*/
  overflow: hidden;
  @extend .display;
  flex-direction: column;
  @media (--only-1600more-screen) {
    lost-center: $lostCenter;
  }
  @media (--only-medium-screen) {
    lost-center: $lostCenter;
  }
},
.raitingdate {

}
.mediabutton {
  display: flex;
  margin-left: 0em;
  align-items: flex-end;
  align-self: flex-end;
  @media (--only-xsmall-screen) {
    padding-top: 2em;
    margin: -1.6em 0;

  }
}
/*Carousel*/
.itembg2 {
  margin-top: 3.2em;
  /*lost-column: 1/2 2 0.5em; */
/*  lost-center: 80%;*/
  lost-center: 80%; 
  margin-bottom: 2.4em;
  .imgstyle {
    position: relative;
    background-position: center;
    background-size: cover; 
    background-repeat: no-repeat;
    height: 100%; 
  }
}
.infobg2 {
  height: 3.2em;
  width: 100%;
  text-align: center;
  position: absolute; top: 0; 
  /*background-color: #dad;*/
/*  display: flex;
  justify-content: center;*/
  padding: 1.4em 0 0em 0;
  lost-center: 100%;
  display: flex;
  justify-content: center;
  .mediabutton {
    display: flex;
    position: absolute;
    right: -0.5em;
    top: 1em;
  }
  .raitingdate {
    position: absolute;
    left: 10%;
  }
  .linkactive:after {
    background-size: 10px 10px ;
    content: url('./images/energy32.gif');
    position: absolute;
    top: -3px; right: 0;
    bottom: 0; left: 15px;
  }
  .linkactive2:after {
    content: url('./images/energy27.gif');
    position: absolute; 
    top: -9px; right: 0;
    bottom: 0; left: -10px;
  }
}

.itembg {
  lost-column: 1/4 2 1em;   
  margin: 0em 0.3em 0em 0em; 
  height: 10em;
  @media (--only-1600more-screen) {
    height: 14em;
  }
  @media (--only-medium-screen) {
    height: 13em;
    lost-column: 1/4 2 1.2em; 
  }    
  @media (--only-xsmall-screen) {
    height: 20em;
    lost-column: 1/1 2 1.2em; 
  }  
  @media (--only-small-screen) {
    height: 20em;
    lost-column: 1/2 2 1.2em; 
  }    
/*  lost-column: 5/7 2 1.2em; */
  .imgstyle {
    position: relative;
    background-position: center;
    background-size: cover; 
    background-repeat: no-repeat;
    height: 100%; 
  }
} 
.infobg {
  lost-column: 3/4 2 1em;     
  position: relative;
  height: 100%;
  padding:  2.4em 0 0 0em;
  margin: 0em 0;   
  @media (--only-xsmall-screen) {

    lost-column: 1/1 2 1.2em; 
    padding:  0.4em 0 0 0em;
  }  
  @media (--only-small-screen) {
    lost-column: 1/2 2 1.2em; 

  }  
/*  background-color: #ada;*/
}

.loading {
  padding: 0.5em;
  height: 2em;
  color: white;
  text-align: center;
  font-size: 20px;
}
.display {
  display: flex;
  justify-content: center;
  align-content: center;
}
.app {
  overflow: hidden;
}
#app {
  
}
h3 {
  margin-bottom: 5px;
}

ul {
  margin-top: 5px;
}
@-webkit-keyframes shake-bottom {
  0%,
  100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
    -webkit-transform-origin: 50% 100%;
            transform-origin: 50% 100%;
  }
  10% {
    -webkit-transform: rotate(2deg);
            transform: rotate(2deg);
  }
  20%,
  40%,
  60% {
    -webkit-transform: rotate(-4deg);
            transform: rotate(-4deg);
  }
  30%,
  50%,
  70% {
    -webkit-transform: rotate(4deg);
            transform: rotate(4deg);
  }
  80% {
    -webkit-transform: rotate(-2deg);
            transform: rotate(-2deg);
  }
  90% {
    -webkit-transform: rotate(2deg);
            transform: rotate(2deg);
  }
}
@-webkit-keyframes shake-vertical {
  0%,
  100% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  10%,
  30%,
  50%,
  70% {
    -webkit-transform: translateY(-8px);
            transform: translateY(-8px);
  }
  20%,
  40%,
  60% {
    -webkit-transform: translateY(8px);
            transform: translateY(8px);
  }
  80% {
    -webkit-transform: translateY(6.4px);
            transform: translateY(6.4px);
  }
  90% {
    -webkit-transform: translateY(-6.4px);
            transform: translateY(-6.4px);
  }
}
@keyframes shake-vertical {
  0%,
  100% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  10%,
  30%,
  50%,
  70% {
    -webkit-transform: translateY(-2px);
            transform: translateY(-2px);
  }
  20%,
  40%,
  60% {
    -webkit-transform: translateY(2px);
            transform: translateY(2px);
  }
  80% {
    -webkit-transform: translateY(1.4px);
            transform: translateY(1.4px);
  }
  90% {
    -webkit-transform: translateY(-0.8px);
            transform: translateY(-0.8px);
  }
}


</style>
