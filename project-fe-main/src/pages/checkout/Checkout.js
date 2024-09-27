import React from 'react'
import CheckOut from '../../components/checkout-content/CheckOut'
import Header from '../../components/header/Header'
import SingleHeader from '../../components/header/SingleHeader'
import Footer from '../../components/footer/Footer'

export default function Checkout() {
    const title = "Thanh toán"
    return (
        <>
            <Header />
            <SingleHeader title={title} />
            <CheckOut />
            <Footer />
        </>
    )
}
