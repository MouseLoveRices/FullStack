// store.js
import { configureStore } from '@reduxjs/toolkit';
import productsSlice from './productsSlice';
import cartSlice from './cartSlice';
import usersSlice from './usersSlice';


const store = configureStore({
    reducer: {
        products: productsSlice,
        carts: cartSlice,
        users: usersSlice
    },
})

export default store