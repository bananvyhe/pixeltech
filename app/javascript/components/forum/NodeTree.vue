<template>
  <div class="node-tree">
    <span class="label">{{ node.body  }}</span>
  <!-- {{typeof node }} -->
  <!--  <ul v-if="node.comments && node.comments.length">
          <node v-for="child in node.comments" :node="child">
            
          </node>
        </ul> -->
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