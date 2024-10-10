<script setup>
import { onMounted, ref, watch } from 'vue'
import axios from 'axios';
import { useRoute } from 'vue-router';

const subCategories = ref([])
const route = useRoute()

onMounted (() => {
  getSubCategories()
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

//update the DOM when route params change
watch(() => route.params.id, () => {
    getSubCategories()
  }
)

</script>
<template>
  <div>
    <h1 class="text-lg font-semibold p-3">{{ $route.params.category }}</h1>
    <div v-for="categories in subCategories">
      <p>{{ categories.category2Name }}</p>
      <div v-for="subsubCategories in categories.category2Name">
        {{ subsubCategories.category3Name }}
      </div>
    </div>
  </div>
  
</template>

<style>
</style>
