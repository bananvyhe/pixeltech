 
<template>
	<div>
    <p>{{message}}</p>
	</div>
</template>

<script>
 
export default {
	props: ["message"],
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
p {
  position: absolute;
}
 

</style>
