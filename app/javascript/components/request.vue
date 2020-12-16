<template>
  <div class="request">
    <v-dialog class="pos"  :width="calcul" :visible.sync="dialogFormVisible"  >
      <template v-slot:activator="{ on, attrs }">
        <div class="scale">
          <div class="swing">
            <v-btn icon
              small
              v-bind="attrs"
              v-on="on"
               @click="dialogFormVisible = true">почта
            </v-btn>
          </div>
        </div>          
      </template>
      <v-card
        class="mx-auto">
        <v-card-title class="headline grey darken-2 px-3">
            Связь с разработчиком
          </v-card-title>
          <v-container>
        <v-form 
          class="my-0"
          :model="form" 
          ref="forma">  
          <v-text-field  
            class="pt-2 pb-1 px-1"

            v-model="form.email"
            :rules="emailRules"
            type="text"
            label="ваша почта"
          >
   
          </v-text-field>
          <v-container class="px-0">
          <v-textarea
           class="px-1"
          outlined
          name="input-7-4"
          label="Ваше сообщение..."
          value=""
        ></v-textarea></v-container>
 
           <v-card-actions class="px-0 py-0">
            <v-btn   @click="dialogFormVisible = false">Отмена</v-btn><v-btn class=" " @click="handle" >Отправить</v-btn> </v-card-actions>
     
        </v-form></v-container>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {
  data: function () {
    return {

      emailRules: [
        v => !!v || 'Обязательно к заполнению',
        v => /.+@.+/.test(v) || 'E-mail не валиден ',
         // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
      ],      
      dialogFormVisible: false,
      form: {
        email: '',

        text: '' 
      },
      formLabelWidth: '80px',
      screenwidth: screenwidth
    };
  },
  computed: {
    calcul: function(){
      return screenwidth.value > 400 ? '28'+'em' : '90' +'%'
    }
  },
  mounted() {
    parseCalc()
  },
  methods: {
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    open() {
      const h = this.$createElement;

      this.$notify({
        type: 'success',
        title: 'Спасибо',
        message: h('i', { style: 'color: teal' }, 'Ваше сообщение отправлено.'),
        position: 'bottom-right'
      });
    },    
    handle: function () {
      this.onSubmit();
      this.dialogFormVisible = false
      var contain = $('.contain');
      contain.addClass('hidden');
      var bg = $('#bg');
      bg.addClass('hidden');
      this.open();
      this.resetForm('forma');      
      // this.dialogFormVisible = false
    },
    onSubmit: function () {
      axios.post('/api/v1/request', {
        user: {
          email: this.form.email.toLowerCase().trim(),
          text: this.form.text
          // password_confirmation: this.form.password_confirmation
        }
      })
      // .then(response => {
      //   if (response.data.errors) {
      //     console.log(response.data.errors)
      //     this.error = response.data.errors;

      //   var self = this
      //   this.$message.error({
      //     showClose: true,
      //     message: self.error,
      //     onClose: function(){
      //       self.error = '' 
      //   }
      // });

    }
  }
}
function parseCalc() {
  let screenw = document.body.clientWidth;
  screenwidth.value = document.body.clientWidth;
}
// window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>

<style scoped>


.scale {
  -webkit-animation: pulsate-fwd 3s ease-out infinite both;
  animation: pulsate-fwd 3s ease-out infinite both; 
}
.swing {
  -webkit-animation: swing-fwd 3s ease-out infinite both;
  animation: swing-fwd 3s ease-out infinite both; 
}
@-webkit-keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  30% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  100% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
}
@keyframes pulsate-fwd {
  0% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  30% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
  40% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  100% {
    -webkit-transform: scale(0.9);
            transform: scale(0.9);
  }
}
@-webkit-keyframes swing-fwd {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  15% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  20% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }
  25% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  30% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }   
  35% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  40% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }           
  45% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }  
  100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
}
@keyframes swing-fwd {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  10% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  15% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  20% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }
  25% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  30% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }   
  35% {
    -webkit-transform: rotate(-10deg);
            transform: rotate(-10deg);
  }
  40% {
    -webkit-transform: rotate(10deg);
            transform: rotate(10deg);
  }           
  45% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }  
  100% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
}
.el-input--mini {
  width: 16em;
}
.flexlab {
   
}
.lab {
  display: flex;
  justify-content: flex-end;
/* padding-top: 0.2em;*/
  right: 0px;
}
.request  {
  z-index: 5000;
 
 /* position: absolute;*/
  display: flex;
 /* right: 0;*/
} 

</style>