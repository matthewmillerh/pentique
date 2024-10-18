<script setup>
import { onMounted, onUpdated, ref, watch } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import ProductCard from '@/components/ProductCard.vue'

const subCategories = ref([])
const products = ref(null)
const route = useRoute()
const currentCategory = ref (null)

onMounted (() => {
  setTimeout(() => getProductsByCategory(), 500)
  setTimeout(() => currentCategory.value = route.params.category, 500)
})

//get all products for the current level 1 category
async function getProductsByCategory() {
  try {
    const response = await axios.get("http://localhost:5000/products-by-category/" + route.params.category1ID)
    products.value = response.data
  } catch (err) {
    console.log(err)
  }
}

//Change which level 1 category products are shown when the route params change categoryID
watch(() => route.params.category1ID, () => {
    setTimeout(() => getProductsByCategory(), 500)
  }
)

//Change which category products are shown when the route params change
watch (() => route.params.category, () => {
  setTimeout(() => currentCategory.value = route.params.category, 500)
})

</script>
<template>
  <div>
    <h1 class="text-lg font-semibold p-3 text-center">{{ currentCategory }}</h1>
    <div class="flex flex-wrap gap-5 justify-center p-4">
      <div v-for="product in products">
        <ProductCard v-if="
          product.category1Name === currentCategory || 
          product.category2Name === currentCategory ||
          product.category3Name === currentCategory
        " 
        :category1-name="product.category1Name" :category2-name="product.category2Name" :category3-name="product.category3Name" :product-name="product.productName" 
        :image-u-r-l="product.productFileName"
        :product-price="product.productPrice" :product-availability="product.productStockStatus" :productID="product.productID" :category1ID="product.category1ID">
        </ProductCard>     
      </div>
    </div>    
  </div>
  
</template>

<style>
</style>
