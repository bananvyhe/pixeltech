<template>
  <div >
    <!-- <v-app class="vmain" > -->
 
      <!-- <v-main > -->
        <!-- <topsidepanel ></topsidepanel> -->
        <!-- <div style="height: 4em;"></div> -->
       <!--  <div v-if="!$store.getters.role">
          <heado ></heado>
        </div> -->
        <div class="basetext pay">
<!--       баланс: <%= @client.ballance%>  руб. -->
          <br>
     
          <v-form v-model="valid" method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">
            <v-container>
              <h3>пополнить счет:</h3>
              <v-row >
                <v-col
                class="py-0"
                  cols="4"
                   >
                  <v-text-field name="sum" 
                    v-model="firstname"
                    :rules="nameRules"
                    label="введите сумму"
                    required
                  ></v-text-field> ascasc
                </v-col>
              </v-row>
    <v-btn
      v-if="!chip1 && !chip2 && !chip3 && !chip4"
      close
      color="primary"
      dark
      @click="chip1 = true, chip2 = true, chip3 = true, chip4= true"
    >
      Reset Chips
    </v-btn>

    <v-chip
      v-if="chip1"
      class="ma-2"
      close
      @click:close="chip1 = false"
    >
      Closable
    </v-chip>
<v-chip
      v-if="chip2"
      class="ma-2"
      close
      color="primary"
      text-color="white"
      @click:close="chip2 = false"
    >
      Remove
    </v-chip>

    <v-chip
      v-if="chip3"
      class="ma-2"
      close
      color="success"
      outlined
      @click:close="chip3 = false"
    >
      Success
    </v-chip>

    <v-chip
      v-if="chip4"
      class="ma-2"
      close
      color="orange"
      label
      outlined
      @click:close="chip4 = false"
    >
      Complete
    </v-chip> 
     <v-row
    align="center"
    justify="space-around"
  >
    <v-btn depressed>
      Normal
    </v-btn>
    <v-btn
      depressed
      color="primary"
    >
      Primary
    </v-btn>
    <v-btn
      depressed
      color="error"
    >
      Error
    </v-btn>
    <v-btn
      depressed
      disabled
    >
      Disabled
    </v-btn>
  </v-row>
              <v-radio-group v-model="radios" class="my-0" >
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
               <input type="hidden" name="receiver" value="410013909808332">
       <input type="hidden" name="label" value="<%=current_user.id %>">    
      <input type="hidden" name="quickpay-form" value="donate">    
      <input type="hidden" name="targets" value="хостинг">    
              <v-row class="px-3">
                <v-btn type="submit" small>Оплатить</v-btn>
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
        {{ballance}}
        <posts class="topsidepanel "></posts> 
 
      <!-- </v-main>  -->
    <!-- </v-app> -->
  </div>
</template>
<script>
  import axios from 'axios' 
  export default {
    
    data: function (){
      return {
        chip1: true,
         chip2: true,
        chip3: true,
        chip4: true,
        ballance:"",
        radios: 'AC',
        valid: false,
        firstname: '',
        nameRules: [
          v => !!v || 'необходимо ввести сумму',
          v => isNaN(v) == false || 'допускается только ввод чисел',
        ],
     
      }
    },
     beforeCreate () {
    document.querySelectorAll('[data-app="true"]')[0].removeAttribute('data-app')
  },    
     
    mounted() {
      this.getBallance()
    },
    methods: {
      getBallance(){
        if (this.$store.getters.role) {
          axios({
          method: 'get',
          url: '/clients',
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          })
          .then((response) => {
            console.log(response.data)
            if (response.data){
              this.ballance = response.data 
            }
          })
          .catch(function (error) {
            console.log(error);
          });             
        }       
      }
    }
     
  }
</script>
<style scoped>
@import "stylesheets/_variables";

#app{
  /*background-color: var(--v-background-base);*/
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