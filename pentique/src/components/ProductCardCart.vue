<script setup>
import { formatter } from '@/scripts/global.js'
import { onMounted, ref, toRefs } from 'vue'

const props = defineProps(['category1Name', 'category2Name', 'category3Name', 'imageURL', 'productName', 'productPrice', 'productQuantity', 'productID', 'category1ID', 'index'])
const quantityCurrentValue = ref(null)
const { productQuantity, index } = toRefs(props)
const updateButtonClicked = ref(false)
const emit = defineEmits(['update-quantity', 'remove-from-cart'])
const valid = ref(true)

onMounted(() => {

    //set the initial quantity for the product from the value in the cart
    quantityCurrentValue.value = productQuantity.value
})

//reset the quantity input box when focus is changed
function resetQuantityBox(){
    if(!updateButtonClicked.value){
        quantityCurrentValue.value = productQuantity.value
        valid.value = true
        console.log('reset')
    }
}

//validate the input in the quantity field - emit event to update cart if valid
function validateQuantity(){
    if(!/\D/.test(quantityCurrentValue.value)){
        valid.value = true
        emit('update-quantity', quantityCurrentValue.value, index.value)
    } else {
        valid.value = false
    }  
}

</script>

<template>
    <div class="mb-4 inline-flex">
        <RouterLink :to="'/product/' + productID + '/' + category1ID">
            <div class="bg-blue-200 rounded-lg inline-flex flex-col items-center w-48 max-w-52 p-2 border border-blue-300 shadow">
                <div class="w-32 h-48 max-w-40 max-h-60 rounded p-2 bg-blue-100 inline-flex justify-center">
                    <img :src="'/images/' + category1Name + '/' + (category2Name ? category2Name + '/' : '') + (category3Name ? category3Name + '/' : '') + imageURL" 
                    class="max-w-full max-h-full self-center" 
                    alt="">
                </div>           
            </div>
        </RouterLink>
        <div class="flex items-start flex-col w-96 ml-4">
            <div class="w-full">
                <span class="text-sm">
                    Price: 
                </span>
                <span class="font-semibold text-sm">
                    {{ formatter.format(productPrice) }} 
                </span>
                <span class="text-sm">
                    x{{ productQuantity }}
                </span>
                <span class="text-sm font-semibold">
                    ({{ formatter.format(productPrice*productQuantity) }})
                </span>
            </div>
            <div><span class="text-sm">Quantity: <input type="text" class="px-1 rounded w-12" v-model="quantityCurrentValue" @focusout="resetQuantityBox()"></span></div>
            <p 
                class="rounded-3xl bg-red-300 border border-red-400 shadow-lg px-2 text-sm mt-2"
                v-show="!valid">Please enter a number</p>
            <button @click="validateQuantity" 
                class="rounded bg-green-300 border border-green-400 shadow-md text-sm font-semibold px-2 py-1 mt-3" 
                v-show="productQuantity != quantityCurrentValue"
                @mousedown="updateButtonClicked = true"
                @mouseup="updateButtonClicked = false"
                >
                Update
            </button>
            <button class="rounded bg-red-300 border border-red-400 shadow-md text-sm font-semibold px-2 py-1 mt-4" @click="$emit('remove-from-cart', index)">
                Remove
            </button>
        </div>        
    </div>   
</template>
