<template>
  <div class="inv">
    <el-popover
      placement="bottom"
      width="200"
      trigger="click"
      content="this is content, this is content, this is content">
      <div class="slots">
        <draggable v-model="items"  @end="itemMoved">
        <el-tooltip  class="smalltext"  placement="bottom">
          <div slot="content">
            <div class="tooldrop">
              <h5>Камень</h5>
              <p>камнями вы можете оплатить некоторые действия</p>
            </div>
          </div>
          <div class="cry" v-if="$store.getters.cry">{{$store.getters.cry}}</div>
        </el-tooltip>
        </draggable>
      </div>
      
      <el-button slot="reference" icon="el-icon-menu" @click="isOpen = ! isOpen"  type="info"  size="mini" ></el-button>   
    </el-popover>    
  </div>
</template>
<script>
import draggable from "vuedraggable"
export default {
  components: { draggable },
  // props:['isOpen'],
  
  data() {
    return {
      items: '',
      isOpen: false,
    }
  },
  methods: {
    itemMoved: function(event) {
      var data = new FormData
      console.log(data)
      data.append("item[position]", event.newIndex + 1)
      axios({
        method: 'PATCH',
        url: `/employees/${this.employees[event.newIndex].id}/move`,
        // type: "PATCH",
        data: data,
        // dataType: "json",
        // success: this.getemps()
      }).then((response) => { 

        this.input = ''
        this.getemps()
        // this.link = 'visited'
        // this.$store.commit('gamesendplus', 100)
        // this.gamesendplus({
        //   amount: loa
        // })
      }) 

 
    },            
  }
}
</script>
<style scoped>
@import "_variables";

.cry {
  border: 1px solid color( $screenbg shade(56%));; 
  text-shadow: 0px 1px #222, 1px 0px #222;

  height: 52px; 
  width: 52px; 
  /*display: flex;*/
  background-image: url('../images/cry.jpg');
  background-size: contain;
  padding: 0.3em 0 0 0.5em;
} 
.tooldrop{
  text-align: left;
  width: 15em;
  margin: -0.3em -0.1em;
  font-size: 0.9em;
  h5{
    padding-left: 0.5em;
  }
  p{
    text-align: center;
  }
}
.slots{
  box-shadow: inset 0px 0px 8px rgba(0,0,0,0.3);
  padding: 0.5em 0.5em;
  /*background-color: #dad;*/
  margin: -0.8em -1em;
  display: flex;
}
</style>