//Format the price to Rand format
export const formatter = new Intl.NumberFormat('en-ZA', {
    style: 'currency',
    currency: 'ZAR'
})

export function saveCart(cart){
    //Save the cart to localStorage
    localStorage.setItem('cart', JSON.stringify(cart))

    //create an event to update the cartItemCount
    window.dispatchEvent(new CustomEvent('item-added-to-cart', {
    detail: {
        storage: JSON.parse(localStorage.getItem('cart'))
    }
    }))
}