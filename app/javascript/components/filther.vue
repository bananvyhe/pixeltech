<template>
  <div class="filther">
    <!-- {{datavalue}}
    {{data}}
    <br><br> {{alld}} -->
    <el-popover
      placement="bottom-start"
      width="400"
      trigger="click"
      v-model="value"> 
      {{finaldata}}
      <el-transfer
       :titles="['скрытые', 'видимые']"
        v-model="finaldata"
        :data="alld">
      </el-transfer>
      <!-- {{alld}}{{datavalue}}{{data}} -->
      <el-button  slot="reference" size="mini" type="info" icon="el-icon-setting" circle></el-button>
    </el-popover>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {
  data: function () {
    return {
      alld:[],
      finaldata: [],
      data: [],
      myFilterInc: this.data,
      datavalue: [],
      value: false,
      alldata: [], 
      formLabelWidth: '80px',
      screenwidth: screenwidth
    };
  },
  watch: {
    finaldata() {
      this.$emit('filterRes', this.finaldata)
    },
  }, 
  computed: {

  },
  mounted() {
    this.getPublics()
  },
  methods: {
    getPublics() {
    axios({
      method: 'get',
      url: '/api/v1/vkgrget',
      })
      .then((response) => { 
        this.alld = response.data
        this.datavalue = []
        var self = this
        for (let i = 0; this.alld[i]; i++) {
          const grname = this.alld[i]
          self.datavalue = self.datavalue.concat(grname.key)
        }
        this.finaldata = this.datavalue
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