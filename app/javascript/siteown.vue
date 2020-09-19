<template>
  <div>
    <v-app class="vmain" >
      <v-main >
        <topsidepanel ></topsidepanel>
        <div v-if="!$store.getters.role">
          <heado ></heado>
        </div>
        <posts class="topsidepanel "></posts>siteowners

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
.vmain{
  lost-center: $lcenter;
}
.topsidepanel{
  margin-top: 4em;
  /*background-color: #dad;*/
}
</style>