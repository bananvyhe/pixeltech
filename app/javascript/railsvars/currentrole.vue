 
<template>
	<div>
    <p>{{role}}
    {{ $store.state.number }}</p>
	</div>
</template>

<script>
 
export default {
	props: ["role"],
}
</script>
<style scoped>
@import "_variables";
@import "_extends";
p {
  position: absolute;
}
 

</style>
