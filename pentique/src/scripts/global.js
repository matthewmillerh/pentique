//Format the price to Rand format
export const formatter = new Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: 'ZAR'
})

export default {}