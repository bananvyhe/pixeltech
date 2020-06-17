<template>
  <div>
  <div class="userinfoplace">
    <el-popover
      v-if="userplus"
      placement="top"
      width=""
      trigger="hover">
      <div class="tinytext">
        {{userplus}}
      </div>
      <div slot="reference">
          за: {{plusvotes}}
      </div>
    </el-popover> 
    <div v-else>
      за: 0
    </div>
    <el-popover
      v-if="userminus"
      placement="top"
      width=""
      trigger="hover">
      <div class="tinytext">
        {{userminus}}                  
      </div>
      <div slot="reference">
          против: {{minusvotes}}
      </div>
    </el-popover>                 
    <div v-else>
      против: 0
    </div>    

    <div v-if="userkarma != 0">
      карма: -{{userkarma}}
    </div>           
  </div>
  <div class="userinterface ">
    <div>
      <el-button label="2" border size="mini"  class="aprior">Сообщение</el-button>
    </div>
    <div>
      <el-tooltip placement="top">
        <div slot="content" class="smalltext notif"><i>плюс в карму<br>+7 открывают<br> возможности лидера</i> 
        </div>
        <el-button @click="voteplus(item.id)" type="warning"  label="4" border size="mini"  class="aprior"> + </el-button>
      </el-tooltip>
    </div>
    <div>
      <el-tooltip placement="top">
        <div slot="content"  class="smalltext notif" >минус в карму
        </div>
        <el-button  @click="vote(item.id)" type="warning"  label="3" border size="mini"  class="aprior"> - </el-button>
      </el-tooltip>
    </div>
    <div>

      <el-tooltip  v-if="$store.getters.cry >= 100" placement="top">
        <div slot="content"  class="smalltext notif plashka2"> <span style="color: green;">стоимость 100 камней</span> <br>   нейтрализует оппонента <br> <span style="color: red;"><i>ваша карма будет испорчена</i></span>   </div>
        <el-button type="danger" label="1" bordser size="mini" class="aprior pk" @click='pkconfirm(item.id)'> 
          ПК 
        </el-button>
      </el-tooltip>
      <el-tooltip v-else  placement="top">
        <div slot="content"  class="smalltext notif"> 
          <span style="color: green;">стоимость 100 камней</span> <br> <i> нейтрализует оппонента <br> <span style="color: red;">ваша карма будет испорчена</span> </i> 
        </div>
        <el-button disabled type="danger" label="1" border size="mini" class="aprior"> 
          ПК 
        </el-button>
      </el-tooltip>
    </div>    
  </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  // props: ['id'],
  data: function () {
    return {
      visible: false,
      userkarma: '',
      plusvotes: '',
      userplus: [],
      minusvotes: '',
      userminus: [],
    };
  },
  watch: {
    
  }, 
  computed: {

  },
  mounted() {
     
  },
  methods: {
    getInfoUser(id){
      axios({
        method: 'get',
        url: '/api/v1/userinfo',
        headers: {
          'Authorization': 'bearer '+this.$store.getters.token.access
        }, 
        params: {
          user_id: id
        }
      })
      .then((response) => {        
        var totalplus = response.headers.userplus
        var arrsizeminus = response.headers.arraysizemin
        var totalminus = response.headers.usermin
        var arrsizeplus = response.headers.arraysizeplus
        var userkarma = response.headers.userkarma
        this.userminus = totalminus
        this.minusvotes = arrsizeminus
        this.userplus = totalplus
        this.plusvotes = arrsizeplus
        this.userkarma = userkarma
      });
    },      
 
  }
}
</script>
<style scoped>
.userinfoplace {
  display: flex;
  flex-direction: row;
  /*background-color: #dad;*/
  padding: 0em;
  margin-bottom: 1em;
  div {
    margin: 0em 0.5em;
    /*background-color: #dad;*/
  }
}
.userinterface {
  padding: 0 0.2em;
  margin: -0.9em;
  display: flex;
  flex-direction: row;
  div {
   padding: 0.2em 0.0em ;
  }
}
.notif {
  font-weight: 300;
  text-align: center;
  line-height: 1.4em;
}


</style>