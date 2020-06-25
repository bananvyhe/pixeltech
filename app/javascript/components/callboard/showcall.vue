<template>
  <div>
    <div class="callpost">
      <div class="flexcontainer">
        <div class="calltop">
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

        <div class="callbottom">
          <div class="botleft">
            left
          </div>
          <div class="botright">
            right
          </div>
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
.callpost{
  /*display: flex;*/
  /*flex-direction: column;*/

  /*align-items: stretch;*/
/* lost-utility: edit;*/
  height: 10em;
  background-color: $bgcol2;
  margin: 0.5em ;
  padding: 0.5em;
}
.flexcontainer{
  height: 100%;
  lost-utility: clearfix;

}
.calltop{
  width: 100%;
  display: flex;
  flex-direction: row;
  lost-row: 2/3 0; 
  /*background-color: #ada; */
}
.callbottom{
  lost-row: 1/3 0;
  /*background-color: #dad; */
}
.botleft{
  lost-column: 4/5 2 0em;
}
.botright{
  lost-column: 1/5 2 0em;
}
.img{
 
  /*height: 6em;*/
  width: 6em;
}
.info{
width: 100%;
}
.middle{
  lost-column: 2/3 2 0em;
}
.end{
  lost-column: 1/3 2 0em;
}



</style>