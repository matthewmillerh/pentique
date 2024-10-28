<script setup>
import { onMounted, ref, computed } from 'vue'
import axios from 'axios'
import ProductCardCart from '@/components/ProductCardCart.vue'
import { saveCart, formatter } from '@/scripts/global'

const shoppingCart = ref([])
const products = ref([])
const checkoutDisabled = ref(false)

onMounted(() => {
    getCart()
    getProducts()
})

//get the cart from localStorage and calculate cart total
function getCart(){
  shoppingCart.value = JSON.parse(localStorage.getItem('cart'))
}

//Sets the total value of the shopping cart
const cartTotalValue = computed(() => {
  let cartTotal = 0
   products.value.forEach(element => {
    cartTotal += (element.productPrice*element.quantity)
   })
   return cartTotal
})

//Get product information for each productID in the shopping cart
function getProducts(){
    shoppingCart.value.forEach(element => {
        getProductByID(element.productID, element.quantity)
    });
}

//Get the product by the supplied productID
async function getProductByID(id, qty) {
  try {
    const response = await axios.get("http://localhost:5000/products/" + id)

    //add the quantity of the product in the cart to the product array
    let productInfo = {}
    productInfo = response.data
    productInfo['quantity'] = qty
    products.value.push(productInfo)
    //console.log(products.value)
  } catch (err) {
    console.log(err)
  }
}

//update the quantity of an item in the cart
function updateQuantity(quantity, index){

  if(quantity <= 0 || quantity === ''){
    console.log(quantity)
    //remove the item from the products array
    products.value.splice(index, 1)
  } else {
    //edit the quantity in the array
    products.value[index]['quantity'] = quantity
  }

  //Save the updated cart array to localStorage
  saveCart(products.value)

  checkoutDisabled.value = false
}

//remove an item from the cart
function removeFromCart(index){
  products.value.splice(index, 1)

  //Save the updated cart array to localStorage
  saveCart(products.value)
}

//empty the entire cart
function emptyCart(){
  products.value.length = 0

  //Save the updated cart array to localStorage
  saveCart(products.value)
}

function setCheckoutButton(value){
  checkoutDisabled.value = value
}
</script>
<template>
    <h1 class="text-lg font-semibold p-3 text-center">Your Shopping Cart</h1>
    <div class="px-4">
      <div v-for="(product, index) in products" :key="product.productID">
        <ProductCardCart
        :category1-name="product.category1Name" :category2-name="product.category2Name" :category3-name="product.category3Name" :product-name="product.productName" 
        :image-u-r-l="product.productFileName"
        :product-price="product.productPrice" :product-quantity="product.quantity" :productID="product.productID" :category1ID="product.category1ID" :index="index"
        @update-quantity="updateQuantity" @remove-from-cart="removeFromCart" @checkout-disabled="setCheckoutButton">
        </ProductCardCart>     
      </div>

      <!-- Cart control buttons (only show if cart has items) -->
      <div class="mb-4" v-if="products.length">
        <!-- Cart total value -->
        <div class="mb-3">
          <p>Shopping Cart Total: <span class="font-semibold">{{ formatter.format(cartTotalValue) }}</span></p>
        </div>
        <button 
          class="rounded bg-red-300 border border-red-400 shadow-md px-2 py-1 text-sm font-semibold mr-3"
          @click="emptyCart">
          Empty Cart
        </button>
        <button 
          class="rounded bg-green-300 border border-green-400 shadow-md px-2 py-1 text-sm font-semibold mr-3 disabled:bg-gray-300 disabled:border-gray-400 disabled:cursor-not-allowed"
          :disabled="checkoutDisabled">
          Continue to Checkout
        </button>
      </div>
    </div>    
</template>
<style></style>