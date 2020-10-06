<template>
  <div  >
    <v-app class="vmain">
      <v-app-bar app>
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
      v-bind="localAttrs"
      :padless="padless"
       >
        <v-card
          flat
          tile
          width="100%"
          class="red lighten-1 text-center"
        >
          <v-card-text>
            <v-btn
              v-for="icon in icons"
              :key="icon"
              class="mx-4"
              icon
            >
              <v-icon size="24px">
                {{ icon }}
              </v-icon>
            </v-btn>
          </v-card-text>

          <v-divider></v-divider>

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
#app{
  /*background-color: #dad;*/
  /*background-color: var(--v-background-base) !important;*/
}
  .v-app-bar{
  /*float: left;*/
  lost-center: $lcenter;
}
.topsidepanel{
  margin-top: 4em;
  /*background-color: #dad;*/
}
</style>