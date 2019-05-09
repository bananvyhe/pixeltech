<template>
  <div class="hat fog">
  	<div class="warriors"></div>
 
     
  </div>
</template>
<script>
 
  export default {
    
    data: function (){
      return {
        
      }
    },
    methods: {
      

    }
  }
</script>
<style scoped>
@import "_variables";
@import "_extends";
.hat {
	lost-center: $lcenter;
	lost-utility: edit;
	height: 220px;
}
.fog {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	background-image: url('./images/_hat/fog.jpg');
}
.warriors {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center -10%;
	height: 100%;
	width: 100%;
	background-image: url('./images/_hat/warriors.gif');
}
</style>