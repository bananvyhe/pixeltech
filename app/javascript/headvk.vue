<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app">

  <section>
    <div v-if="alldata.length === 0" class="loading">Загрузка...</div>
    <div v-for="data in alldata" class="itembg vkpost">
      <div class="">{{data.thumb_map_img_as_div.split(',')[0]}}
<!--         <div v-for="item in data.thumb_map_img_as_div">
            <div class="imgstyle"  v-bind:style="{backgroundImage: 'url('+ item}">{{item}}
          </div> 

        </div> -->
      </div>
      <!-- <div class="beer-info">
        <h2>{{ beer.name }}</h2>
        <p class="bright">{{ beer.tagline }}</p>
        <p><span class="bright">Description:</span> {{ beer.desc }}</p>
        <p><span class="bright">Tips:</span> {{ beer.tips }}</p>
        <h3 class="bright">Food Pairings</h3>
        <ul>
          <li v-for="item in beer.food">
            {{ item }}
          </li>
        </ul>
      </div> -->
    </div>
  </section>
</div>
</template>

<script>
import axios from 'axios'
 
export default {
 
  data: function () {
    return {   
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
      const bottomOfPage = visible + scrollY >= pageHeight
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
.itembg {
  background-color: str1;
  width: 17em;
  height: 20em;
}
.imgstyle {
  position: relative;
  background-position: center;
  background-size: cover; 
  background-repeat: no-repeat;
  width: 17em;
  height: 20em;
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
