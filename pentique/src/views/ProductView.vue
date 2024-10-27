<script setup>
import { onMounted, onUpdated, ref, watch } from 'vue'
import axios from 'axios'
import { useRoute } from 'vue-router'
import NotificationPopup from '@/components/NotificationPopup.vue'
import { formatter } from '@/scripts/global.js'

const product = ref({})
const route = useRoute()
const addedToCart = ref(0)

onMounted (() => {
  getProductByID()

  //Create a cart in localStorage if it doesn't already exist
  createCart()

  //Scroll to the top of the page when displaying a product
  scrollToTop()
})

//scrolls the page to the top
function scrollToTop(){
  window.scrollTo(0,0)
}

//Create a cart item in localStorage to store productID's 
function createCart(){
  if(!localStorage.getItem('cart')){
    localStorage.setItem('cart', '[]')
  }
}

//Get the product by the supplied productID
async function getProductByID() {
  try {
    const response = await axios.get("http://localhost:5000/products/" + route.params.productID)
    product.value = response.data
  } catch (err) {
    console.log(err)
  }
}

//Adds the product to the cart in localStorage
function addToCart(){
  let cart = JSON.parse(localStorage.getItem('cart'))

  //Only add the item to the cart if it does not already exist in the cart
  if(cart.length == 0 || !cart.find((item) => item.productID == product.value.productID)){
    cart.push({ productID: product.value.productID, quantity: 1 })

    //show cart success message
    showCartPopup(1)
  } else {
    //show cart warning message
    showCartPopup(2)
  }

  //Save the cart to localStorage
  localStorage.setItem('cart', JSON.stringify(cart))

  //create an event to update the cartItemCount
  window.dispatchEvent(new CustomEvent('item-added-to-cart', {
    detail: {
      storage: JSON.parse(localStorage.getItem('cart'))
    }
  }))

  
}

//show cart popup notification
function showCartPopup(value){
  addedToCart.value = value
  setTimeout(() => addedToCart.value = 0, 3000)
}

</script>
<template>
  <div>
    <h1 class="text-lg font-semibold pl-6 pb-0 pt-3">{{ product.productName }}</h1>
    <div class="flex flex-wrap justify-left p-6">
      <div class="h-[350px] grid grid-rows-3 grid-cols-1 w-28 mr-4 rounded-lg">
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mb-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center" 
            alt="Product Image"
          >
        </div>
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mt-1 mb-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center" 
            alt="Product Image"
          >
        </div>
        <div class="flex justify-center p-2 border border-blue-300 rounded-lg mt-1">
          <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
            class="max-w-full max-h-full self-center" 
            alt="Product Image"
          >
        </div>
      </div>
      <div class="rounded-lg p-4 border max-w-64 h-[350px] border-blue-300">
        <img :src="'/images/' + product.category1Name + '/' + (product.category2Name ? product.category2Name + '/' : '') + (product.category3Name ? product.category3Name + '/' : '') + product.productFileName" 
        class="max-w-full max-h-full self-center" 
        alt="Product Image"
        >
      </div>
      <div class="ml-4">
        <div class="h-7">
          <span class="font-semibold text-xl">{{ formatter.format(product.productPrice) }}</span>
        </div>
        <button class="mt-3 bg-green-400 border border-green-500 rounded p-2 text-sm font-semibold shadow-lg" @click="addToCart">Add to Cart</button>
        <div class="mt-4 max-w-60">
          <p class="text-sm font-semibold">Product Information</p>
          <p v-html="product.productDescription" class="pt-3 text-sm"></p>
        </div>
      </div>
      
    </div>    
  </div>
  <Transition>
    <NotificationPopup message="Item Added to Cart" type="success" v-if="addedToCart == 1"></NotificationPopup>
  </Transition>
  <Transition>
    <NotificationPopup message="Item Already In Cart" type="warning" v-if="addedToCart == 2"></NotificationPopup>
  </Transition>
  
  
</template>

<style>
.v-enter-active,
.v-leave-active {
  transition: all 0.5s ease-in-out;
}

.v-enter-from,
.v-leave-to {
  transform: translateX(150px);
  opacity: 0;
}
</style>
