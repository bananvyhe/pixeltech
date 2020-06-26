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
              <h5>{{this.title}}</h5>{{this.body}}{{this.username}}            
            </div>
            <div class="middle_b">
              time
            </div>
            <div class="end">
              users
            </div>               
          </div>
     
        </div>

        <div class="callbottom">
          <div class="botleft">
            reward
          </div>
          <div class="botright">
            <el-switch active-text="заявка" width="23"  size="mini" v-model="checked" ></el-switch>
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
      checked: false
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
  lost-row: 4/5 0; 
  /*background-color: #ada; */
}
.callbottom{
  lost-row: 1/5 0;
  /*background-color: #dad; */
}
.botleft{
  lost-column: 4/5 2 0em;
}
.botright{
  lost-column: 1/5 2 0em;
  display: flex;
  justify-content: flex-end;
}
.img{
 
  /*height: 6em;*/
  width: 7em;
}
.info{
width: 100%;
}
.middle{
  lost-column: 4/7 3 0em;
}
.middle_b{
  lost-column: 1/7 3 0em;
}
.end{
  lost-column: 2/7 3 0em;
}



</style>