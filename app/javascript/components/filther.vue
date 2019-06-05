<template>
  <div class="filther">
        <el-popover
          placement="bottom-start"
          width="530"
          trigger="click">
           <el-transfer
           :titles="['набор в базе', 'ваш набор']"
            v-model="value"
            :data="data">
          </el-transfer>
        <el-button slot="reference" size="mini" type="info" icon="el-icon-setting" circle></el-button>
 
        </el-popover>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {

  data: function () {
    const generateData = _ => {
      const data = [];
      for (let i = 1; i <= 15; i++) {
        data.push({
          key: i,
          label: `Option ${ i }`,
          disabled: i % 4 === 0
        });
      }
      return data;
    };
    return {
      data: generateData(),
      value: [1, 4],
      dialogFormVisible: false,
      form: {
        email: '',
        text: '' 
      },
      formLabelWidth: '80px',
      screenwidth: screenwidth
    };
  },
 
 
  methods: {
 
 
 
  }
}
function parseCalc() {
  let screenw = document.body.clientWidth;
  screenwidth.value = document.body.clientWidth;
}
// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>

<style scoped>
@import "stylesheets/_variables";


.el-transfer{
  display: flex;
  justify-content: center;

}
.filther {
  padding: 0 0.5em;
}
.el-transfer {
    position: relative;
  z-index: 3000;
}

</style>