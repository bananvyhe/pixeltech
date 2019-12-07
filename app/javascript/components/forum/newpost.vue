<template>
  <div class=" ">
    <el-button type="text" @click="dialogFormVisible = true">Новый пост</el-button>
    <el-dialog title="Создать новый пост" :visible.sync="dialogFormVisible" :width="calcul" :lock-scroll="false">
      <el-form :label-position="labelPosition" ref="form" :model="form"  size="mini"  label-width="120px">
        <el-form-item size="medium" label="Заголовок поста:" prop="title">
          <el-input v-model="form.title" autocomplete="off" ></el-input>
        </el-form-item>
   
        <el-form-item label="Пост:" prop="text" size="medium">
          <el-input type="textarea" v-model="form.text" rows="10"></el-input>
        </el-form-item>
          <el-form-item size="medium">
            <el-button type="primary" @click="submitForm('form')">Создать</el-button>
            <el-button @click="resetForm('form')">Сбросить</el-button>
          </el-form-item>
      </el-form>
      <div slot="footer" class="footpostshow basetext font3">
        &nbsp;
      </div>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios'
let screenwidth = {value: ''} 
export default {
  props:['section'],
  data: function () {
    return {
      labelPosition: 'top',
      dialogFormVisible: false,
      screenwidth: screenwidth,
      form: {        
        title: '',
        text: '',
      }
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
          axios({
            method: 'post',
            //vks#associate
            url: '/api/v1/vuepost',
            data: {
              title: this.form.title,
              body: this.form.text,
              clan_name: this.section
            },
            headers: {
              'Authorization': 'bearer '+this.$store.getters.token.access
            } 
          }).then((response) => { 

            this.dialogFormVisible = false
            var rand = Math.random()
            this.$emit('newpost', rand);
            // this.link = 'visited'
            // this.$store.commit('gamesendplus', 100)
            // this.gamesendplus({
            //   amount: loa
            // })
          })

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