<template>
  <div class="port" id="port">
    <div class=" " v-if="!$store.getters.role">

      <v-tooltip bottom
          v-model="show"
          top>
        <template v-slot:activator="{ on, attrs }">
                <v-btn 
        @click="show = !show">
        
                    <v-icon color="grey lighten-1">
                mdi-view-carousel-outline
            </v-icon>
      </v-btn>
<!--           <v-btn
            icon
            v-bind="attrs"
            v-on="on">
            <v-icon color="grey lighten-1">
                mdi-cart
            </v-icon>
          </v-btn> -->
        </template>

        <v-card
  elevation="2"
> <v-list-item three-line>
      <v-list-item-content>
        <div class="overline mb-4">
          OVERLINE
        </div>
        <v-list-item-title class="headline mb-1">
          Headline 5
        </v-list-item-title>
        <v-list-item-subtitle>Greyhound divisely hello coldly fonwderfully</v-list-item-subtitle>
      </v-list-item-content>

      <v-list-item-avatar
        tile
        size="80"
        color="grey"
      ></v-list-item-avatar>
    </v-list-item>
           <a target="_blank" href="https://impuls-psy.ru">impuls-psy.ru</a><br>
            <a target="_blank" href="https://farmspot.ru">farmspot.ru</a> 
</v-card>

      </v-tooltip>
<!--       <v-btn small ref="popoverReference" @click="openPopover">сайты</v-btn>
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
      </VueSlickPopover> -->
    </div>
  </div>
</template>

<script>
// import { VueSlickPopover, VueSlickPopoverContent } from "vue-slick-popover"
import axios from 'axios'
// import "vue-slick-popover/dist/vue-slick-popover.css" 
export default {
    // name: "Port",
    // components: {
    //   VueSlickPopover,
    //   VueSlickPopoverContent
    // },
  data: function () {
    return {
      show: false,
      // isPopoverVisible: false,
      // popoverOptions: {
      //   animation: "scale-fade",
      //   popoverReference: null,
      //   placement: "top",
      //   offset: "0,0"
      // },
    };
  },
  mounted() {
    // this.popoverOptions.popoverReference = this.$refs.popoverReference
  },
  methods: {
    // openPopover() {
    //   this.isPopoverVisible = true
    // },  
    // closePopover() {
    //   this.isPopoverVisible = false
    // }    
  }
}
 
// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "../stylesheets/_variables";
.port{
  /*position: relative;*/

}
.popover-content {
  /*background-color:  $str5;*/
  padding: 0.5em 0.8em;
} 
</style>