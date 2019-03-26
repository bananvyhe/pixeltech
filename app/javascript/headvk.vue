<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app">
  <div v-if="alldata.length === 0" class="loading">Загрузка...</div>
  <div v-for="data in alldata" class="vkpost">

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
        <div class="vkraiting">{{data.raiting}}</div>        
      </div>
  
      <div v-if="data.medias_row" class="mediabutton">
        <div class="link">
          <a target="_blank" v-bind:href='"https://vk.com"+data.wall.slice(2, -2)'> медиа в окне </a>
        </div>
    
        <!-- <div id="charge" class="charged"></div> -->
      </div>
 
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios'
 
export default {
 
  data: function () {
    return {  
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
      this.carouselh = "30em"
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
#charge {
  animation-play-state: paused;
}
.link {
  position: relative;
  z-index: 0;
  width: 130px;
  height: 50px;
  display: flex;
  justify-content: center;
  align-content: center;
  align-items: center;
}
.bottom {
  position: relative;
/*   display: flex;
  justify-content: center;
  align-content: center;
  align-items: center;*/
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
  .link {

  }
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
  margin: 0.7em 0.3em 0.7em 0.7em; 
  height: 30em;
  @media (--only-1600more-screen) {
    height: 40em;
  }
  @media (--only-medium-screen) {
    height: 20em;
    lost-column: 2/3 2 1.2em; 
  }    
  @media (--only-xsmall-screen) {
    height: 10em;
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
  
  padding:  1em 0 0 0.7em;
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
