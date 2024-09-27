import React from 'react'
import Header from '../../components/header/Header'
import Footer from '../../components/footer/Footer'
import { Container } from 'reactstrap'
import SingleHeader from '../../components/header/SingleHeader'
import { Link } from 'react-router-dom'

export default function NotFound() {
    const title = "404 error"
    return (
        <>
            <Header />
            <SingleHeader title={title} />
            <Container fluid class=" py-5">
                <Container class=" py-5 text-center">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <h1 class="display-1">404</h1>
                            <h1 class="mb-4">Page Not Found</h1>
                            <Link class="btn border-secondary rounded-pill py-3 px-5" to={"/"}>Go Back To Home</Link>
                        </div>
                    </div>
                </Container>
            </Container>
            <Footer />
        </>
    )
}
