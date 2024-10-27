<script setup>
import { formatter } from '@/scripts/global.js'
import { onMounted, ref, toRefs } from 'vue'

const props = defineProps(['category1Name', 'category2Name', 'category3Name', 'imageURL', 'productName', 'productPrice', 'productQuantity', 'productID', 'category1ID', 'index'])
const currentItemEdited = ref()
const active = ref(false)
const quantityCurrentValue = ref(null)
const { productQuantity } = toRefs(props)

onMounted(() => {
    quantityCurrentValue.value = productQuantity.value
})

function showUpdateBtn(id){
    currentItemEdited.value = id
    active.value = true
    console.log(productQuantity.value + ' ' + quantityCurrentValue.value)
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
            <div class="w-full"><span class="text-sm">Price:</span> <span class="font-semibold text-sm">{{ formatter.format(productPrice) }}</span></div>
            <div><span class="text-sm">Quantity: <input @input="showUpdateBtn(productID)" type="text" class="px-1 rounded w-12" v-model="quantityCurrentValue" required></span></div>
            <button :id="productID" class="rounded bg-green-300 border border-green-400 shadow-md text-sm font-semibold px-2 py-1 mt-3" v-show="active && productQuantity != quantityCurrentValue">Update</button>
            <button class="rounded bg-red-300 border border-red-400 shadow-md text-sm font-semibold px-2 py-1 mt-4">Remove</button>
        </div>        
    </div>
    
</template>
