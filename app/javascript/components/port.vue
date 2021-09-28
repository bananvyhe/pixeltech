<template>
  <div class="port">
    <div v-if="!$store.getters.role">
      <v-menu 
        v-model="menu"
        :close-on-content-click="false"
        :nudge-width="200"
        offset-x>
        <template v-slot:activator="{ on, attrs }"  >
          <v-btn 
            icon
            v-bind="attrs"
            v-on="on">
            <v-icon  >mdi-view-module</v-icon>
          </v-btn>
        </template> 
        <v-card >
          <v-list class="py-1">
            <v-list-item class="px-2 py-0">
              <div v-for="(item, index) in items" class="py-0 port" >
                <v-card-title class="headline" v-html="item.title" >                  
                </v-card-title>
                <v-card-subtitle v-html="item.subtitle"></v-card-subtitle>
              </div>
            </v-list-item>
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
      menu: false,
       items: [
        
        {
          avatar: '',
          price: '30 тыс.', 
          title: '<a href="https:impuls-psy.ru" target="_blank">Impuls-psy.ru</a>',
          subtitle: `<span class="text--primary">Психологический центр</span> &mdash; веб-сайт с несколькими разделами с простым редактором контента. Обычный сайт без сильной программной части.`,
        },
 
        {
          avatar: '',
          price: '120+ тыс.', 
          title: '<a href="https:farmspot.ru" target="_blank">Farmspot.ru</span>',
          subtitle: `<span class="text--primary">Игровой форум</span> &mdash; веб-приложение, уровни доступа, механики для пользователей (прокачка аккаунта, среда для взаимодействие между пользователями). Парсер-робот выполняющий функции в заданное время`,
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
@import "../stylesheets/_variables.scss";
.price{
  position: absolute;
  display: flex;
  justify-content: flex-end;
  align-items: flex-end;
  height: 100%;
  width: 100%;
  font-weight: 300;
  /*opacity: 50%;*/
  display: flex;
  /*align-self: center;*/
  div{
    /*padding: 0.1em 0.4em;*/
    display: flex;
  }
}
.list{
   
}
.listit {
 
}
.port{
  lost-column: 1/2 2 0.5em;   
  position: relative;  
  /*padding: 0.5em;*/
}
.popover-content {
  /*background-color:  $str5;*/
  /*padding: 0.5em 0.8em;*/
} 
</style>