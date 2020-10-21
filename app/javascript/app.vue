<template>
  <div  class="vmain">
    <v-app >
      <v-app-bar app
      class="appbar"
      dense>
        <v-app-bar-nav-icon>
        </v-app-bar-nav-icon>
      <v-toolbar-title>
        Page title
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <div class="wrap" v-if="$store.getters.token == null" > 
            <reg></reg>
          </div>
          <div class="wrap">
          <log ></log>
          </div>
        <v-btn icon>
          <v-icon>mdi-heart</v-icon>
        </v-btn>
      <v-btn icon>
        <v-icon>mdi-magnify</v-icon>
      </v-btn>     
      <v-menu
        left
        bottom>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on">
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>
        <v-list>
          <v-list-item
            v-for="n in 5"
            :key="n"
            @click="() => {}">
            <v-list-item-title>Option {{ n }}</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>         
      </v-app-bar>
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
        <!-- <posts class="topsidepanel "></posts> -->
      </v-main>
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
<!--           <v-card-text>
            <v-btn
              v-for="icon in icons"
              :key="icon"
              class="mx-3"
              icon
            >
              <v-icon size="20px">
                {{ icon }}
              </v-icon>
            </v-btn>
          </v-card-text>

          <v-divider></v-divider> -->

          <v-card-text class="white--text">
            {{ new Date().getFullYear() }} — <strong>Pixeltech</strong>
          </v-card-text>
        </v-card>
      </v-footer>
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
.appbar{
  lost-center: $lcenter;
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