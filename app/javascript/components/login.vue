<template>
	<div class="log">
		<div v-if="$store.getters.token != null" ><!-- <div style="position: fixed; left: 0; top: 3em;"> {{$store.getters.token}}</div> -->
      <el-button type="primary" plain size="mini"   @click="nulltoken">
      	Выйти
      </el-button>
    </div>
    <div v-else>
      <el-button type="primary" plain size="small"  @click="dialogFormVisible = true">
        Войти
      </el-button>
    </div>
    
		<el-dialog class="pos" top="18vh" v-bind:width="screenwidth.value > '600' ? '30'+'em' : '90' +'%'" title="Войти:" :visible.sync="dialogFormVisible" >
			
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
		    <el-form-item prop="password" size="mini" label="Пароль:">
		      <el-input type="password" v-model="form.password" auto-complete="off"></el-input>
		    </el-form-item><div>
				{{error}}
			</div>
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
	    	// token: state,
	    	error: '',
	    	 
	      dialogFormVisible: false,
	      form: {
	        email: 'admin@pixeltech,ru',
	        password: '78803054'
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
	  	magicWidth: function(){
        console.log("computed");
        if(this.age > 17)
          return "доступ разрешен";
        else
          return "доступ запрещен";
	    }
	  },
	  mounted(){
	  	 
	  },
	  created(){
			// this.$store.commit('rolesend', this.role)
	  },
	  watch: {
	  	error: function(val){
	  		 this.$message.error(val);
	  	}
	  },
	  methods: {
			nulltoken: function (){
      	axios.delete('/users/sign_out', {
		    }) 
		    .then((response) => {
		      this.$store.commit('tokensend', null) 
		    })
	      .then((response) => {
	      	window.location.href = '/';
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
	  		// this.dialogFormVisible = false
	  	},
		  onSubmit: function () {
		    axios.post('/api/v1/auth', {
		      user: {
		        email: this.form.email,
		        password: this.form.password
		        // password_confirmation: this.form.password_confirmation
		      }
		    })
		    .then(response => {
		    	if (response.data.errors) {
		    		console.log(response.data.errors)
		    		this.error = response.data.errors;
		    	}else{
		    		this.$store.commit('tokensend', response.data)
		    	location.reload(true);
		    	}
		    	
		    	// this.$store.commit('tokensend', response.data)
		    	// location.reload(true);

		    	//  localStorage.setItem("token", response.data);
		    	// this.token = response.data;
		    	// console.log('scacs');
		       // location.reload(true);
		    })
		    .catch(error => {
		     
		    	console.log(error)
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
  window.onload = function () {
    parseCalc();
  }
  window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "_variables";
@import "_extends";
.log  {
  z-index: 4000;
  position: absolute;
  display: flex;
 	right: 0;
} 

</style>
