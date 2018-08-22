<template>
  <draggable v-model="lists" :options="{group: 'lists'}" class="dragArea" @end="listMoved">
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
      listMoved: function(event) {
        var data = new FormData
        data.append("list[position]", event.newIndex + 1)

        Rails.ajax({
          url: `/lists/${this.lists[event.newIndex].id}/move`,
          type: "PATCH",
          data: data,
          dataType: "json",
        })
      },
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
.dragArea {
  min-height: 20px;
}
.cols {
  lost-column: 1/3;
}
</style>