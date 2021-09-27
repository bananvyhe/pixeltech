<template>
  <div class="addpublic">
    <el-select
	    v-model="value"
	    multiple
	    filterable
	    allow-create
	    default-first-option
	    placeholder="выберите группы">
	    <el-option
	      v-for="item in options"
	      :key="item.value"
	      :label="item.label"
	      :value="item.value">
	    </el-option>
	  </el-select>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {

  data: function () {
    return {
			options: [{
        value: 'HTML',
        label: 'HTML'
      }, {
        value: 'CSS',
        label: 'CSS'
      }, {
        value: 'JavaScript',
        label: 'JavaScript'
      }],
      value: []
    };
  },
  methods: {
  }
}
</script>

<style scoped>
/*@import "stylesheets/_variables.scss";*/


</style>