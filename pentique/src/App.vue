<script setup>
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { onMounted, ref, computed, onUpdated } from 'vue'
import axios from 'axios'
import TransitionNavMenu from './components/TransitionNavMenu.vue'

const lvl1Categories = ref([])
const lvl2Categories = ref([])
const lvl3Categories = ref([])
const route = useRoute()

onMounted(() => {
  //get all top level product categories
  getCategories()
})

onUpdated(() => {


}) 

//get all level 1, 2 and 3 categories from the database
async function getCategories() {
  //get level 1 categories
  try {
    const response = await axios.get("http://localhost:5000/category1")
    lvl1Categories.value = response.data
  } catch (err) {
    console.log(err)
  }

  //get level 2 categories
  try {
    const response = await axios.get("http://localhost:5000/category2")
    lvl2Categories.value = response.data
  } catch (err) {
    console.log(err)
  }

   //get level 3 categories
   try {
    const response = await axios.get("http://localhost:5000/category3")
    lvl3Categories.value = response.data
  } catch (err) {
    console.log(err)
  }
}

//Check if level 1 category has subcategories by supplied ID
function hasCategory2(category1ID){
  let hasCategory2 = false
  lvl2Categories.value.some(element => {
    if(element.category1ID === category1ID){
      return hasCategory2 = true
    } else {
      return hasCategory2 = false
    }
  })
  return hasCategory2
}

//Check if level 2 category has subcategories by supplied ID
function hasCategory3(category2ID){
  let hasCategory3 = false
  lvl3Categories.value.some(element => {
    if(element.category2ID === category2ID){
      return hasCategory3 = true
    } else {
      return hasCategory3 = false
    }
  })
  return hasCategory3
}

//Return an array of level 2 categories for the specified level 1 category
function lvl2ByID (category1ID){
  let filteredLvl2Categories = []
  lvl2Categories.value.forEach(element => {
    if(element.category1ID === category1ID){
      filteredLvl2Categories.push(element)
    }
  })
  return filteredLvl2Categories
}

//Return an array of level 3 categories for the specified level 2 category
function lvl3ByID (category2ID){
  let filteredLvl3Categories = []
  lvl3Categories.value.forEach(element => {
    if(element.category2ID === category2ID){
      filteredLvl3Categories.push(element)
    }
  })
  return filteredLvl3Categories
}

//shows the subcategories of the currently selected category
function currentCategory(category1ID){
  return (category1ID == route.params.category1ID) ? true : false
}
</script>

<template>
  <header>
    <div class="fixed top-0 left-0 right-0 bg-white h-28 backdrop-blur bg-opacity-50">
      <div class="rounded-lg bg-blue-200 bg-opacity-60 flex justify-center items-center flex-wrap fixed top-5 left-6 right-6 z-50 p-3 
      border border-blue-300 shadow shadow-blue-100">
        <img alt="Pentique logo" src="/images/logo.png" width="100" />
        <nav class="p-2">
          <RouterLink class="p-4 main-nav-link rounded-lg transition-all" to="/">Home</RouterLink>
          <RouterLink class="p-4 main-nav-link rounded-lg transition-all" to="/about">About</RouterLink>
          <RouterLink class="p-4 main-nav-link rounded-lg transition-all" to="/contact">Contact</RouterLink>
          <RouterLink class="p-4 main-nav-link rounded-lg transition-all" to="/shipping">Shipping</RouterLink>
        </nav>
      </div>
    </div>
  </header>

  <div class="mt-28">
      <div class="max-w-[17%] w-[17%] float-left bg-blue-200 rounded-lg border border-blue-300 shadow">
        <!-- Main nav list for level 1 categories-->
        <ul class="text-sm">
          <li v-for="category1 in lvl1Categories" class="border-b rounded-lg">
            <RouterLink :to="'/products/' + category1.category1Name + '/' + category1.category1ID" class="h-full w-full block p-3 category-item rounded-lg transition-all">{{ category1.category1Name }}</RouterLink>
            
            <!-- Div wrapper for grid transition-->
             <Transition>
              <div class="grid grid-rows-[1fr]" v-show="currentCategory(category1.category1ID)">
              <div class="overflow-hidden">
                
                <!-- Nav list for level 2 categories -->
                <ul v-if="hasCategory2(category1.category1ID)">
                <li v-for="category2 in lvl2ByID(category1.category1ID)">
                  <RouterLink :to="'/products/' + category2.category2Name + '/' + category1.category1ID" class="pl-4 category-item p-2 rounded-lg transition-all block">- {{ category2.category2Name }}</RouterLink>

                  <!-- Nav list for level 3 categories -->
                    <ul v-if="hasCategory3(category2.category2ID)">
                      <li v-for="category3 in lvl3ByID(category2.category2ID)">
                        <p class="pl-8 category-item p-2 rounded-lg transition-all">- {{ category3.category3Name }}</p>
                      </li>
                    </ul>
                </li>
              </ul>
              </div>
             </div>
             </Transition>
             <!--
              transition-[grid-template-rows] duration-200
              v-bind:class="{ 'nav-active': currentCategory(category1.category1ID) }"
             -->
                                  
          </li>
        </ul>
      </div>
    
    <div class="max-w-[80%] w-[80%] float-right bg-blue-100 rounded-lg border border-blue-300 shadow">
      <router-view v-slot="{ Component }">
          <component :is="Component" />
      </router-view>
    </div>
    
  </div>
  
</template>

<style scoped>
.router-link-active {
  color: black;
  font-weight: 600;
}
.main-nav-link:hover{
  
}
.category-item:hover{
  background-color: rgba(138, 172, 233, 0.659);
  cursor: pointer;
}

/* Router Trainsitions */
.v-enter-active,
.v-leave-active {
  transition: grid-template-rows 0.3s ease;
}

.v-enter-from,
.v-leave-to {
  grid-template-rows: 0fr;
}
</style>
