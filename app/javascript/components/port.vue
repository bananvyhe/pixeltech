<template>
  <div class="port" id="port">
    <div class=" " v-if="!$store.getters.role">
      <v-menu
      v-model="menu"
      :close-on-content-click="false"
      :nudge-width="200"
      offset-x>
      <template v-slot:activator="{ on, attrs }">
        <v-btn icon
          dark
          v-bind="attrs"
          v-on="on">
        <v-icon>mdi-magnify</v-icon>
      </v-btn>
      </template>    
      <v-card
        max-width="450"
        class="mx-auto">
    <v-list three-line>
      <template v-for="(item, index) in items">
        <v-subheader
          v-if="item.header"
          :key="item.header"
          v-text="item.header"
        ></v-subheader>

        <v-divider
          v-else-if="item.divider"
          :key="index"
          :inset="item.inset"
        ></v-divider>

        <v-list-item
          v-else
          :key="item.title"
        >
          <v-list-item-avatar>
            <v-img :src="item.avatar"></v-img>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title v-html="item.title"></v-list-item-title>
            <v-list-item-subtitle v-html="item.subtitle"></v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>
      </template>
    </v-list>
  </v-card></v-menu>
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
       items: [
        { header: 'Разработка сайтов' },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
          title: 'Impuls-psy.ru',
          subtitle: `<span class="text--primary">Ali Connors</span> &mdash; I'll be in your neighborhood doing errands this weekend. Do you want to hang out?`,
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
          title: 'Summer BBQ <span class="grey--text text--lighten-1">4</span>',
          subtitle: `<span class="text--primary">to Alex, Scott, Jennifer</span> &mdash; Wish I could come, but I'm out of town this weekend.`,
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
          title: 'Oui oui',
          subtitle: '<span class="text--primary">Sandra Adams</span> &mdash; Do you have Paris recommendations? Have you ever been?',
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
          title: 'Birthday gift',
          subtitle: '<span class="text--primary">Trevor Hansen</span> &mdash; Have any ideas about what we should get Heidi for her birthday?',
        },
        { divider: true, inset: true },
        {
          avatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
          title: 'Recipe to try',
          subtitle: '<span class="text--primary">Britta Holt</span> &mdash; We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
        },
      ],
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