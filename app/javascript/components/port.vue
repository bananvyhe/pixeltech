<template>
  <div class="port" id="port">
    <div class=" " v-if="!$store.getters.role">
  <v-menu
      v-model="menu"
      :close-on-content-click="false"
      :nudge-width="200"
      offset-x
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn 
        class="mx-2"
        fab
          x-small
          color="indigo"
          dark
          v-bind="attrs"
          v-on="on"
        >
         <!-- <v-icon>mdi-collage</v-icon> -->
          <v-icon>mdi-view-dashboard</v-icon>
        </v-btn>
      </template>

      <v-card>
        <v-list>
          <v-list-item>
            <v-list-item-avatar>
              <img
                src="https://cdn.vuetifyjs.com/images/john.jpg"
                alt="John"
              >
            </v-list-item-avatar>

            <v-list-item-content>
              <v-list-item-title>John Leider</v-list-item-title>
              <v-list-item-subtitle>Founder of Vuetify</v-list-item-subtitle>
            </v-list-item-content>

            <v-list-item-action>
              <v-btn
                :class="fav ? 'red--text' : ''"
                icon
                @click="fav = !fav"
              >
                <v-icon>mdi-heart</v-icon>
              </v-btn>
            </v-list-item-action>
          </v-list-item>
        </v-list>

        <v-divider></v-divider>

        <v-list>
          <v-list-item>
            <v-list-item-action>
              <v-switch
                v-model="message"
                color="purple"
              ></v-switch>
            </v-list-item-action>
            <v-list-item-title>Enable messages</v-list-item-title>
          </v-list-item>

          <v-list-item>
            <v-list-item-action>
              <v-switch
                v-model="hints"
                color="purple"
              ></v-switch>
            </v-list-item-action>
            <v-list-item-title>Enable hints</v-list-item-title>
          </v-list-item>
        </v-list>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            text
            @click="menu = false"
          >
            Cancel
          </v-btn>
          <v-btn
            color="primary"
            text
            @click="menu = false"
          >
            Save
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-menu>
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