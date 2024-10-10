<script setup>
import { RouterLink, RouterView, useRoute } from 'vue-router'
import { onMounted, ref, computed, onUpdated } from 'vue'
import axios from 'axios'

const lvl1Categories = ref([])
const lvl2Categories = ref([])
const lvl3Categories = ref([])
const categoryNavList = ref(null)
const categoryWrapper = ref(null)
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
  return (category1ID == route.params.id) ? true : false
}
</script>

<template>
  <header>
    <div class="fixed top-0 left-0 right-0 bg-white h-28 backdrop-blur bg-opacity-50">
      <div class="rounded-lg bg-blue-200 bg-opacity-60 flex justify-center items-center flex-wrap fixed top-5 left-6 right-6 z-50 p-3">
        <img alt="Pentique logo" src="/images/logo.png" width="100" />
        <nav class="p-2">
          <RouterLink class="p-4 main-nav-link" to="/">Home</RouterLink>
          <RouterLink class="p-4 main-nav-link" to="/about">About</RouterLink>
          <RouterLink class="p-4 main-nav-link" to="/contact">Contact</RouterLink>
          <RouterLink class="p-4 main-nav-link" to="/shipping">Shipping</RouterLink>
        </nav>
      </div>
    </div>
  </header>

  <div class="mt-32">
    <Transition name="nav-menu">
      <div class="w-[20%] float-left ml-6 bg-blue-200 rounded-lg transition-all duration-200 overflow-hidden" ref="categoryWrapper">
        <ul class="text-sm category-nav-list" ref="categoryNavList">
          <li v-for="category1 in lvl1Categories" class="border-b rounded-lg">
            <RouterLink :to="'/products/' + category1.category1Name + '/' + category1.category1ID" class="h-full w-full block p-3 category-item rounded-lg transition-all">{{ category1.category1Name }}</RouterLink>
            <ul v-if="hasCategory2(category1.category1ID)" v-show="currentCategory(category1.category1ID)">
              <li v-for="category2 in lvl2ByID(category1.category1ID)">
                <p class="pl-4 category-item p-2 rounded-lg transition-all">- {{ category2.category2Name }}</p>
                  <ul v-if="hasCategory3(category2.category2ID)">
                    <li v-for="category3 in lvl3ByID(category2.category2ID)">
                      <p class="pl-8 category-item p-2 rounded-lg transition-all">- {{ category3.category3Name }}</p>
                    </li>
                  </ul>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </Transition>
    
    <div class="max-w-[75%] w-[75%] float-right bg-blue-100 ml-3 mr-6 rounded-lg">
      <router-view v-slot="{ Component }">
          <component :is="Component" />
      </router-view>
    </div>
    
  </div>
  
</template>

<style scoped>
.router-link-active {
  color: black;
  text-shadow: 0px 0px 1px black;
}
.main-nav-link:hover{
  text-shadow: 0px 0px 1px black;
}
.category-item:hover{
  background-color: rgba(138, 172, 233, 0.659);
  cursor: pointer;
}
.category-nav-list{

}

/* Router Trainsitions */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.nav-menu-enter-active,
.nav-menu-leave-active {
  transition: all 0.5s ease;
  max-height: 1500px;
}

.nav-menu-enter-from,
.nav-menu-leave-to {
  max-height: 0;
}
</style>
