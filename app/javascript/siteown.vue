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
     
          <v-form v-model="valid">
            <v-container>
              <h3>пополнить счет:</h3>
              <v-row >
                <v-col
                class="py-0"
                  cols="4"
                   >
                  <v-text-field
                    v-model="firstname"
                    :rules="nameRules"
                    label="введите сумму"
                    required
                  ></v-text-field> 
                </v-col>
              </v-row>

              <v-radio-group v-model="radios" class="my-0">
                <v-radio 
                  label="Яндекс деньгами"
                  value="PC"
                >
                </v-radio>
                <v-radio
                  label="Банковской картой"
                  value="AC"
                >                
                </v-radio>
              </v-radio-group>
              <v-row class="px-3">
                <v-btn small>Оплатить</v-btn>
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
        radios: 'AC',
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