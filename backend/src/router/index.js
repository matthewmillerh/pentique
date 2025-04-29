import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '@/views/LoginView.vue'
import { validateToken } from '@/scripts/auth'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
      meta: {
        requiresAuth: true,
      },
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
  ],
})

// Navigation guard to check authentication before accessing routes
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    const tokenValidation = validateToken()
    if (tokenValidation.valid) {
      next() // Allow navigation
    } else {
      console.warn('Access denied:', tokenValidation.reason)
      next({ name: 'login' }) // Redirect to login
    }
  } else {
    next() // Allow navigation for routes without `requiresAuth`
  }
})

export default router
