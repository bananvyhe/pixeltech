<template>
  <div class="expbar">
		<div v-if="$store.getters.role" >
			<div class="backbar" v-if="$store.getters.token">
				<div class="mediumtext nikname">{{$store.getters.role.username}}</div>
				<div class="expbar"> 
					<div class="expline">
						<el-progress v-if="$store.getters.gamebo" class="elpro aprior " :stroke-width="3" :percentage="Number(lvlConversion[1])"></el-progress>
					</div>
					<div v-if="$store.getters.gamebo" class="lvl">{{lvlConversion[0]}}&nbsp;</div>
					<span v-if="$store.getters.role.karma != null">карма:{{$store.getters.role.karma}}</span>
				</div>
			</div>
		</div>

  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {
  data: function () {
    return {
 
    };
  },
  watch: {
 
  }, 
  computed: {

  },
  mounted() {
     
  },
  methods: {
     
     
  }
}
 
// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
 
</style>