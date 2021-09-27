<template>
	<div class="reg">
		<v-dialog :width="calcul" v-model="dialogFormVisible" >
			<template v-slot:activator="{ on, attrs }">
				<v-btn type="primary"  @click="dialogFormVisible = true" small>Регистрация</v-btn>
			</template>
			<v-card>
        <v-card-title class="headline grey darken-2 px-3">
          Регистрация
        </v-card-title>
 				<v-container>
					<v-form 
					v-model="valid"
					class="mb-0">
					  <v-container>
					      <v-row>
        					<v-col
        					class="py-0"
				          cols="12"
				          md="12">
				          	<v-text-field
				            v-model="form.email"
				            :rules="emailRules"
				            type="text"
				            label="E-mail">
				          	</v-text-field>
				        	</v-col>
				        	<v-col
				        	class="py-0"
				          cols="12"
				          md="12">
				          	<v-text-field
					          type="password"
					          name="input-10-1"
				          	@click:append="show1 = !show1"
				            v-model="form.password"
				             
				            label="Пароль">
				          </v-text-field>
				        	</v-col> 
				        	<v-col
				        	class="py-0"
				          cols="12"
				          md="12">
				          	<v-text-field
					          type="password"
					          name="input-10-1"
				          	@click:append="show1 = !show1"
				            v-model="form.password_confirmation"
				            :rules="passRulesConf"
				            label="Повторите пароль">
				          </v-text-field>
				        </v-col> 	
				        	<v-col
				        	class="py-0"
				          cols="12"
				          md="12">
				          	<v-text-field
					          type="username"
					          name="input-10-1"
				          	@click:append="show1 = !show1"
				            v-model="form.username"
				            :rules="usernameRules"
				            label="Имя пользователя">
				          </v-text-field>
				        </v-col> 							        			         
				      </v-row>					  	
					  </v-container>
					  <v-divider></v-divider>
           <v-card-actions class="px-0 py-0">
           	<v-spacer></v-spacer>
            <v-btn   @click="dialogFormVisible = false">Отмена</v-btn><v-btn class=" " @click="handle" >Отправить</v-btn> </v-card-actions>
					</v-form>			
 				</v-container>
			</v-card>		
			<!-- <h1 style="marginTop: -0.2em;">Создать аккаунт:</h1> -->
<!-- 	  	<el-form :model="form" :rules="rules" ref="form"> 
	    	<el-form-item 
	    	prop="email" 
	    	size="medium" 
	    	label="Емайл:">
	      	<el-input v-model="form.email" auto-complete="off"></el-input>
	    	</el-form-item>
	    
	    	<el-form-item prop="password" size="medium" label="Пароль:">
	      	<el-input type="password" v-model="form.password" auto-complete="off"></el-input>
	    	</el-form-item>
	    	<el-form-item  prop="password_confirmation" size="medium" label="">
	      	<el-input type="password" placeholder="Повторите пароль" v-model="form.password_confirmation" auto-complete="off"></el-input>
	    	</el-form-item>
	    	<el-form-item  prop="username" size="medium" label="Никнейм:">
	      	<el-input v-model="form.username" auto-complete="off"></el-input>
	    	</el-form-item>
 
		    <el-form-item size="medium">
			 		<el-button  @click="dialogFormVisible = false">Отмена</el-button>
				  <el-button   type="primary" @click="handle" >Подтвердить</el-button>
				</el-form-item>
	 		</el-form>
  		<div slot="footer" class="footpostshow basetext font3">
  			 
  		</div>		 -->				 		
		</v-dialog>		 
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
      passRulesConf: [
        v => !!v || 'нужно ввести пароль',
        v => v.length >= 5 || 'Пароль должен содержать более 6 символов',
                    // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
        v => v == this.form.password || "Пароли не совпадают"
      ],	 	    	
      passRules: [
        v => !!v || 'нужно ввести пароль',
        v => v.length >= 5 || 'Пароль должен содержать более 6 символов',
                    // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
      ],	    	
	      emailRules: [
	        v => !!v || 'Обязательно к заполнению',
	        v => /.+@.+/.test(v) || 'E-mail не валиден ',
	         // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
	      ],		    	
	        usernameRules: [
	        v => !!v || 'Обязательно к заполнению'
	      ],		    	
	    	valid: false,
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
      	if(response.data != null) {
      		console.log(response.data);
      		this.responseName =  response.data.username
      	}
    			


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
	  	calcul: function(){
	  		return screenwidth.value > 400 ? '26'+'em' : '90' +'%'
	  	},	  	
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
			    	  this.$store.commit('tokensend', response.data)
	    		  this.token = this.$store.getters.token 
			  		let jwtData = this.token.access.split('.')[1]
						let decodedJwtJsonData = window.atob(jwtData)
						let decodedJwtData = JSON.parse(decodedJwtJsonData)
						let role = decodedJwtData
						location.reload(true);
						this.$store.commit('rolensend', role)
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
/*@import "stylesheets/_variables.scss";*/
/*@import "stylesheets/_extends";*/
/*.el-form-item{
	height: 2.7em;
},*/
 .el-form-item__label {
 	width: 30px;
 }
.reg  {
  z-index: 5000;
 /* position: absolute;*/
 /* right: 4.6em;*/
}

/*.reg {
	color: $teagreen;
}*/
 
</style>
