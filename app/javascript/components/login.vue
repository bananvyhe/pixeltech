<template>
	<div class="log"> 
		<!-- {{this.$store.getters.token.access}}<br>{{this.$store.getters.token.refresh}} -->
		<div v-if="$store.getters.token != null" ><!-- <div style="position: fixed; left: 0; top: 3em;"> {{$store.getters.token}}</div> -->
      <el-button type="primary" plain size="mini" @click="handler">
      	Выйти
      </el-button>
     <!--  <el-button type="primary" plain size="mini"   @click="moneypush">
      	плюсануть
      </el-button>
      <el-button type="primary" plain size="mini"   @click="moneymin">
      	минуснуть
      </el-button> -->
    </div>
    <div v-else>
      <el-button type="primary" plain size="small"  @click="dialogFormVisible = true">
        Войти
      </el-button>
    </div>
  		<el-dialog class="pos" top="18vh" :width="calcul" :visible.sync="dialogFormVisible" :lock-scroll="false">
  			<h1 style="marginTop: -0.2em;">Войти:</h1>
		  <el-form :model="form" :rules="rules" ref="form">	 
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
		    <el-form-item prop="password" size="mini" label="Пароль:"  style="margin-bottom: 0px !important;">
		      <el-input type="password" v-model="form.password" auto-complete="off">
		      </el-input><div class="forgetPassword"><a href="/users/password/new">забыли пароль?</a></div>
		    </el-form-item>
		    	
				<el-form-item size="mini"  style="margin-bottom: 10px;" class="bottomField">
			 		<el-button  @click="dialogFormVisible = false"  >Отмена</el-button><el-button   type="primary" @click="handle" >Подтвердить</el-button>
			 	</el-form-item>
				<el-form-item size="mini"   class="lab">
				  <el-switch  inactive-text="короткая сессия" active-text="запомнить" width="25"  size="mini" v-model="checked" ></el-switch>
				</el-form-item>
				 
		 	</el-form>
		</el-dialog>
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
	  		return screenwidth.value > 400 ? '35'+'em' : '90' +'%'
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
					this.nulltoken()
				}
				if (!this.$store.getters.token.refresh  ) {
		  		 
		  		//разлогинить при условии отсутсвя флажка и истечении ацесса
		  		var current_time = new Date().getTime() / 1000;
					if (current_time > this.$store.getters.role.exp) {
						this.nulltoken()	
						// window.location.href = '/';
					}
				}
				if (this.$store.getters.token.access) {
	  			axios.get('/gameboards', {
		        method: 'get',
		        url: '/gameboards',
			        headers: {
			          'Authorization': 'bearer '+this.$store.getters.token.access
			        } 
		        })
		        .then((response) => {
console.log(response.data)
		          this.$store.commit('gamesend', response.data.expirience )
		          this.$store.commit('crysend', response.data.cry )
		        })
		        .catch(function (error) {
		          console.log(error);
	      		}).then(); 						
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
		  	this.nulltoken();
		  	var elem = document.querySelector('.railsblockhide')
		  	elem.style.display = "none"
		  	// var elem = document.querySelector('.railsblock')
		  	// elem.style.display = "none"
		  	if (document.location.pathname == '/'){
		  	// 	setTimeout(function tick() {
 				// 		window.location.reload();
					// }, 200);
		  	}
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
	  		var contain = $('.contain');
	  		contain.addClass('hidden');
	  		var bg = $('#bg');
	  		bg.addClass('hidden');
	  		// this.dialogFormVisible = false
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
@import "stylesheets/_variables";
@import "stylesheets/_extends";
.bottomField {
	padding-top: 3em;
}
.forgetPassword{
	padding: 0.2em 0em;
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
  z-index: 4000;
 /* position: absolute;*/
  display: flex;
 /*	right: 0;*/
} 

</style>
