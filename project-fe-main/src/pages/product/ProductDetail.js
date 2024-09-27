import React from 'react'
import Header from '../../components/header/Header'
import SingleHeader from '../../components/header/SingleHeader'
import Footer from '../../components/footer/Footer'
import DetailProduct from '../../components/product/DetailProduct'

export default function ProductDetail() {
    const title = "Chi tiết sản phẩm"

    return (
        <div>
            <Header />
            <SingleHeader title={title} />
            <DetailProduct />
            <Footer />
        </div>
    )
}
