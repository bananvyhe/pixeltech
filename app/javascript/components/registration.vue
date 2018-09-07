<template>
	<div class="reg">
		<div class="regplace">
			<el-button size="mini" @click="dialogFormVisible = true">Регистрация</el-button>

			<el-dialog title="Shipping address" :visible.sync="dialogFormVisible">
			  <el-form :model="form">
			    <el-form-item label="Promotion name" :label-width="formLabelWidth">
			      <el-input v-model="form.name" auto-complete="off"></el-input>
			    </el-form-item>
			    <el-form-item label="Zones" :label-width="formLabelWidth">
			      <el-select v-model="form.region" placeholder="Please select a zone">
			        <el-option label="Zone No.1" value="shanghai"></el-option>
			        <el-option label="Zone No.2" value="beijing"></el-option>
			      </el-select>
			    </el-form-item>
			  </el-form>
			  <span slot="footer" class="dialog-footer">
			    <el-button @click="dialogFormVisible = false">Cancel</el-button>
			    <el-button type="primary" @click="dialogFormVisible = false">Confirm</el-button>
			  </span>
			</el-dialog>
			
		</div>
	</div>
</template>

<script>
 
export default {
	data() {
      return {
        gridData: [{
          date: '2016-05-02',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District'
        }, {
          date: '2016-05-04',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District'
        }, {
          date: '2016-05-01',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District'
        }, {
          date: '2016-05-03',
          name: 'John Smith',
          address: 'No.1518,  Jinshajiang Road, Putuo District'
        }],
        dialogTableVisible: false,
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
        formLabelWidth: '120px'
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
