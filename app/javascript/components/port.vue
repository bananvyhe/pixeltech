<template>
  <div class="port" id="port">
    <div class=" " v-if="!$store.getters.role">
      <v-menu 
      v-model="menu"
      :close-on-content-click="false"
      :nudge-width="200"
      offset-y>
      <template v-slot:activator="{ on, attrs }" >
        <v-btn icon
          v-bind="attrs"
          v-on="on">
          <v-icon x-large>mdi-language-ruby-on-rails</v-icon>
        </v-btn>
      </template>    
      <v-card
        max-width="450"
        class="mx-auto">
        <v-list two-line>
          <template v-for="(item, index) in items" class="py-0  " >
            <v-subheader
              v-if="item.header"
              :key="item.header"
              v-text="item.header">
            </v-subheader>
            <v-divider
              v-else-if="item.divider"
              :key="index"
              :inset="item.inset"
              class="mb-0 "
            ></v-divider>
            <v-list-item 
              v-else
              :key="item.title">
<!--           <v-list-item-avatar>
            <v-img :src="item.avatar"></v-img>
          </v-list-item-avatar> -->

              <v-list-item-content class="py-0 ">
                <v-list-item-title v-html="item.title"></v-list-item-title>
                <v-list-item-subtitle v-html="item.subtitle"></v-list-item-subtitle>
              </v-list-item-content>
              </v-list-item> 
            </template> 
          </v-list>
        </v-card>
      </v-menu>
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
        { header: 'Разработано на: Ruby on Rails 5.2 + Vue.js 2.0:' },
        {
          avatar: '20k',
          title: '<a href="https:impuls-psy.ru">Impuls-psy.ru</a>',
          subtitle: `<span class="text--primary">Психологический центр</span> &mdash; Сайт с админ-панелью для редактирования контента.`,
        },
        { divider: true, inset: true },
        {
          avatar: '50k',
          title: '<a href="https:farmspot.ru">Farmspot.ru</span>',
          subtitle: `<span class="text--primary">Игровой форум</span> &mdash; форум для групп с управлением уровнями доступа и внутренними механиками соц взаимодейставия.`,
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