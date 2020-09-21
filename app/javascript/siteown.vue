<template>
  <div>
    <v-app class="vmain" >
      <v-main >
 
        <topsidepanel ></topsidepanel>
        <div style="height: 4em;"></div>
        <div v-if="!$store.getters.role">
          <heado ></heado>
        </div>
    <div class="basetext pay">
<!--       баланс: <%= @client.ballance%>  руб. -->
      <br>
     пополнить счет:
<v-form v-model="valid">
    <v-container>
      <v-row>
        <v-col
          cols="12"
          md="4"
        >
          <v-text-field
            v-model="firstname"
            :rules="nameRules"
          
            label="Сумма к оплате"
            required
          ></v-text-field>
        </v-col>

 

 
      </v-row>
    </v-container>
  </v-form>
<!--        <form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">    
      <input type="hidden" name="receiver" value="410013909808332">
       <input type="hidden" name="label" value="<%=current_user.id %>">    
      <input type="hidden" name="quickpay-form" value="donate">    
      <input type="hidden" name="targets" value="хостинг">    
      <input   name="sum" value="2" data-type="number"> руб.    -->

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
 valid: false,
      firstname: '',
      nameRules: [
        v => !!v || 'необходимо ввести сумму',
        v => isNaN(v) == false || 'допускается только ввод чисел',
      ],
     
      }
    },
     
  }
</script>
<style scoped>
@import "stylesheets/_variables";
#app{
  background-color: var(--v-background-base);
}
.pay{
  padding: 0.3em 0.6em;
}
.vmain{
  lost-center: $lcenter;
}
.topsidepanel{
  
}
</style>