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
  props: {
    myFilterInc: {
      type: Array
    }
  },
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
      myFilterInc: this.data,
      datavalue: [1,2],
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
    datavalue() {
      this.$emit('filterRes', this.datavalue)
    },
    value(value) {
      if (!value) {
        var self = this;
        setTimeout(function(){
          self.data = []
          // self.status = '';
        },500 );
      }
    }
  }, 
  computed: {

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
      this.data = []
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