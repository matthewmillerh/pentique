<script setup>
import { axios_api } from "@shared/scripts/global.js"
import { onMounted } from "vue"

onMounted(() => {
  //get all top level product categories
  getCategories()
})

const lvl1Categories = ref([])
const lvl2Categories = ref([])
const lvl3Categories = ref([])
//get all level 1, 2 and 3 categories from the database
async function getCategories() {
  //get level 1 categories
  try {
    const response = await axios_api.get("/category1")
    lvl1Categories.value = response.data
  } catch (err) {
    console.log(err)
  }

  //get level 2 categories
  try {
    const response = await axios_api.get("/category2")
    lvl2Categories.value = response.data
  } catch (err) {
    console.log(err)
  }

  //get level 3 categories
  try {
    const response = await axios_api.get("/category3")
    lvl3Categories.value = response.data
  } catch (err) {
    console.log(err)
  }
}
</script>
<template>
  <div
    class="fixed hidden max-h-[80%] w-[17%] max-w-[17%] overflow-y-auto overflow-x-hidden rounded-lg border border-blue-300 bg-blue-200 shadow sm:block">
    <!-- Main nav list for level 1 categories-->
    <ul class="text-sm">
      <li v-for="category1 in lvl1Categories" class="rounded-lg border-b">
        <RouterLink
          :to="
            currentCategory(category1.category1ID)
              ? '/'
              : '/products/' +
                category1.category1Name +
                '/' +
                category1.category1ID
          "
          class="category-item block h-full w-full rounded-lg px-3 py-2 transition-all">
          {{ category1.category1Name }}
        </RouterLink>

        <!-- Div wrapper for grid transition-->
        <Transition>
          <div
            class="grid grid-rows-[1fr]"
            v-show="currentCategory(category1.category1ID)">
            <div class="overflow-hidden">
              <!-- Nav list for level 2 categories -->
              <ul v-if="hasCategory2(category1.category1ID)">
                <li v-for="category2 in lvl2ByID(category1.category1ID)">
                  <RouterLink
                    :to="
                      '/products/' +
                      category2.category2Name +
                      '/' +
                      category1.category1ID
                    "
                    class="category-item block rounded-lg py-1 pl-4 pr-2 transition-all"
                    >- {{ category2.category2Name }}</RouterLink
                  >

                  <!-- Nav list for level 3 categories -->
                  <ul v-if="hasCategory3(category2.category2ID)">
                    <li v-for="category3 in lvl3ByID(category2.category2ID)">
                      <RouterLink
                        :to="
                          '/products/' +
                          category3.category3Name +
                          '/' +
                          category1.category1ID
                        "
                        class="category-item block rounded-lg py-1 pl-8 pr-2 transition-all"
                        >- {{ category3.category3Name }}</RouterLink
                      >
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </Transition>
      </li>
    </ul>
  </div>
</template>
<style scoped>
@media screen and (min-width: 640px) {
  .router-link-active {
    color: black;
    font-weight: 600;
  }
}

.category-item:hover {
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

.mobile-nav-menu-enter-active,
.mobile-nav-menu-leave-active {
  transition: all 0.3s ease;
}

.mobile-nav-menu-enter-from,
.mobile-nav-menu-leave-to {
  transform: translateY(-500px);
  opacity: 0;
}

.mobileMenuButton-enter-active,
.mobileMenuButton-leave-active {
  transition: opacity 0.5s ease-in-out;
}

.mobileMenuButton-enter-from,
.mobileMenuButton-leave-to {
  opacity: 0;
}

/* Scrollbar width */
::-webkit-scrollbar {
  width: 8px;
}

/* Scrollbar Track */
::-webkit-scrollbar-track {
  background: rgb(179, 179, 243);
  border-radius: 8px;
}

/* Scrollbar Handle */
::-webkit-scrollbar-thumb {
  background: rgb(157, 157, 235);
  border-radius: 5px;
}

/* Scrollbar Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgb(130, 130, 249);
}
</style>
