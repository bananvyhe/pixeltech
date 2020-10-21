<template>
	<div class="log"> 
		<!-- {{this.$store.getters.token.access}}<br>{{this.$store.getters.token.refresh}} -->
		<div v-if="$store.getters.token != null" ><!-- <div style="position: fixed; left: 0; top: 3em;"> {{$store.getters.token}}</div> -->
      <v-btn type="primary" @click="handler">
      	Выйти
      </v-btn>
    </div>
    <div v-else>
			<v-dialog :width="calcul" v-model="dialogFormVisible" >
				<template v-slot:activator="{ on, attrs }">
        	<v-btn
          v-bind="attrs"
          v-on="on"
        	>
          Войти
        	</v-btn>
      	</template>
        <v-card>
	        <v-card-title class="headline grey darken-2">
	          Вход
	        </v-card-title>
					<v-card-actions>
						<v-form 
							v-model="valid"
							class="mb-0">
					    <v-container>
					      <v-row>
        					<v-col
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
				          cols="12"
				          md="12">
				          	<v-text-field
					          type="password"
					          name="input-10-1"
				          	@click:append="show1 = !show1"
				            v-model="form.password"
				            :rules="passRules"
				            label="Пароль">
				          </v-text-field>
				        </v-col>        
				      </v-row>
				      <v-switch
			      		v-model="switch1"
			      		:label="`${switch1 == false ? 'короткая сессия':'запомнить'}`">
			      	</v-switch>
				    </v-container>
				  </v-form>
				</v-card-actions>
        <v-divider></v-divider>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="handle">
            Подтвердить
          </v-btn>
        </v-card-actions>
      </v-card>
<!-- 	  	<el-form :model="form" :rules="rules" ref="form">	 
		  	<el-form-item 
		    	prop="email" 
		    	size="medium"
		    	label="Емайл:"
		    	:rules="[
			      { required: true, message: 'Введите адрес', trigger: 'blur' },
			      { type: 'email', message: 'Неправильный адрес почты', trigger: ['blur', 'change'] }
			    ]">
		    	<el-input v-model="form.email" ></el-input>
		  	</el-form-item>

		    <el-form-item prop="password" size="medium" label="Пароль:"  style="margin-bottom: 0px !important;">
		      <el-input type="password" v-model="form.password" auto-complete="off">
		      </el-input>
		      <div class="forgetPassword"><a href="/users/password/new">забыли пароль?</a></div>
		    </el-form-item>
		    	
				<el-form-item size="medium" class="bottomField">
			 		<el-button  @click="dialogFormVisible = false"  >Отмена</el-button>
			 		<el-button   type="primary" @click="handle" >Подтвердить</el-button>
			 	</el-form-item>
				<el-form-item size="medium"   class="lab">
				  <el-switch  inactive-text="Короткая сессия" active-text="Запомнить" width="23"  size="mini" v-model="checked" ></el-switch>
				</el-form-item>
				 
		 	</el-form>
		 	<div slot="footer" >
      </div> -->
		</v-dialog></div>
	</div>
</template>

