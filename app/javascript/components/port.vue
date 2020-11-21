<template>
  <div class="port" id="port">
    <div class=" " v-if="!$store.getters.role">
      <v-menu 
        v-model="menu"
        :close-on-content-click="false"
        :nudge-width="200"
        offset-x>
        <template v-slot:activator="{ on, attrs }"  >
          <v-btn 
            icon
            small
            v-bind="attrs"
            v-on="on">
            <v-icon x-large>mdi-language-ruby-on-rails</v-icon>
          </v-btn>
        </template>    
        <v-card 
          class="mx-auto  
          align-center">
          <v-list>
            <v-list-item>
          <div v-for="(item, index) in items" class="py-0 port" > 

              <v-card-title v-html="item.title">                  
              </v-card-title>
              <v-card-subtitle v-html="item.subtitle"></v-card-subtitle>

 
          </div>
          </v-list-item>
          <!--  <v-item-group  cols="12">
          <template v-for="(item, index) in items" class="py-0 listit" > 
           
              <v-subheader
                v-if="item.header"
                :key="item.header"
                v-text="item.header">
              </v-subheader>
              
              <v-row v-if="item.title"  >  
              
                <v-col  cols="4">
                  <v-item>  
                  <v-card 
                    class="mx-auto  align-center">
                    <v-card-title v-html="item.title">                  
                    </v-card-title>
                    <v-card-subtitle v-html="item.subtitle"></v-card-subtitle>
                  </v-card>
                  </v-item>
                </v-col>  
              
              </v-row>
          
          </template>    
        </v-item-group> -->
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
          avatar: '20k',
          title: '<a href="https:impuls-psy.ru">Impuls-psy.ru</a>',
          subtitle: `<span class="text--primary">Психологический центр</span> &mdash; Сайт с админ-панелью для редактирования контента.`,
        },
 
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
.list{
   
}
.listit {
 
}
.port{
   lost-column: 1/4 4 0.5em;     
}
.popover-content {
  /*background-color:  $str5;*/
  padding: 0.5em 0.8em;
} 
</style>