<template>
  <div id="app">
    <div v-for="list in original_lists" class="cols">
      <h6>{{list.name}}</h6>
      <hr />
      <div v-for="(card, index) in list.cards">
        {{ card.name}}
      </div>
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