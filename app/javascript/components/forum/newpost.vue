<template>
  <div class=" ">
    <el-button type="text" @click="dialogFormVisible = true">Новый пост</el-button>
    <el-dialog title="Создать новый пост" :visible.sync="dialogFormVisible" :width="calcul">
      <el-form :label-position="labelPosition" ref="form" :model="form"  size="mini"  label-width="120px">
        <el-form-item label="Заголовок поста:" prop="title">
          <el-input v-model="form.title" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="Пост:" prop="text">
          <el-input type="textarea" v-model="form.text" rows="10"></el-input>
        </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('form')">Создать</el-button>
            <el-button @click="resetForm('form')">Сбросить</el-button>
          </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''} 
export default {

  data: function () {
    return {
      labelPosition: 'top',
      dialogFormVisible: false,
      screenwidth: screenwidth,
      form: {        
        title: '',
        text: '',
      },
			userposts: []
    };
  },
  computed: {
    calcul: function(){
      return screenwidth.value > 900 ? '48'+'em' : '90' +'%'
    },
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('сохранено!');
        } else {
          console.log('ошибка!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    getPosts() {
      
    }

  },
  mounted() {
 
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
 .el-form-item {
  display: block; 
 }
 .el-form-item__label {
  width: 150px;
 }
</style>