<script setup>
import { onMounted, ref } from 'vue'
import axios from 'axios'
import ProductCardCart from '@/components/ProductCardCart.vue'

const shoppingCart = ref({})
const products = ref([])

onMounted(() => {
    shoppingCart.value = JSON.parse(localStorage.getItem('cart'))

    getProducts()
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
    console.log(products.value)
  } catch (err) {
    console.log(err)
  }
}

function updateQuantity(quantity, index){
  products.value[index]['quantity'] = quantity

  //Save the cart to localStorage
  localStorage.setItem('cart', JSON.stringify(products.value))
  console.log(products.value[index]['quantity'])
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
        @update-quantity="updateQuantity">
        </ProductCardCart>     
      </div>
    </div>    
</template>
<style></style>