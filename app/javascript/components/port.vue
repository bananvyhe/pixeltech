<template>
  <div class="port">
  <div class=" " v-if="!$store.getters.role">
 
              <v-btn small ref="popoverReference"" @click="openPopover">сайты</v-btn>
 <VueSlickPopover
      v-if="isPopoverVisible"
      :popover-options="popoverOptions"
      @closePopover="closePopover">


      <VueSlickPopoverContent>
     <div class="popover-content">
      <a target="_blank" href="https://impuls-psy.ru">impuls-psy.ru</a><br>
      <a target="_blank" href="https://farmspot.ru">farmspot.ru</a>
     </div>
      </VueSlickPopoverContent>
    </VueSlickPopover>
  
 
          </div>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {

  data: function () {
    return {
        isPopoverVisible: false,
      popoverOptions: {
        animation: "scale-fade",
        popoverReference: null,
        placement: "top",
        offset: "0,0"
      },
    };
  },
  watch: {
 
  }, 
  computed: {

  },
  mounted() {
     this.popoverOptions.popoverReference = this.$refs.popoverReference
  },
  methods: {
  openPopover() {
    this.isPopoverVisible = true
  },  
  closePopover() {
    this.isPopoverVisible = false
  },    
  }
}
 
// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "stylesheets/_variables";
.port{
  position: relative;
  
}
.popover-content {
  background-color:  $str5;
  padding: 0.5em 0.8em;
} 
</style>