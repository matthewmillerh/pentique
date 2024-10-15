<script setup>
import { onMounted, ref, watch } from 'vue'
import axios from 'axios';
import { useRoute } from 'vue-router';

const subCategories = ref([])
const products = ref(null)
const route = useRoute()
const currentCategory = ref (null)

onMounted (() => {
  getSubCategories()

  getProductsByCategory()
})

//fetch all level 2 and 3 categories for the current level 1 category
async function getSubCategories() {
  try {
    const response = await axios.get("http://localhost:5000/sub-categories/" + route.params.id);
    subCategories.value = response.data
  } catch (err) {
    console.log(err);
  }
}

//get all products for the current level 1 category
async function getProductsByCategory() {
  try {
    const response = await axios.get("http://localhost:5000/products-by-category/" + route.params.id)
    products.value = response.data
    console.log(products.value)
  } catch (err) {
    console.log(err)
  }
}

//update the DOM when route params change
watch(() => route.params.id, () => {
    getProductsByCategory()
  }
)

//update the DOM when category param in route changes
watch (() => route.params.category2, () => {
  currentCategory.value = route.params.category2
  console.log(route.params.category2)
})

</script>
<template>
  <div>
    <h1 class="text-lg font-semibold p-3">{{ $route.params.category1 }}</h1>
    <div v-for="product in products">
      <p class="p-3" v-if="product.category2Name === currentCategory || currentCategory == ''">{{ product.productName }}</p>
      
    </div>
  </div>
  
</template>

<style>
</style>
