<template>
  <div class="request">
    <el-button type="info" icon="el-icon-message" size="mini" circle @click="dialogFormVisible = true"></el-button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      dialogFormVisible: false,
    }
  },
  methods: {


  }
}
</script>

<style scoped>
@import "stylesheets/_variables";
 
</style>