<template>
  <div>
    <div class="callpost">
      <div class="flexcontainer">
        <div class="top">
          <div class="img">
            img
          </div>
          <div class="info">
            <div class="middle">
              {{this.title}}{{this.body}}{{this.username}}            
            </div>
            <div class="end">
              234
            </div>               
          </div>
     
        </div>

        <div class="bottom">
          bot
        </div>        
      </div>  

   
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
.flexcontainer{
  height: 100%;

}
.top{
  width: 100%;
  display: flex;
  flex-direction: row;
  lost-row: 2/3; 
  /*background-color: #ada; */
}
.bottom{
  lost-row: 1/3;
  /*background-color: #dad; */
}
.img{
 
  /*height: 6em;*/
  width: 6em;
}
.info{
width: 100%;
}
.middle{
  lost-column: 1/2 2 0em;
}
.end{
  lost-column: 1/2 2 0em;
}
.callpost{
  /*display: flex;*/
  /*flex-direction: column;*/

  /*align-items: stretch;*/
 lost-utility: edit;
  height: 10em;
  background-color: $bgcol;
  margin: 0.5em ;
  padding: 0.5em;
}


</style>