<!-- :class="{ bgclass: activatorclass }" -->
<template>
<div id="app">
  <section>
    <div v-if="alldata.length === 0" class="loading">Загрузка...</div>
    <div v-for="data in alldata" class="beer-contain">
      <div class="beer-img">{{data}} 
        <!-- <img :src="data.title" height="150" /> -->
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
          alld = alld
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
.beer-contain {
  @extend .display;
  width: 50%;
  margin: 20px 24%;
  box-shadow: 0 2px 3px 1px rgba(30, 0, 0, 0.1);
}
.beer-img {
  @extend .display;
  height: 300px;
  padding: 30px;
  background: #FF6542;
  border: 1px solid #88498F;
  border-right: 1px solid #f44822;
}
.beer-info {
  background: #564154;
  color: white;
  padding: 30px;
  border: 1px solid #88498F;
  .bright {
    color: #fcd7cf;
    font-family: 'Contrail One', sans-serif;
  }
}

h3 {
  margin-bottom: 5px;
}

ul {
  margin-top: 5px;
}
</style>
