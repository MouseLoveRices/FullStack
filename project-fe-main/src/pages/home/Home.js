import React from 'react'
import Footer from '../../components/footer/Footer'
import Header from '../../components/header/Header'
import Main from '../../components/main/Main'
import Swal from 'sweetalert2';

export default function Home() {
    const t = localStorage.getItem("thanks")
    if (localStorage.getItem("thanks")) {
        Swal.fire({
            position: "top-end",
            icon: "success",
            title: `Cảm ơn bạn ${t} đã mua hàng`,
            showConfirmButton: false,
            timer: 1000
        });
        localStorage.removeItem("thanks")
    }

    // console.log(da)

    return (
        <>
            <Header />
            <Main />
            <Footer />
        </>
    )
}