<script>
	import axios from 'axios'
	// var state = {
	// 	token: localStorage.getItem("token")
	// }

	// let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	// axios.defaults.headers.common['X-CSRF-Token'] = token
	// axios.defaults.headers.common['Accept'] = 'application/json'
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
	    return {
	    switch1: false,	
	    show1: false,
      valid: false,
      firstname: '',
      lastname: '',
      passRules: [
        v => !!v || 'нужно ввести пароль',
        v => v.length >= 5 || 'Пароль должен содержать более 6 символов',
                    // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
      ],
      email: '',
      emailRules: [
        v => !!v || 'Обязательно к заполнению',
        v => /.+@.+/.test(v) || 'E-mail не валиден ',
         // v => (v || '').indexOf(' ') < 0 ||  'Пробелов не должно быть'
      ],	    	
	    	checked: false,
	    	// token: state,
	    	error: '',
	      dialogFormVisible: false,
	      form: {
	        email: '',
	        password: '' 
	      },
	      formLabelWidth: '80px',
        rules: {
          email: [
           
          ],
          password: [
            {min: 6, max: 128, message: 'длина пароля от 6 знаков', trigger: 'blur'  }
          ],
        },
	    	screenwidth: screenwidth,
	    };
	  },
	  computed: {
	  	calcul: function(){
	  		return screenwidth.value > 400 ? '26'+'em' : '90' +'%'
	  	},
	  	magicWidth: function(){
        // console.log("computed");
        if(this.age > 17)
          return "доступ разрешен";
        else
          return "доступ запрещен";
	    }
	  },
	  mounted(){
	  	parseCalc()
	  	try{
	  		if (checklog == 'unlogged'){
					// this.nulltoken()
				}
				if (!this.$store.getters.token.refresh  ) {
		  		 
		  		//разлогинить при условии отсутсвя флажка и истечении ацесса
		  		var current_time = new Date().getTime() / 1000;
					if (current_time > this.$store.getters.role.exp) {
						this.nulltoken()	
						// window.location.href = '/';
					}
				}

			//code that causes an error
				}catch(e){
			}	  	
	  },
	  created(){
			// this.$store.commit('rolesend', this.role)
	  },
	  watch: {
		},
	  methods: {
	  	moneymin: function(){
	  		// axios.post('/clients', {
		   //    client: {
		   //      ballance: 1000
		   //    }
		   //  })
		    axios({
    			method: 'post',
    			url: '/clients',
    			data: {
						ballance: -10
					},
		    	headers: {
		    		'Authorization': 'bearer '+this.$store.getters.token.access
		    	} 
		    }).then((response) => {	
        	let api = response.data[0];
      //     let apiInfo = {
      //       name : api.name,
      //       desc : api.description,
      //       img : api.image_url,
      //       tips : api.brewers_tips,
      //       tagline : api.tagline,
      //       food : api.food_pairing
      //     };
      //     this.beers.push(apiInfo)
      //     if (this.bottomVisible()) {
      //       this.addBeer()
      //     }
        })
		  },
	  	moneypush: function(){
	  		// axios.post('/clients', {
		   //    client: {
		   //      ballance: 1000
		   //    }
		   //  })
		    axios({
    			method: 'post',
    			url: '/clients',
    			data: {
						ballance: 100,
						mescount: ''
					},
		    	headers: {
		    		'Authorization': 'bearer '+this.$store.getters.token.access
		    	} 
		    }).then((response) => {	
        	location.reload(true);
        })
		  },
		  handler: function () {

		  	// alert(addr)
		  	this.nulltoken();  
 
 						
 						 
		  	
		  	 // window.location.reload()
		  	
		  	// var elem = document.querySelector('.railsblockhide')

		  	// elem.style.display = "none"

		  	// var elem = document.querySelector('.railsblock')
		  	// elem.style.display = "none"
 
		  	// if (document.location.pathname == '/'){
		  	// 	setTimeout(function tick() {


		  		// }
					// }, 200);
		  	// }
		  },
			nulltoken: function (){

				axios.delete('/users/sign_out', {
		    }) 
		    .then((response) => {	 
		    this.$store.commit('tokensend', null) 
 				this.$store.commit('rolensend', null) 

		  	this.$store.commit('gamesend', null) 
	 			this.$store.commit('crysend', null) 
 
 				//  this.$store.commit('tokensend', null) 
		        //   this.$store.commit('tokensend', null) 
		    })
	      .then(() => {
	      	// var adress = window.location.hostname
	      	window.location.replace('/');
	      	// location=window.location.host
	      	// 
		      // location.reload(true);
		    })    
		    // setTimeout(function(){
		    //   // self.cropText();
		    // },100 );
	    },
	  // 	login: function () {
			// 	const { username, password } = this
			// 	this.$store.dispatch(AUTH_REQUEST, { username, password }).then(() => {
			// 		this.$router.push('/')
			// 	})
			// },
	  	handle: function () {
	  		this.onSubmit();
	  		this.dialogFormVisible = false
	  		// var contain = $('.contain');
	  		// contain.addClass('hidden');
	  		// var bg = $('#bg');
	  		// bg.addClass('hidden');
 
	  	},
		  onSubmit: function () {
				axios.post('/api/v1/auth', {
		      user: {
		        email: this.form.email.toLowerCase().trim(),
		        password: this.form.password,
		        checked: this.checked
						// password_confirmation: this.form.password_confirmation
		      }
		    })
		    .then(response => {
		    	if (response.data.errors) {
		    		console.log(response.data.errors)
		    		this.error = response.data.errors;

			  		var self = this
			  		this.$message.error({
			  		 	showClose: true,
			  		 	message: self.error,
			  		 	onClose: function(){
			  		 		self.error = ''	
				  	}
		  		});

	    		}else{
	    		  this.$store.commit('tokensend', response.data)
	    		  this.token = this.$store.getters.token 
			  		let jwtData = this.token.access.split('.')[1]
						let decodedJwtJsonData = window.atob(jwtData)
						let decodedJwtData = JSON.parse(decodedJwtJsonData)
						let role = decodedJwtData
						location.reload(true);
						this.$store.commit('rolensend', role)
		    	}
		    })
		    .catch(error => {
		    	console.log(error)
		      // whatever you want
		    });
	    	
		  }
		}
	}
	//подсчет ширины вьюпорта и отправление в переменную
	function parseCalc() {
 		let screenw = document.body.clientWidth;
 		screenwidth.value = document.body.clientWidth;
 	}
  window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "../stylesheets/_variables";
@import "../stylesheets/_extends";

.bottomField {
	padding-top: 2em;
}
.forgetPassword{
	padding: 0.0em 0em;
/*	display: flex; 
	justify-content: flex-end;*/

	position: absolute;
	right: 0;
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
.log  {
  z-index: 5000;

  display: flex;
 /*	right: 0;*/
} 

</style>
