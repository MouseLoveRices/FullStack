import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import axios from "axios";
import { useEffect, useState } from "react";

const initialState = {
    carts: localStorage.getItem("carts") ? JSON.parse(localStorage.getItem("carts")) : [],
    status: 'idle',
    error: null,
    products: []
}
// 
const url = "https://63e9ae764f3c6aa6e7d06a70.mockapi.io/products"
let data = []
axios.get(url)
    .then(function (res) {
        data = res.data
    })
    .catch(function (error) {
        console.log(error)
    })


const cartSlice = createSlice({
    name: 'carts',
    initialState,


    reducers: {

        addCart: (state, action) => {
            const res = data.find(item => item.id === action.payload.id)
            const index = state.carts.findIndex(item => item.id === action.payload.id)
            console.log(state.carts)
            if (index >= 0) {
                let newCart = state.carts
                newCart[index].qty++
                state.carts = newCart
                localStorage.setItem("carts", JSON.stringify(state.carts))
            } else {
                state.carts = [...state.carts, { ...res, qty: 1 }]
                localStorage.setItem("carts", JSON.stringify(state.carts))
            }
        },
        removeCart: (state, action) => {
            state.carts = state.carts.filter(item => item.id !== action.payload)
            localStorage.setItem("carts", JSON.stringify(state.carts))
        },
        clearCart: (state) => {
            state.carts = []
            localStorage.setItem("carts", JSON.stringify(state.carts))
        },
        updateQty: (state, action) => {
            if (action.payload.flag) {
                state.carts = state.carts.map(item => item.id === action.payload.id ? { ...item, qty: item.qty + 1 } : item)
                localStorage.setItem("carts", JSON.stringify(state.carts))
            } else {

                state.carts = state.carts.map(item => item.id === action.payload.id ? { ...item, qty: item.qty > 1 ? item.qty - 1 : item.qty } : item)
                localStorage.setItem("carts", JSON.stringify(state.carts))
            }
        }
        // setLoanding: (state) => {
        //     state.status = 'loading'
        // },
        // setError: (state, action) => {
        //     state.status = 'failed'
        //     state.error = action.payload
        // },
        // setLoaded: (state) => {
        //     state.status = 'succeeded'
        // }
    }
})

export const { addCart, removeCart, clearCart, setError, setLoanding, setLoaded, updateQty } = cartSlice.actions
export default cartSlice.reducer