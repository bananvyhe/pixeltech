<template>
	<div class="reg">
		<div class="regplace">
			<el-button size="mini" @click="dialogFormVisible = true">Регистрация</el-button>

			<el-dialog title="Создать аккаунт:" :visible.sync="dialogFormVisible">
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
			    </el-form-item>{{form}}
<!-- 			    <el-form-item size="mini" label="Пароль еще раз:" :label-width="formLabelWidth">
			      <el-input v-model="form.password" auto-complete="off"></el-input>
			    </el-form-item> -->
			   <!--  <el-form-item label="Zones" :label-width="formLabelWidth">
			      <el-select v-model="form.region" placeholder="Please select a zone">
			        <el-option label="Zone No.1" value="shanghai"></el-option>
			        <el-option label="Zone No.2" value="beijing"></el-option>
			      </el-select>
			    </el-form-item> -->
			 		</el-form>
			 		<el-button size="mini" @click="dialogFormVisible = false">Отмена</el-button>
				  <el-button size="mini" type="primary" @click="onSubmit" >Подтвердить</el-button>
			  	<span slot="footer" class="dialog-footer">
	
			  	</span>

			</el-dialog>
				

		</div>
	</div>
</template>

<script>
 import axios from 'axios'
  let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
	axios.defaults.headers.common['X-CSRF-Token'] = token
	axios.defaults.headers.common['Accept'] = 'application/json'
 

export default {
	data() {
    return {
       
      
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
  methods: {
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
	      // whatever you want
	    })
	    .catch(error => {
	      // whatever you want
	    })
	  }
	}
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
.reg {
	padding-bottom: 1em;
	color: $teagreen;
}
.regplace {
	display: flex;
	justify-content: center;
} 

</style>
