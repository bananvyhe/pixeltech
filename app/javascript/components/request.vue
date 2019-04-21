<template>
  <div class="request">
    <div class="scale">
      <div class="swing">
        <el-button type="info" icon="el-icon-message" size="mini" circle @click="dialogFormVisible = true">
        </el-button>
      </div>
    </div>
    <el-dialog class="pos" top="18vh" :width="calcul" title="Заявка:" :visible.sync="dialogFormVisible" >
      <el-form :model="form" ref="forma">  
        <el-form-item 
          prop="email" 
          size="mini" 
          label="Емайл:"
          :rules="[
            { required: true, message: 'Введите адрес', trigger: 'blur' },
            { type: 'email', message: 'Неправильный адрес почты', trigger: ['blur', 'change'] }
          ]">
          <el-input v-model="form.email" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item prop="textarea" size="mini" label="Сообщение:">
          <el-input type="textarea" v-model="form.text" auto-complete="off">
          </el-input>
        </el-form-item>
        <el-form-item size="mini"  style="margin-bottom: 1.2em;">
          <el-button  @click="dialogFormVisible = false">Отмена</el-button><el-button   type="primary" @click="handle" >Подтвердить</el-button>
        </el-form-item>    
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''}
export default {
  data: function () {
    return {
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
      return screenwidth.value > 400 ? '35'+'em' : '90' +'%'
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
@import "stylesheets/_variables";
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
  z-index: 6000;
 /* position: absolute;*/
  display: flex;
 /* right: 0;*/
} 

</style>