<template>
  <div id="app">
    <div v-for="list in original_lists" class="cols">
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
.cols {
  lost-column: 1/3;
}
</style>