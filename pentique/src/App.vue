<script setup>
import { RouterLink, RouterView, useRoute } from 'vue-router';
import { onMounted, ref, computed, onUpdated } from 'vue';
import { axios_api } from './scripts/global';
import MenuIcon from 'vue-material-design-icons/Menu.vue';
import Close from 'vue-material-design-icons/Close.vue';

const lvl1Categories = ref([]);
const lvl2Categories = ref([]);
const lvl3Categories = ref([]);
const route = useRoute();
const cartItemCount = ref(0);
const showMobileMenu = ref(false);

onMounted(() => {
    //get all top level product categories
    getCategories();

    setCartItemCount();
});

//Set the value of cartItemCount to show and update the amount of items currently in the cart
function setCartItemCount() {
    //create a cart entry in localStorage if it does not exist
    if (!localStorage.getItem('cart')) {
        localStorage.setItem('cart', '[]');
    }

    cartItemCount.value = JSON.parse(localStorage.getItem('cart')).length;

    //Create an event listener to update cartItemCount when an item is added to the cart in localStorage
    window.addEventListener('item-added-to-cart', event => {
        cartItemCount.value = event.detail.storage.length;
    });
}

//get all level 1, 2 and 3 categories from the database
async function getCategories() {
    //get level 1 categories
    try {
        const response = await axios_api.get('/category1');
        lvl1Categories.value = response.data;
    } catch (err) {
        console.log(err);
    }

    //get level 2 categories
    try {
        const response = await axios_api.get('/category2');
        lvl2Categories.value = response.data;
    } catch (err) {
        console.log(err);
    }

    //get level 3 categories
    try {
        const response = await axios_api.get('/category3');
        lvl3Categories.value = response.data;
    } catch (err) {
        console.log(err);
    }
}

//Check if level 1 category has subcategories by supplied ID
function hasCategory2(category1ID) {
    let hasCategory2 = false;
    lvl2Categories.value.some(element => {
        if (element.category1ID === category1ID) {
            return (hasCategory2 = true);
        } else {
            return (hasCategory2 = false);
        }
    });
    return hasCategory2;
}

//Check if level 2 category has subcategories by supplied ID
function hasCategory3(category2ID) {
    let hasCategory3 = false;
    lvl3Categories.value.some(element => {
        if (element.category2ID === category2ID) {
            return (hasCategory3 = true);
        } else {
            return (hasCategory3 = false);
        }
    });
    return hasCategory3;
}

//Return an array of level 2 categories for the specified level 1 category
function lvl2ByID(category1ID) {
    let filteredLvl2Categories = [];
    lvl2Categories.value.forEach(element => {
        if (element.category1ID === category1ID) {
            filteredLvl2Categories.push(element);
        }
    });
    return filteredLvl2Categories;
}

//Return an array of level 3 categories for the specified level 2 category
function lvl3ByID(category2ID) {
    let filteredLvl3Categories = [];
    lvl3Categories.value.forEach(element => {
        if (element.category2ID === category2ID) {
            filteredLvl3Categories.push(element);
        }
    });
    return filteredLvl3Categories;
}

//shows the subcategories of the currently selected category
function currentCategory(category1ID) {
    return category1ID == route.params.category1ID ? true : false;
}

function toggleMobileMenu() {
    showMobileMenu.value = !showMobileMenu.value;
}
</script>

