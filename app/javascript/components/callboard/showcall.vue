<template>
  <div>
    <div >
      {{this.title}}      
    </div>

  </div>
</template>

<script>
import axios from 'axios'
 
export default {
  props:['number', 'body', 'title', 'username'], 
  data: function () {
    return {
      // callpost: [
      //   {id: 1},
      //   {title: 'Заголовок поста'},
      //   {body: 'описание поста'},
      //   {slots: 2},
      //   {img: '/image/monsters/monster.jpg'},
      //   {timebegin: 65467},
      //   {timeend: 54577},
      //   {reward: 45}
      // ]

    };
  },
  watch: {

  }, 
  computed: {

  },
  mounted() {

  },
  methods: {

  }
}

// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>



</style>