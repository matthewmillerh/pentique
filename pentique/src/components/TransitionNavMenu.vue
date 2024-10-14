<script setup>
//
//Functions to add transition to the side nav menu
//
function beforeEnter(el){
  el.style.height = '0'
}

function enter(el){
  const height = el.scollHeight
  el.style.height = `${height}px`
}

function beforeLeave(el){
  el.style.height = `${el.scollHeight}px`
}

function leave(el){
  el.style.height = '0'
}
</script>
<template>
<Transition @before-enter="beforeEnter" @enter="enter" @before-leave="beforeLeave" @leave="leave" name="nav-menu">
    <slot></slot>
</Transition>
</template>
<style scoped>
.nav-menu-enter-active, .nav-menu-leave-active {
  transition: height 0.5s ease
}
.nav-menu-enter, .nav-menu-leave-to {
height: 0
}
</style>