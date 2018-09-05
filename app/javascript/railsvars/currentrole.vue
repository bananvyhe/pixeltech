 
<template>
	<div>
    <p>{{$store.getters.role}}</p>
	</div>
</template>

<script>
 
export default {
	props: ["role"],
	created() {
		this.$store.commit('rolesend', this.role)
	}
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
p {
  position: absolute;
}
 

</style>
