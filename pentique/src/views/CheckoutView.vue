<script setup>
import { ref, onBeforeMount } from 'vue'
import emailjs from '@emailjs/browser'
import { getCart } from '@/scripts/global'
import axios from 'axios'

const deliveryMethod = ref(null)
const form = ref(null)
const inputFieldReset = ref(null)
const shoppingCart = ref([])
const products = ref([])

onBeforeMount(() => {
    shoppingCart.value = getCart()
    getProducts()

    console.log(products.value)
})

//Get product information for each productID in the shopping cart
function getProducts(){
  shoppingCart.value.forEach(element => {
      getProductByID(element.productID, element.quantity)
  })
}

//Get the product from the database by the supplied productID
async function getProductByID(id, qty) {
    let productInfo = {}

    try {
      const response = await axios.get("http://localhost:5000/products/" + id)
  
      //add the quantity of the product in the cart to the product array
      productInfo = response.data
      productInfo['quantity'] = qty
      products.value.push(productInfo)
      //console.log(products.value)
    } catch (err) {
      console.log(err)
    }
}

const sendMail = () => {
  emailjs.sendForm('service_qg7afqq', 'template_dpf5t2n', form.value, 'RyIXXr7-ppm95PWre')
  .then(() => {
      alert('Message sent!')
      inputFieldReset.value = ""
  }, (error) => {
      alert('Message not sent', error)
  })
}
</script>
<template>
  <h1 class="text-lg font-semibold p-3 text-center">Finalize Your Order</h1>
  <form class="form" ref="form" @submit.prevent="sendMail">
    <div class="mx-auto w-4/5 pb-3">
      <div>
        <p class="font-semibold">Your Details</p>
      </div>
      <div class="w-64">
        <div class="py-4 relative mt-3">
          <input type="name" placeholder="Name" id="name" name="from_name" class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full" required>
          <label 
            for="name" 
            class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
            peer-placeholder-shown:top-5
          peer-placeholder-shown:text-gray-600
            peer-placeholder-shown:font-normal
            transition-all">
              Name
          </label>
        </div>
        <div class="py-4 relative">
          <input type="email" placeholder="Email address" id="email" class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full" required>
          <label 
            for="email" 
            class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
            peer-placeholder-shown:top-5
          peer-placeholder-shown:text-gray-600
            peer-placeholder-shown:font-normal
            transition-all">
              Email address
          </label>
        </div>
        <div class="py-4 relative">
          <input type="tel" placeholder="Phone number" id="tel" class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full" required>
          <label 
            for="tel" 
            class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
            peer-placeholder-shown:top-5
          peer-placeholder-shown:text-gray-600
            peer-placeholder-shown:font-normal
            transition-all">
              Phone number
          </label>
        </div>  
      </div>
      <div>
        <p class="font-semibold mb-4 mt-4">Delivery Options</p>
      </div>
      <div class="text-sm z-10 bg-blue-100 relative">
        <div class="py-1">
          <input type="radio" name="delivery" id="collection" class="mr-2" v-model="deliveryMethod" value="collect" checked>
          <label for="collection">Collect at 19 Rand Street, Durbanville, 7550 <span class="font-semibold">(Free)</span></label>
        </div>
        <div class="py-1">
          <input type="radio" name="delivery" id="to-door" class="mr-2" v-model="deliveryMethod" value="to-door">
          <label for="to-door">Delivery to Your Door <span class="font-semibold">(Price calculated after order is placed)</span></label>
        </div>
        <div class="py-1">
          <input type="radio" name="delivery" id="postnet" class="mr-2" v-model="deliveryMethod" value="postnet">
          <label for="postnet">Collect at Postnet <span class="font-semibold">(Price calculated after order is placed)</span></label>
        </div>
        <div class="py-1">
          <input type="radio" name="delivery" id="pep" class="mr-2" v-model="deliveryMethod" value="pep">
          <label for="pep">Collect at Pep <span class="font-semibold">(Price calculated after order is placed)</span></label>
        </div>
        <div class="py-1">
          <input type="radio" name="delivery" id="pudo" class="mr-2" v-model="deliveryMethod" value="pudo">
          <label for="pudo">Collect at PUDO locker <span class="font-semibold">(Price calculated after order is placed)</span></label>
        </div>        
      </div>
      <!-- Input fields to show when delivery to door is selected -->
       <Transition>
        <div v-if="deliveryMethod === 'to-door'" class="z-0">
          <div class="py-4 relative mt-3">
            <input type="address" placeholder="Address" id="address" class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="address" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Address
            </label>
          </div>
          <div class="py-4 relative">
            <input 
              type="number" 
              placeholder="Postal Code" 
              id="postal-code" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full
              [-moz-appearance:_textfield] [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none">
            <label 
              for="postal-code" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Postal Code
            </label>
          </div>
          <div class="py-4 relative">
            <input 
              type="text" 
              placeholder="Province/State" 
              id="provice-state" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="province-state" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Province/State
            </label>
          </div>
          <div class="py-4 relative">
            <input 
              type="text" 
              placeholder="Country" 
              id="country" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="country" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Country
            </label>
          </div>
        </div>
       </Transition>     
      <!-- End of delivery to door input fields -->
      <!-- Postnet delivery input fields -->
      <Transition>
      <div v-if="deliveryMethod === 'postnet'" class="mt-3">
        <div class="py-4 relative">
            <input 
              type="text" 
              placeholder="Postnet Branch" 
              id="postnet-branch" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="postnet-branch" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Postnet Branch
            </label>
          </div>
      </div>
      </Transition>  
      <!--End Pep delivery input fields -->
      <!-- Pep delivery input fields -->
      <Transition>
      <div v-if="deliveryMethod === 'pep'" class="mt-3">
        <div class="py-4 relative">
            <input 
              type="text" 
              placeholder="Pep Branch" 
              id="pep-branch" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="pep-branch" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                Pep Branch
            </label>
          </div>
      </div>
      </Transition>  
      <!--End Pep delivery input fields -->

      <!-- PUDO delivery input fields -->
      <Transition>
      <div v-if="deliveryMethod === 'pudo'" class="mt-3">
        <div class="py-4 relative">
            <input 
              type="text" 
              placeholder="PUDO Branch" 
              id="pudo-branch" 
              class="peer placeholder-transparent border-b focus:outline-none p-1 rounded text-sm w-full">
            <label 
              for="pudo-branch" 
              class="absolute -top-1.5 text-sm left-1.5 cursor-text font-semibold
              peer-placeholder-shown:top-5
            peer-placeholder-shown:text-gray-600
              peer-placeholder-shown:font-normal
              transition-all">
                PUDO Branch
            </label>
          </div>
      </div>
      </Transition>  
      <!--End PUDO delivery input fields -->
      <div class="relative mt-3">
        <label 
          for="note" 
          class="font-semibold text-sm">
            Add a Note to Your Order
        </label>
        <textarea 
          id="note" 
          rows="4"
          class="border-b focus:outline-none p-1 mt-2 rounded text-sm w-full">
        </textarea>
      </div>
      <div>
        <p class="text-sm font-semibold mt-2">
          After placing your order you will receive an automated email confirming your order. 
          Once the order has been processed and the shipping amount calculated you will receive an email with the invoice and payment instruction.
        </p>
        <button type="submit" name="send" class="rounded bg-green-300 border border-green-400 shadow-md px-2 py-1 text-sm font-semibold mt-3">
          Place Order
        </button>
      </div>
      <!-- Hidden inputs that hold the order information to be sent in the email -->
      <div class="">
        <input type="text" name="products" :value="products">
      </div>
    </div>
  </form>
  
</template>

<style>
.v-enter-active {
  transition: none;
}

.v-leave-active {
  transition: none;
}

.v-enter-from {
  opacity: 0;
}
</style>
