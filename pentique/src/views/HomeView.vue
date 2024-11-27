<script setup>
  import ProductCategoryCard from '@/components/ProductCategoryCard.vue';
  import axios from 'axios';
  import { onMounted, ref } from 'vue';

  onMounted(() => {
    getCategories()
  })

  const items = ref(null)
  async function getCategories() {
    try {
      const response = await axios.get("http://localhost:5000/category1");
      items.value = response.data;
    } catch (err) {
      console.log(err);
    }
  }
</script>

<template>
  <div class="ml-auto mr-auto">
    <div class="flex flex-wrap gap-4 justify-evenly p-4">
      <div v-for="item in items" :key="item.category1ID">
        <RouterLink :to="'/products/' + item.category1Name + '/' + item.category1ID">
          <ProductCategoryCard :category1Name="item.category1Name" :category2Name="item.category2Name" :category3Name="item.category3Name" :imageURL="item.productFileName"></ProductCategoryCard>
        </RouterLink>         
      </div>
    </div>
  </div>
  
</template>