<template>
    <!-- Mobile nav menu -->
    <Transition name="mobile-nav-menu">
        <div
            class="mobile-nav fixed bottom-0 left-0 right-0 top-28 z-50 overflow-y-auto overscroll-y-none bg-white bg-opacity-50 backdrop-blur sm:hidden"
            v-if="showMobileMenu"
        >
            <ul class="mb-8 w-full text-center">
                <li class="py-2 font-semibold">
                    <RouterLink
                        @click="toggleMobileMenu"
                        class="main-nav-link rounded-lg transition-all"
                        to="/"
                        >Home</RouterLink
                    >
                </li>
                <li class="py-2 font-semibold">
                    <RouterLink
                        @click="toggleMobileMenu"
                        class="main-nav-link rounded-lg transition-all"
                        to="/about"
                        >About</RouterLink
                    >
                </li>
                <li class="py-2 font-semibold">
                    <RouterLink
                        @click="toggleMobileMenu"
                        class="main-nav-link rounded-lg transition-all"
                        to="/contact"
                        >Contact</RouterLink
                    >
                </li>
                <li class="py-2 font-semibold">
                    <RouterLink
                        @click="toggleMobileMenu"
                        class="main-nav-link rounded-lg transition-all"
                        to="/shipping"
                        >Shipping</RouterLink
                    >
                </li>
                <li class="py-2 font-semibold">
                    <RouterLink
                        @click="toggleMobileMenu"
                        class="main-nav-link rounded-lg transition-all"
                        to="/shopping-cart"
                        >Cart (<span class="text-sm font-semibold">{{ cartItemCount }}</span
                        >)</RouterLink
                    >
                </li>
                <li class="mb-2 mt-2 text-2xl">Products</li>
                <li v-for="category1 in lvl1Categories" class="rounded-lg">
                    <RouterLink
                        :to="'/products/' + category1.category1Name + '/' + category1.category1ID"
                        class="block h-full w-full rounded-lg px-3 py-2 font-semibold transition-all"
                        @click="toggleMobileMenu"
                        >{{ category1.category1Name }}</RouterLink
                    >

                    <!-- Div wrapper for grid transition-->
                    <Transition>
                        <div class="grid grid-rows-[1fr]">
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
                                            class="block rounded-lg py-1 pl-4 pr-2 transition-all"
                                            @click="toggleMobileMenu"
                                            >{{ category2.category2Name }}</RouterLink
                                        >

                                        <!-- Nav list for level 3 categories -->
                                        <ul v-if="hasCategory3(category2.category2ID)">
                                            <li
                                                v-for="category3 in lvl3ByID(category2.category2ID)"
                                            >
                                                <RouterLink
                                                    :to="
                                                        '/products/' +
                                                        category3.category3Name +
                                                        '/' +
                                                        category1.category1ID
                                                    "
                                                    class="block rounded-lg py-1 pl-8 pr-2 font-thin transition-all"
                                                    @click="toggleMobileMenu"
                                                    >{{ category3.category3Name }}</RouterLink
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
    </Transition>

    <header>
        <div class="fixed left-0 right-0 top-0 h-28 bg-white bg-opacity-50 backdrop-blur">
            <div
                class="fixed left-6 right-6 top-5 z-40 flex flex-wrap items-center justify-center rounded-lg border border-blue-300 bg-blue-200 bg-opacity-60 p-3 shadow shadow-blue-100"
            >
                <img alt="Pentique logo" src="/images/logo.png" width="100" />
                <nav class="hidden p-2 sm:block">
                    <RouterLink class="main-nav-link rounded-lg p-3 transition-all" to="/"
                        >Home</RouterLink
                    >
                    <RouterLink class="main-nav-link rounded-lg p-3 transition-all" to="/about"
                        >About</RouterLink
                    >
                    <RouterLink class="main-nav-link rounded-lg p-3 transition-all" to="/contact"
                        >Contact</RouterLink
                    >
                    <RouterLink class="main-nav-link rounded-lg p-3 transition-all" to="/shipping"
                        >Shipping</RouterLink
                    >
                    <RouterLink
                        class="main-nav-link rounded-lg p-3 transition-all"
                        to="/shopping-cart"
                        >Cart (<span class="text-sm font-semibold">{{ cartItemCount }}</span
                        >)</RouterLink
                    >
                </nav>
            </div>
            <Transition name="mobileMenuButton"
                ><button
                    v-if="!showMobileMenu"
                    @click="toggleMobileMenu"
                    class="absolute right-12 top-11 z-50 block sm:hidden"
                >
                    <menu-icon /></button
            ></Transition>
            <Transition name="mobileMenuButton"
                ><button
                    v-if="showMobileMenu"
                    @click="toggleMobileMenu"
                    class="absolute right-12 top-11 z-50 block sm:hidden"
                >
                    <close /></button
            ></Transition>
        </div>
    </header>

    <div class="mt-28">
        <div
            class="fixed hidden max-h-[80%] w-[17%] max-w-[17%] overflow-y-auto overflow-x-hidden rounded-lg border border-blue-300 bg-blue-200 shadow sm:block"
        >
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
                        class="category-item block h-full w-full rounded-lg px-3 py-2 transition-all"
                    >
                        {{ category1.category1Name }}
                    </RouterLink>

                    <!-- Div wrapper for grid transition-->
                    <Transition>
                        <div
                            class="grid grid-rows-[1fr]"
                            v-show="currentCategory(category1.category1ID)"
                        >
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
                                            <li
                                                v-for="category3 in lvl3ByID(category2.category2ID)"
                                            >
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

        <div
            class="float-right mb-4 w-full rounded-lg border border-blue-300 bg-blue-100 shadow sm:w-[80%] sm:max-w-[80%]"
        >
            <router-view v-slot="{ Component }">
                <component :is="Component" />
            </router-view>
        </div>
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

.mobile-nav::-webkit-scrollbar {
    width: 0px;
}
</style>
