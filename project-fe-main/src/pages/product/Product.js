import React, { useEffect } from 'react'
import Header from '../../components/header/Header'
import Footer from '../../components/footer/Footer'
import SingleHeader from '../../components/header/SingleHeader'
import Products from '../../components/product/Products'


export default function Product() {
    const title = "Sản phẩm"

    return (
        <>
            <Header />
            <SingleHeader title={title} />
            <Products />
            <Footer />
        </>
    )
}
