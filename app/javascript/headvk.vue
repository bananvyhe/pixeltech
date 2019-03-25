<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app">
  <div v-if="alldata.length === 0" class="loading">Загрузка...</div>
  <div v-for="data in alldata" class="vkpost">
    <div class="itembg" v-if="data.thumb_map_img_as_div.split(',').length > 1">
      <el-carousel  :height="carouselh" >
        <el-carousel-item v-for="item in data.thumb_map_img_as_div.split(',')" :key="item">
          <div class="imgstyle"  v-bind:style="{backgroundImage: 'url('+ item}"></div> 
        </el-carousel-item>
      </el-carousel>
    </div>
    <div v-else class="itembg" :style="{height: carouselh}" v-for="item in data.thumb_map_img_as_div.split(',')" :key="item">
          <div v-if="data.thumb_map_img_as_div == 'nil'" class="noimage">
            нет фото
          </div>
          <div class="imgstyle"  v-bind:style="{backgroundImage: 'url('+ item}"></div> 
          
    </div>
    <div class="infobg">
      {{data.title}}
      <br><div class="vkdate">{{data.posted_at}}</div>
      <br><div class="vkdate">{{data.raiting}}</div>
   
      <div v-if="data.medias_row" class="bottom">
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
      this.carouselh = "30em"
    }else{
      this.carouselh = "20em"
    }
    
    window.addEventListener('scroll', () => {
      this.bottom = this.bottomVisible()
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
  height: 70px;
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
.itembg {
  lost-column: 1/2 2 0.5em; 
}
.infobg {
  position: relative;
  padding: 0.5em 0 0.5em 0;
  lost-column: 1/2 2 0.5em; 
}
.imgstyle {
  position: relative;
  background-position: center;
  background-size: cover; 
  background-repeat: no-repeat;

height: 100%; 
 

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
