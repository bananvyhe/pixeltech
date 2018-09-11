<template>
	<div class="reg">
		<div class="regplace">
			<div class="warn">
				<el-button size="mini" @click="dialogFormVisible = true">Регистрация</el-button>

				<el-dialog v-bind:width="screenwidth.value > 400 ? '100' : '30' +'%'" title="Создать аккаунт:" :visible.sync="dialogFormVisible" >
				  <el-form :model="form">
				    <el-form-item size="mini" label="Емайл:" :label-width="formLabelWidth">
				      <el-input v-model="form.email" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item size="mini" label="Имя пользователя:" :label-width="formLabelWidth">
				      <el-input v-model="form.username" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item size="mini" label="Пароль:" :label-width="formLabelWidth">
				      <el-input v-model="form.password" auto-complete="off"></el-input>
				    </el-form-item>
				    <el-form-item size="mini" label="Пароль:" :label-width="formLabelWidth">
				      <el-input v-model="form.password_confirmation" auto-complete="off"></el-input>
				    </el-form-item>{{screenwidth.value}}
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
				 		 

				<!--   	<span slot="footer" class="dialog-footer">
		
				  	</span> -->

				</el-dialog>
			</div>
			
				

		</div>
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
	    return {
	    	screenwidth: screenwidth,
	       
	      
	      dialogFormVisible: false,
	      form: {
	        email: '',
	        username: '',
	        password: '',
	        password_confirmation:''
	      },
	      formLabelWidth: '150px'
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
	  methods: {
	  	handle: function () {
	  		this.onSubmit();
	  		this.dialogFormVisible = false
	  	},
		  onSubmit: function () {
		    axios.post('/users', {
		      user: {
		        email: this.form.email,
		        username: this.form.username,
		        password: this.form.password,
		        password_confirmation: this.form.password_confirmation,
		        // password_confirmation: this.form.password_confirmation
		      }
		    })
		    .then(response => {
		       location.reload(true);
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
.warn {
	padding: 4px;

	background: repeating-linear-gradient(
  45deg,
  rgba(0, 0, 0, 0.2),
  rgba(0, 0, 0, 0.2) 10px,
  rgba(0, 0, 0, 0.3) 10px,
  rgba(0, 0, 0, 0.3) 20px
	),

	url(http://s3-us-west-2.amazonaws.com/s.cdpn.io/3/old_map_@2X.png);
}
.reg {
	padding-bottom: 0.55em;
	color: $teagreen;
}
.regplace {
	
	display: flex;
	justify-content: center;
} 

</style>
