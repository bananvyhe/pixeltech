<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app">
  <div v-if="alldata.length === 0" class="loading">Загрузка...</div>
  <div v-for="data in alldata" class="vkpost" >
    <div class="itembg2" :style="{height: carouselh}" v-if="data.thumb_map_img_as_div.split(',').length > 1">
      <el-carousel  type="card" :height="carouselh" >
        <el-carousel-item v-for="item in data.thumb_map_img_as_div.split(',')" :key="item">
          <div class="imgstyle"  v-bind:style="{backgroundImage: 'url('+ item}"></div> 
        </el-carousel-item>
      </el-carousel>
    </div>
    <div v-else class="itembg"  v-for="item in data.thumb_map_img_as_div.split(',')" :key="item">
      <div v-if="data.thumb_map_img_as_div == 'nil'" class="noimage">
        нет фото
      </div>
      <div class="imgstyle" v-bind:style="{backgroundImage: 'url('+ item}"  ></div> 
    </div>
    <div :class="[data.thumb_map_img_as_div.split(',').length > 1 ? slideInfoClass :  simpleInfoClass]">
 
        {{data.title}}
  
      <div class="raitingdate" >
        <div class="vkdate">{{data.posted_at}}</div>
        <div class="vkraiting largertext">{{data.raiting}}</div>        
      </div>
      <div v-if="data.medias_row" class="mediabutton">
<!--         <a target="_blank" v-on:click.capture="linkswicher=true" v-bind:href='""+data.wall.slice(2, -2)'><div class="link" :class="[linkswicher ? linkactive : '', link]"> -->
       <!--  <component v-bind:href='""+data.wall.slice(2, -2)'></component> -->
         <energy-button v-bind:href='"https://vk.com"+data.wall.slice(2, -2)'></energy-button> 
      <!-- </a> -->
      </div>
 
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios'
var cmp = {

  data: function(){
    return {
      status: 'link'
    };
  },
  template: '<a @click="changeStatus" @mouseover="overAction" @mouseleave="leaveAction" class="energy" :class="status" target="_blank" ></a>',

  methods: {
    overAction: function() {
      this.status = 'linkactive';
    },
    leaveAction: function() {
      this.status = 'link';
    },
    changeStatus: function() {
            this.status = 'linkactive2';
   

       //  if ($('.energy').hasClass('linkactive'))
       // {
       //   this.status = 'linkactive2';
       // } else
       // {
       //  this.status = 'linkactive';
       // }
       
    }
  }
};
 
export default {
 
  data: function () {
    return {  
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
    // 'lk': {
    //   template: '<a  v-bind:is="view" v-on:click ="view = lka" target="_blank" class="link"></a>'
    // },
    // 'lka': {
    //   template: '<a target="_blank" class="linkactive"></a>'
    // }
  },
  watch: {
    bottom(bottom) {
      if (bottom) {
        this.addBeer()
      }
    }
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
      this.bganim.backgroundPosition = "center"
    })
    this.addBeer()
  },
  methods: {
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
            pos: this.pos
          } 
        })
        .then((response) => { 
          var alld = response.data
 // var alld = JSON.parse(response.data)
          console.log(response.data)
          this.alldata = this.alldata.concat(alld);
          this.pos = this.alldata.length
        })
 
      // axios.get('https://api.punkapi.com/v2/beers/random')
      //   .then(response => {
      //     let api = response.data[0];
      //     let apiInfo = {
      //       name : api.name,
      //       desc : api.description,
      //       img : api.image_url,
      //       tips : api.brewers_tips,
      //       tagline : api.tagline,
      //       food : api.food_pairing
      //     };
      //     this.beers.push(apiInfo)
      //     if (this.bottomVisible()) {
      //       this.addBeer()
      //     }
      // })
    }
  }
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
.link {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;
}

.link:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 6px; right: 0;
  bottom: 0; left: 10px; z-index: -1;
}
 /*content: url('./images/energy_32.gif');*/
.link:after {
  /*content: url('./images/energy_32.png');*/
  content: url('./images/energy29.gif');
  position: absolute; 
  top: -15px; right: 0;
  bottom: 0; left: -19px;
}

.linkactive {
  content: '';
  display: block;
  position: relative;
  width: 130px;
  height: 50px;

}
.linkactive:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 6px; right: 0;
  bottom: 0; left: 10px; z-index: -1;
}
.linkactive:after {
  content: url('./images/energy32.gif');
  position: absolute; 
  top: -20px; right: 0;
  bottom: 0; left: -14px;
}
.linkactive2 {
  content: '';
  display: block;
  position: relative;
  width: 150px;
  height: 70px;

}
.linkactive2:before {
  adjust-font-size: fs b;
  color: color( $str5  blackness(12%));
  content: 'медиа в окне';
  position: absolute; 
  top: 6px; right: 0;
  bottom: 0; left: 10px; z-index: -1;
}
.linkactive2:after {
  content: url('./images/energy27.gif');
  position: absolute; 
  top: -23px; right: 0;
  bottom: 0; left: -22px;
}
.bottom {
  position: relative;
}
#app {
  @media (--only-1600more-screen) {
    lost-center: 980px;
  }
  @media (--only-medium-screen) {
    lost-center: 980px;
  }
},
.raitingdate {

}
.mediabutton {
  display: flex;
  margin-left: -1em;
  align-items: flex-end;
  align-self: flex-end;
}
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
    right: 0.5em;
    top: 0.3em;
  }
  .raitingdate {
    position: absolute;
    left: 10%;
  }
}
/*Carousel*/
.itembg {
  margin: 0em 0.3em 0em 0.7em; 
  height: 30em;
  @media (--only-1600more-screen) {
    height: 40em;
  }
  @media (--only-medium-screen) {
    height: 35em;
    lost-column: 2/3 2 1.2em; 
  }    
  @media (--only-xsmall-screen) {
    height: 20em;
    lost-column: 2/3 2 1.2em; 
  }  
  @media (--only-small-screen) {
    
    height: 30em;
    lost-column: 2/3 2 1.2em; 
  }    
  lost-column: 5/7 2 1.2em; 
  .imgstyle {
    position: relative;
    background-position: center;
/*    @media (--only-xsmall-screen) {
      background-position: center;
    }  */
/*    @media (--only-small-screen) {
      background-position: 100% auto;
    }  */
    background-size: cover; 
    background-repeat: no-repeat;
    height: 100%; 
  }
} 

.infobg {
  height: 100%;
  padding:  2.4em 0 0 0.7em;
  margin: 0em 0;   
/*  background-color: #ada;*/
}

.loading {
  color: white;
  text-align: center;
  font-size: 20px;
}
.display {
  display: flex;
  justify-content: center;
  align-content: center;
}
#app {
  @extend .display;
  flex-direction: column;
}
h3 {
  margin-bottom: 5px;
}

ul {
  margin-top: 5px;
}
</style>
