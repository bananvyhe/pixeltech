<template>
  <draggable>
    <div v-for="(list, index) in lists" class="cols">
      <h6>{{list.name}}</h6>
      <hr />
      <div v-for="(card, index) in list.cards">
        {{ card.name}}
      </div>
      <textarea v-model="messages[list.id]"></textarea>
      <button v-on:click="submitMessages(list.id)">Добавить</button>
    </div>
  </draggable>
</template>

<script>
  import draggable from 'vuedraggable'
  export default {
    components: { draggable },
    props: ["original_lists"],
    data: function (){
      return {
        messages: {},
        lists: this.original_lists,
      }
    },
    methods: {
      submitMessages: function(list_id) {
        var data = new FormData
        data.append("card[list_id]", list_id)
        data.append("card[name]", this.messages[list_id])

        Rails.ajax({
          url: "/cards",
          type: "POST",
          data: data,
          dataType: "json",
          success: (data) => {
            const index = this.lists.findIndex(item => item.id == list_id)
            this.lists[index].cards.push(data)
            this.messages[list_id] = undefined
          }
        })
      }
    }
  }
</script>
<style scoped>
.cols {
  lost-column: 1/3;
}
</style>