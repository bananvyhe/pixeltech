<template>
  <div  class="vmain">
    <v-app >
      <v-container
        class="py-1 px-0 app">
        <v-app-bar 
          height="42px"
          hide-on-scroll
          dense>
          <port></port>
          <v-spacer ></v-spacer>
          <div class="wrap" v-if="$store.getters.token == null" > 
            <reg></reg>
          </div>
          <div class="wrap">
            <log ></log>
          </div>
        </v-app-bar>
      </v-container>
      <v-main>
        <div v-if="!$store.getters.role"  class="heado">
          <heado></heado>
        </div>
        <!-- <topsidepanel></topsidepanel> -->
        <div v-if="$store.getters.role" >
          <div v-if="$store.getters.role.role == 'client'">
            <siteown></siteown>
          </div>
        </div>
      </v-main>
      <v-container
      class="py-1 pb-0  px-0">
        <v-footer
        width="100%"
        class="appbar"
        v-bind="localAttrs"
        :padless="padless">
          <v-card
            flat
            tiless
            width="100%"
            class=" text-center">
            <v-card-text class="white--text">
              {{ new Date().getFullYear() }} — <strong>Pixeltech</strong>
            </v-card-text>
          </v-card>
        </v-footer>
      </v-container>
    </v-app>
  </div>
</template>
<script>
  
  export default {
    
    data: function (){
      return {
        icons: [
          'mdi-home',
          'mdi-email',
          'mdi-calendar',
          'mdi-delete',
        ],
        items: [
          'default',
          'absolute',
          'fixed',
        ],
        padless: false,
        variant: 'default',
          
      }
    },
    computed: {
      localAttrs () {
        const attrs = {}

        if (this.variant === 'default') {
          attrs.absolute = false
          attrs.fixed = false
        } else {
          attrs[this.variant] = true
        }
        return attrs
      },
    },
  }
</script>
<style scoped>
@import "stylesheets/_variables";
/*.app{
  position: relative;
  z-index: 9999;
}*/
.appbar{
  /*lost-center: $lcenter;*/
}
.vmain{
  /*lost-center: $lcenter;*/
}
.heado{
  display: flex;
  /*overflow: visible;*/
  align-items: justify;
  justify-content: center;
  height: 100%;

  /*background-color: #dad;*/
}

.test{
  background-color: #dad;
}
.plash{

  /*background-color: #ada;*/
  position: relative;
 height: 100%;
}
.app{
  /*background-color: #dad;*/
  /*background-color: var(--v-background-base) !important;*/
}
  .v-app-bar{
  /*float: left;*/
  
}
.topsidepanel{
  margin-top: 4em;
  /*background-color: #dad;*/
}
</style>