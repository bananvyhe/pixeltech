<template>
  <div  >
    <v-app class="vmain">
      <v-app-bar app>
 
      </v-app-bar>
      <v-main >
        <topsidepanel></topsidepanel>

        <div v-if="$store.getters.role">
          <div v-if="$store.getters.role.role == 'client'">
            <siteown></siteown>
          </div>
        </div>

        <div v-if="!$store.getters.role">
          <heado></heado>
        </div>

        <posts class="topsidepanel "></posts>

      </v-main>
    </v-app>
  </div>
</template>
<script>
  
  export default {
    
    data: function (){
      return {
        
      }
    },

  }
</script>
<style scoped>
@import "stylesheets/_variables";
#app{
  /*background-color: #dad;*/
  /*background-color: var(--v-background-base) !important;*/
}
.vmain, .v-app-bar{
  /*float: left;*/
  lost-center: $lcenter;
}
.topsidepanel{
  margin-top: 4em;
  /*background-color: #dad;*/
}
</style>