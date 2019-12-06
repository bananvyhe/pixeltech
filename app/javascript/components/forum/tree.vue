<template>
  <div class="tree"> 
    <div class="tree-list"> 
      <!-- {{typeof treeData}} -->
      <node-tree v-on:sendpost="sendd" :node="treeData" :number="number" class="tree-Data" ></node-tree>
    
    </div>
  </div>
</template>

<script>
import NodeTree from "./NodeTree";

export default {
  props: {
    treeData: Object,
    number: Number 
  },
  components: {
    NodeTree
  },
  methods: {
    sendd(val){
       console.log('val')
      console.log(val)
      this.$emit('sendposttwo', val);

    }
  }
};
</script>

<style>
.tree-Data {
  /*background-color: #dad;*/
}
.tree-list ul {
  padding-left: 16px;
  margin: 0.2em 0;
}
</style>