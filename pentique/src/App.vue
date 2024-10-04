<script setup>
import { RouterLink, RouterView } from 'vue-router'
import { onMounted, ref } from 'vue';
import axios from 'axios';

onMounted(() => {
    //get all top level product categories
    getCategories()
  })

const categories = ref(null)
async function getCategories() {
  try {
    const response = await axios.get("http://localhost:5000/category1");
    categories.value = response.data;
  } catch (err) {
    console.log(err);
  }
}
</script>

<template>
  <header>
    <div class="fixed top-0 left-0 right-0 bg-white h-28">
      <div class="rounded-lg bg-blue-200 flex justify-center items-center flex-wrap fixed top-5 left-6 right-6 z-50 p-3">
        <img alt="Pentique logo" src="/images/logo.png" width="100" />
        <nav class="p-2">
          <RouterLink class="p-4" to="/">Home</RouterLink>
          <RouterLink class="p-4" to="/about">About</RouterLink>
          <RouterLink class="p-4" to="/contact">Contact</RouterLink>
          <RouterLink class="p-4" to="/shipping">Shipping</RouterLink>
        </nav>
      </div>
    </div>
    
  </header>

  <div class="mt-32">
    <div class="w-[20%] float-left">
      <ul class="ml-6 bg-blue-200 rounded-lg text-sm">
        <li v-for="category in categories" :key="category.category1ID" class="p-3 border-b">
          <p>{{ category.category1Name }}</p>
        </li>
      </ul>
    </div>
    <div class="max-w-[75%] w-[75%] float-right bg-blue-100 ml-3 mr-6 rounded-lg">
      <RouterView />
    </div>
    
  </div>
  
</template>

<style scoped>

</style>
