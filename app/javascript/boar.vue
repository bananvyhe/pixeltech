<template>
  <div id="app">
    <div v-for="list in original_lists">
      {{list.name}}
    </div>
  </div>
</template>

<script>
  export default {
    props: ["original_lists"],
    data: function (){
      return {
       
      }
    }
  }
</script>
<style scoped>
</style>