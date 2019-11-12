<template>
  <div class="node-tree">
    <span class="label">{{node.body}}</span><span class="tinytext">{{node.username}}</span>
  <!-- {{typeof node }} -->
   <div v-if="node.comments && node.comments.length">
          <node v-for="child in node.comments" :node="child" class="padding-message"></node>
        </div>
  </div>
</template>

<script>
export default {
  name: "node",
  props: {
    node: Object
  }
};
</script>
<style>
.padding-message {
  padding-left: 0.7em;
  margin: 0 0;
}
.label {
  /*background-color: #dad;*/
}

</style>