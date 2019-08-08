<template>
  <div>
    <el-popover
      placement="bottom"
      width="200"
      trigger="click"
      content="this is content, this is content, this is content">
      <div class="slots">
        <el-tooltip  class="smalltext" effect="light" placement="bottom">
          <div slot="content">
            <div class="tooldrop">камни вам понадобятся для оплаты специальных действий 
            </div>
          </div>
          <div class="cry" v-if="$store.getters.cry">{{$store.getters.cry}}</div>
        </el-tooltip>
       
      </div>
      
      <el-button slot="reference" icon="el-icon-menu" @click="isOpen = ! isOpen"  type="info"  size="mini" circle></el-button>   
    </el-popover>    
  </div>
</template>
<script>
export default {
  // props:['isOpen'],
  
  data() {
    return {
      isOpen: false,
    }
  }
}
</script>
<style scoped>
@import "stylesheets/_variables";
.tooldrop{
  text-align: center;
  width: 15em;
  margin: -0.4em -0.2em;
  font-size: 0.9em;
}
.slots{
  box-shadow: inset 0px 0px 8px rgba(0,0,0,0.3);
  padding: 0.5em 0.5em;
  /*background-color: #dad;*/
  margin: -0.8em -1em;
  display: flex;
}
</style>