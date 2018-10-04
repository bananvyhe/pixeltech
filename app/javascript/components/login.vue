<template>
	<div class="reg">
		<div class="regplace">
			<div class="warn">
				<el-button type="primary" plain size="small"  @click="dialogFormVisible = true">Войти</el-button>
				<el-dialog top="18vh" v-bind:width="screenwidth.value > '600' ? '30'+'em' : '90' +'%'" title="Войти:" :visible.sync="dialogFormVisible" >
				  <el-form :model="form" :rules="rules" ref="form">
				  	 
				    <el-form-item 
				    	prop="email" 
				    	size="mini" 
				    	label="Емайл:" 
				    	:label-width="formLabelWidth"
				    	:rules="[
					      { required: true, message: 'Введите адрес', trigger: 'blur' },
					      { type: 'email', message: 'Неправильный адрес почты', trigger: ['blur', 'change'] }
					    ]">
				      <el-input v-model="form.email" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item prop="password" size="mini" label="Пароль:" :label-width="formLabelWidth">
				      <el-input type="password" v-model="form.password" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item size="mini">
					 		<el-button  @click="dialogFormVisible = false">Отмена</el-button>
						  <el-button   type="primary" @click="handle" >Подтвердить</el-button>
						</el-form-item>
				 	</el-form>
				</el-dialog>
			</div>
		</div>
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
	    	formLabelWidth: '120px',
	      dialogFormVisible: false,
	      form: {
	        email: 'admin@pixeltech,ru',
	        password: '78803054'
	      },
	      formLabelWidth: '150px',
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
	  methods: {
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
		    	this.$store.commit('tokensend', response.data)
		    	//  localStorage.setItem("token", response.data);
		    	// this.token = response.data;
		    	// console.log('scacs');
		       // location.reload(true);
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
  window.onload = function () {
    parseCalc();
  }
  window.addEventListener('resize', _.throttle(parseCalc, 100));
</script>
<style scoped>
@import "_variables";
@import "_extends";

 

</style>
