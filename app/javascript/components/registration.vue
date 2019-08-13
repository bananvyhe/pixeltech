<template>
	<div class="reg">
				<el-button type="primary" plain size="small"  @click="dialogFormVisible = true">Регистрация</el-button>
					<el-dialog top="26vh" v-bind:width="screenwidth.value > '350' ? '30'+'em' : '90' +'%'" :visible.sync="dialogFormVisible" :lock-scroll="false">
						<h1 style="marginTop: -0.2em;">Создать аккаунт:</h1>
				  <el-form :model="form" :rules="rules" ref="form"> 
				    <el-form-item 
				    	prop="email" 
				    	size="mini" 
				    	label="Емайл:">
				      <el-input v-model="form.email" auto-complete="off"></el-input>
				    </el-form-item>
				    
				    <el-form-item prop="password" size="mini" label="Пароль:">
				      <el-input type="password" v-model="form.password" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item  prop="password_confirmation" size="mini" label="">
				      <el-input type="password" placeholder="Повторите пароль" v-model="form.password_confirmation" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item  prop="username" size="mini" label="Никнейм:">
				      <el-input v-model="form.username" auto-complete="off"></el-input>
				    </el-form-item>
	<!-- 			    <el-form-item size="mini" label="Пароль еще раз:" :label-width="formLabelWidth">
				      <el-input v-model="form.password" auto-complete="off"></el-input>
				    </el-form-item> -->
				   <!--  <el-form-item label="Zones" :label-width="formLabelWidth">
				      <el-select v-model="form.region" placeholder="Please select a zone">
				        <el-option label="Zone No.1" value="shanghai"></el-option>
				        <el-option label="Zone No.2" value="beijing"></el-option>
				      </el-select>
				    </el-form-item> -->
				    <el-form-item size="mini">
					 		<el-button  @click="dialogFormVisible = false">Отмена</el-button>
						  <el-button   type="primary" @click="handle" >Подтвердить</el-button>
						</el-form-item>
				 		</el-form>
				</el-dialog>	
			 
	</div>
</template>

<script>
	import axios from 'axios'
    

	let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	axios.defaults.headers.common['X-CSRF-Token'] = token
	axios.defaults.headers.common['Accept'] = 'application/json'
	let screenwidth = {value: ''}
	 
	export default {
		data() {
			var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('Введите пароль'));
        } else {
          if (this.form.checkPass !== '') {
          this.$refs.form.validateField('checkPass');
        }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('Еще раз введите пароль'));
        } else if (value !== this.form.password) {
          callback(new Error('Пароли не совпадают'));
        } else {
          callback();
        }
      };
      var validateUsername = (rule, value, callback) => {
      	var self = this;
	      setTimeout(function(){
	        if (value === self.responseName) {
          	callback(new Error('Имя занято')); 
	        } else if (value == '') {
	          callback(new Error('Введите ваш псевдоним'));
	        } else {
	          callback();
	        }
	      },100 );  
      };
      var validateEmail = (rule, value, callback) => {
      	var self = this;
	      setTimeout(function(){
	        if (value === self.responseEmail) {
          	callback(new Error('Уже зарегистрирован')); 
	         } else if (value == '') {
	          callback(new Error('Введите адрес почты')); 
	        } else {
	          callback();
	        }
	      },100 );  
      };
	    return {
	    	responseEmail: false,
	    	responseName: false,
	      dialogFormVisible: false,
	      form: {
	        email: '',
	        username: '',
	        password: '',
	        password_confirmation:''
	      },
	      formLabelWidth: '110px',
        rules: {
          email: [
          { required: true, validator: validateEmail, trigger: ['blur', 'change'] },
					      { type: 'email', message: 'Неправильный адрес почты', trigger: ['blur', 'change'] }
          ],
          password: [
            {min: 6, max: 128, message: 'длина пароля от 6 знаков', trigger: 'blur'  }
          ],
          password_confirmation: [
            { validator: validatePass2, trigger: 'blur' }
          ],
          username: [
            { required: true, validator: validateUsername, trigger: ['blur', 'change']   }
          ]
        },
	    	screenwidth: screenwidth,
	    };
	  },
	  watch: {
	  	'form.username': function(val){
  			console.log(val)
  			axios.get('/api/v1/users', {
	  			params: {
			      username: val
			    }
	  		})
      	.then((response) => { 	 
    			this.responseName =  response.data.username

       	})
      	.catch(function (error) {
        	console.log(error);
      	}); 
  			console.log("username check")
	  	},
	  	'form.email': function(val){
	  		console.log(val)
	  		axios.get('/api/v1/users', {
	  			params: {
			      email: val
			    }
	  		})
	      .then((response) => {
	       	this.responseEmail =  response.data.email
	      })
	      .catch(function (error) {
	        console.log(error);
	      });
	  	}
	  },
	  computed: {
	  	magicWidth: function(){
        console.log("computed");
        if(this.age > 17)
          return "доступ разрешен";
        else
          return "доступ запрещен";
	    }
	  },
	  mounted(){
	  	parseCalc();
	  },
	  methods: {
	  	handle: function () {
	  		this.onSubmit();
	  		this.dialogFormVisible = false
	  	},
		  onSubmit: function () {
		    axios.post('/users', {
		      user: {
		        email: this.form.email.toLowerCase().trim(),
		        username: this.form.username,
		        password: this.form.password,
		        password_confirmation: this.form.password_confirmation
		      }
		    })
		    .then(response => {
		    	//второй запрос на аутентификацию и создание токена после успешной регистрации в devise
		    	axios.post('/api/v1/auth', {
		      user: {
		        email: this.form.email.toLowerCase().trim(),
		        password: this.form.password
		      }
			    })
			    .then(response => {
			    	this.$store.commit('tokensend', response.data)
			    	location.reload(true);
			    })
			    .catch(error => {
			      console.log(errors)
			    })    
		    })
		    .catch(error => {
		      // whatever you want
		    })
		  }
		}
	}
	//подсчет ширины вьюпорта и отправление в переменную
	function parseCalc () {
 		let screenw = document.body.clientWidth;
 		screenwidth.value = document.body.clientWidth;
 	}
 	window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "_variables";
@import "_extends";
/*.el-form-item{
	height: 2.7em;
},*/
 .el-form-item__label {
 	width: 30px;
 }
.reg  {
  z-index: 4000;
 /* position: absolute;*/
 /* right: 4.6em;*/
}

/*.reg {
	color: $teagreen;
}*/
 
</style>
