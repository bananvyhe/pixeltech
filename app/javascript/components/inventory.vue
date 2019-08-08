<template>
  <div>
    <el-popover
      placement="bottom"
      width="200"
      trigger="click"
      content="this is content, this is content, this is content">
      <div class="slots">
        <div class="cry" v-if="$store.getters.cry">{{$store.getters.cry}}</div>
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
.slots{
  box-shadow: inset 0px 0px 8px rgba(0,0,0,0.3);
  padding: 0.5em 0.5em;
  /*background-color: #dad;*/
  margin: -0.8em -1em;
  display: flex;
}
</style>