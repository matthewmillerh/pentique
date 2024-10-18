<script setup>
import { onMounted, onUpdated, ref, watch } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'

const product = ref({})
const route = useRoute()

onMounted (() => {
  getProductByID()
})

//Get the product by the supplied productID
async function getProductByID() {
  try {
    const response = await axios.get("http://localhost:5000/products/" + route.params.productID)
    product.value = response.data
    console.log(product.value)
  } catch (err) {
    console.log(err)
  }
}

</script>
<template>
  <div>
    <h1 class="text-lg font-semibold p-3 text-center">{{ product.productName }}</h1>
    <div class="flex flex-wrap justify-left p-6 h-96">
      <div class="h-full grid grid-rows-3 grid-cols-1 w-28 mr-4 rounded-lg">
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mb-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center rounded" 
            alt="Product Image"
          >
        </div>
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mt-1 mb-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center rounded" 
            alt="Product Image"
          >
        </div>
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mt-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center rounded" 
            alt="Product Image"
          >
        </div>
      </div>
      <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
        class="max-w-full max-h-full self-center rounded-lg" 
        alt="Product Image"
      >
    </div>    
  </div>
  
</template>

<style>
</style>
