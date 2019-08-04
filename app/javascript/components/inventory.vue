<template>
  <hsc-window-style-black>

    <hsc-window title="Инвентарь" :closeButton="true" :isOpen.sync="isOpen">
      Parameters:
      <fieldset>
        <legend>&alpha;</legend>
        <input type="range" />
      </fieldset>
      <fieldset>
        <legend>&beta;</legend>
        <input type="range" />
      </fieldset>
    </hsc-window>

    <el-button icon="el-icon-menu" @click="isOpen = ! isOpen"  type="info"  size="mini" circle></el-button>

  </hsc-window-style-black>
</template>


<script>

export default {
  // props:['isOpen'],
  
  data() {
    return {
      isOpen: false,
    }
  }
}
</script>
