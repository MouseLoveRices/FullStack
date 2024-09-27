import React from 'react'
import Header from '../../components/header/Header'
import SingleHeader from '../../components/header/SingleHeader'
import Footer from '../../components/footer/Footer'
import CartContent from '../../components/cart-content/CartContent'

export default function Cart() {
    const title = "Giỏ hàng"
    return (
        <>
            <Header />
            <SingleHeader title={title} />
            <CartContent />
            <Footer />
        </>
    )
}
