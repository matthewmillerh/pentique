/**
 * Axios instance configured with a base URL.
 * The base URL is dynamically set based on the current environment
 * (production or development) using the `VITE_APP_API_URL` environment variable.
 *
 * @constant {import('axios').AxiosInstance} axios_api
 */

/**
 * Formatter for converting numbers to South African Rand (ZAR) currency format.
 * Uses the `Intl.NumberFormat` API to format numbers in `en-ZA` locale.
 *
 * @constant {Intl.NumberFormat} formatter
 */
import axios from 'axios'

//set axios baseURL to the current environment (production or development)
const BASE_URL = import.meta.env.VITE_APP_API_URL
export const axios_api = axios.create({
  baseURL: BASE_URL,
})

//Format the price to Rand format
export const formatter = new Intl.NumberFormat('en-ZA', {
  style: 'currency',
  currency: 'ZAR',
})
