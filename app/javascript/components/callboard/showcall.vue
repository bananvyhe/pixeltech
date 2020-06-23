<template>
  <div>
    <div class="callpost">
      {{this.title}}{{this.body}}{{this.username}}       
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
 
</script>
<style scoped>
@import "../../stylesheets/_variables";
 
.callpost{
  height: 10em;
  background-color: $bgcol;
  margin: 0.5em ;
  padding: 0.5em;
}


</style>