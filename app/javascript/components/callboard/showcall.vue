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
            <div class="end">
              <el-tag>user1</el-tag><el-tag>user2</el-tag>
            </div>               
          </div>
        </div>
        <div class="callbottom">
          <div class="botleft">
            reward
          </div>
          <div class="botmid">
            <el-date-picker
              size="mini"
              v-model="value1"
              type="datetime"
              placeholder="дата и время">
            </el-date-picker>                 
          </div>
          <div class="botright">
            <div>
              <el-switch active-text="Заявка" width="23"  size="mini" v-model="checked" ></el-switch>              
            </div>
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
      checked: false,
      value1: '',
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
@import "../../stylesheets/_variables.scss";
.el-tag{
  margin: 0.3em;
}
.callpost{
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
  lost-row: 5/7 0; 
}
.callbottom{
  lost-row: 2/7 0;
  display: flex;
  align-items: flex-end;
  padding: 0.3em;
}
.botleft{
  lost-column: 1/5 3 0em;
}
.botmid{
  lost-column: 3/5 3 0em;
}
.botright{
  lost-column: 1/5 3 0em;
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
}
.img{
  width: 7.5em;
}
.info{
width: 100%;
}
.middle{
  lost-column: 5/7 3 0em;
}
.calldate{
  align-self: flex-end;
}
.end{
  lost-column: 2/7 3 0em;
}
</style>