<template>
  <div class="filther">
        <el-popover
          placement="bottom-start"
          width="400"
          trigger="click"
          v-model="value">
           <el-transfer
           :titles="['скрытые', 'видимые']"
            v-model="datavalue"
            :data="data">
          </el-transfer>
        <el-button @click="getPublics" slot="reference" size="mini" type="info" icon="el-icon-setting" circle></el-button>
 
        </el-popover>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {

  data: function () {
    // const generateData = _ => {
    //   const data = [];
    //   for (let i = 1; i <= 15; i++) {
    //     data.push({
    //       key: i,
    //       label: `Option ${ i }`,
    //       disabled: i % 4 === 0
    //     });
    //   }
    //   return data;
    // };
    return {
      data: [],
      datavalue: [],
      value: false,
      // dialogFormVisible: false,
      // form: {
      //   email: '',
      //   text: '' 
      // },
      alldata: [], 
      formLabelWidth: '80px',
      screenwidth: screenwidth
    };
  },
  watch: {
    value(value) {
      if (!value) {
        this.data = []
      }
    }
 
  }, 
 
  methods: {
 
 getPublics() {
  axios({
        method: 'get',
        url: '/api/v1/vkgrget',
        // params: {
        //   rait: this.value,
        //   pos: this.pos
        // } 
      })
      .then((response) => { 
        var alld = response.data
        console.log(response.data)

      
      // const data = [];
      var self = this
      for (let i = 0; alld[i]; i++) {
        const data = [];
        const grname = alld[i]
        data.push({
          key: i,
          label: String(grname.namegroup).slice(15),
          disabled: false
        });
        self.data = self.data.concat(data)

      }
      // return data;
   

        // this.data = data;

      });
 }
 
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
  justify-content: space-between;

}
.filther {
  padding: 0 0.5em;
}
.el-transfer {
    position: relative;
  z-index: 3000;
}

</style>