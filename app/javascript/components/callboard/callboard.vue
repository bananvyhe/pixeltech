<template>
  <div>
    <newcalla class="headertext" v-on:newcall="getPosts" ></newcalla >  
    <div v-for="(itemch, index) in callposts" >
      <showcalla class="headertext" v-on:delpost="getPosts" :number='itemch.id' :body='itemch.body' :title='itemch.title' :username='itemch.username'></showcalla>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Showcall from './showcall.vue'
import Newcall from './newcall.vue'
export default {
  components: {
    'showcalla': Showcall,
    'newcalla': Newcall
  },  
  data: function () {
    return {
      callposts: [
        { id: 1, title: 'Заголовок поста', body: 'описание поста', slots: 2, img: '/image/monsters/monster.jpg', timebegin: 65467, timeend: 54577, reward: 45 },
        { id: 2, title: 'Заголовок поста2', body: 'описание поста2', slots: 1, img: '/image/monsters/monster2.jpg', timebegin: 65467, timeend: 54577, reward: 45 },  
      ]

    };
  },
  watch: {

  }, 
  computed: {

  },
  mounted() {

  },
  methods: {
    getPosts() {

    }

  }
}

 
</script>
<style scoped>



</style>