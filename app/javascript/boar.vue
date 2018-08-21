<template>
  <div id="app">
    <div v-for="list in original_lists" class="cols">
      <h6>{{list.name}}</h6>
      <hr />
      <div v-for="(card, index) in list.cards">
        {{ card.name}}
      </div>
      <textarea v-model="messages[list.id]"></textarea>
      <button v-on:click="submitMessages(list.id)">Добавить</button>
    </div>
  </div>
</template>

<script>
  export default {
    props: ["original_lists"],
    data: function (){
      return {
        messages: {}
      }
    },
    methods: {
      submitMessages: function(list_id) {
        console.log(this.messages[list_id]);
      }
    }
  }
</script>
<style scoped>
.cols {
  lost-column: 1/3;
}
</style>