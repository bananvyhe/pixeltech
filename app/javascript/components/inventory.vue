<template>
  <div class="inv">
    <el-popover
      placement="bottom"
      width="200"
      trigger="click"
      content="this is content, this is content, this is content">
      <div class="slots">
        <div class="cash">
          <el-tooltip  class="smalltext"  placement="bottom">
            <div slot="content">
              <div class="tooldrop">
                <h5>Камень</h5>
                <p>камнями вы можете оплатить некоторые действия</p>
              </div>
            </div>
            <div v-if="$store.getters.cry" class="rock">
              <div class="cry"></div>{{$store.getters.cry}}
            </div>    
          </el-tooltip>          
        </div>
        <!-- <draggable v-model="items"  @end="itemMoved"> -->

        <!-- </draggable> -->
        <div class="inv">
          <div v-for="(item, index) in items" class="one-item"> 
            <el-tooltip  class="smalltext"  placement="bottom">
              <div slot="content">
                <h5 style="padding-left: 0.5em;">{{item.item_name}}</h5><p>{{item.description}}</p>
              </div>
              <div v-bind:style="{backgroundImage: `url('items${item.image.slice(9)}')`}" class="item-inv"><div v-if="item.qty != 0">{{item.qty}}</div></div>
            </el-tooltip>
          </div>          
        </div>
      </div>
    <el-button slot="reference" icon="el-icon-menu" @click="isOpen = ! isOpen"  type="info"  size="mini" ></el-button>   
    </el-popover>    
  </div>
</template>
<script>
import axios from 'axios'  
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
  watch: {
    isOpen(){
      if (this.isOpen == true) {
        this.ItemsGet()
      }
    }

  },
  methods: {
    ItemsGet(){
      // console.log('true')
      axios({
        method: 'get',
        url: '/items',
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        } 
        // params: {
        //   rait: this.value,
        //   pos: this.pos
        // } 
        })
        .then((response) => { 
           console.log(response)
          var total = response.data
          this.items = total
        });      
    },
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
@import "../stylesheets/_variables";
.cash {
  display: flex;
}

.one-item {
  padding: 0.1em;
}
.inv {
  padding: 0.3em 0 0;
  display: flex;
  flex-direction: row;
}
.rock{
  display: flex;
  flex-direction: row;
  align-items: center;
}
/*.cry {
  border: 1px solid color( $screenbg shade(56%));; 
  text-shadow: 0px 1px #222, 1px 0px #222;
  height: 18px; 
  width: 18px; 
  background-image: url('../images/cry.jpg');
  background-size: contain;
  padding: 0.3em 0 0 0.5em;
  margin-right: 0.3em;
} */
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
  flex-direction: column;
}
</style>