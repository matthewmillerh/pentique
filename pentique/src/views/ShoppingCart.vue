<script setup>
import { onMounted, ref } from 'vue';

const shoppingCart = ref({})

onMounted(() => {
    shoppingCart.value = JSON.parse(localStorage.getItem('cart'))
})
</script>
<template>
    <div v-for="product in shoppingCart">{{ product.productID }}</div>
</template>
<style></style>