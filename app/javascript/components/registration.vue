<template>
	<div class="reg">
		<div class="regplace">
			<el-button size="mini" @click="dialogFormVisible = true">Регистрация</el-button>

			<el-dialog title="Создать аккаунт:" :visible.sync="dialogFormVisible">
			  <el-form :model="form">
			    <el-form-item size="mini" label="Емайл:" :label-width="formLabelWidth">
			      <el-input v-model="form.mail" auto-complete="off"></el-input>
			    </el-form-item>
			    <el-form-item size="mini" label="Имя пользователя:" :label-width="formLabelWidth">
			      <el-input v-model="form.usernamne" auto-complete="off"></el-input>
			    </el-form-item>
			    <el-form-item size="mini" label="Пароль:" :label-width="formLabelWidth">
			      <el-input v-model="form.password" auto-complete="off"></el-input>
			    </el-form-item>
			    <el-form-item size="mini" label="Пароль еще раз:" :label-width="formLabelWidth">
			      <el-input v-model="form.password" auto-complete="off"></el-input>
			    </el-form-item>
			   <!--  <el-form-item label="Zones" :label-width="formLabelWidth">
			      <el-select v-model="form.region" placeholder="Please select a zone">
			        <el-option label="Zone No.1" value="shanghai"></el-option>
			        <el-option label="Zone No.2" value="beijing"></el-option>
			      </el-select>
			    </el-form-item> -->
			  </el-form>
			  <span slot="footer" class="dialog-footer">
			    <el-button size="mini" @click="dialogFormVisible = false">Отмена</el-button>
			    <el-button size="mini" type="primary" @click="dialogFormVisible = false">Подтвердить</el-button>
			  </span>
			</el-dialog>

		</div>
	</div>
</template>

<script>
 
export default {
	data() {
      return {
         
        
        dialogFormVisible: false,
        form: {
          name: '',
          region: '',
          date1: '',
          date2: '',
          delivery: false,
          type: [],
          resource: '',
          desc: ''
        },
        formLabelWidth: '150px'
      };
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
