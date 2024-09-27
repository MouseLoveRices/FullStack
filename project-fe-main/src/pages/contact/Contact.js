import React from 'react'
import Header from '../../components/header/Header'
import Footer from '../../components/footer/Footer'
import { Container, Row } from 'reactstrap'
import SingleHeader from '../../components/header/SingleHeader'

export default function Contact() {
    const title = "Liên hệ"
    return (
        <>
            <Header />
            <SingleHeader title={title} />
            <Container fluid className="contact ">
                <Container className="container py-5">
                    <div className="p-5 bg-light rounded">
                        <Row className=" g-4">
                            <div className="col-12">
                                <div className="text-center mx-auto" style={{ maxWidth: 700 }}>
                                    <h1 style={{ color: '#81c408' }}>Get in touch</h1>
                                    <p className="mb-4">
                                        The contact form is currently inactive. Get a functional and
                                        working contact form with Ajax &amp; PHP in a few minutes. Just
                                        copy and paste the files, add a little code and you're done.{" "}
                                    </p>
                                </div>
                            </div>
                            <div className="col-lg-12">
                                <div className="h-100 rounded">
                                    <iframe
                                        className="rounded w-100"
                                        style={{ height: 400 }}
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.4425580300924!2d106.70411121460212!3d10.775843692319588!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175292921f1373d%3A0xb57e6d9e7c94233a!2sHo%20Chi%20Minh%20City%2C%20Vietnam!5e0!3m2!1sen!2sbd!4v1694259875981!5m2!1sen!2sbd"
                                        loading="lazy"
                                        referrerPolicy="no-referrer-when-downgrade"
                                    />
                                </div>
                            </div>
                            <div className="col-lg-7">
                                <form action="" className="">
                                    <input
                                        type="text"
                                        className="w-100 form-control border-0 py-3 mb-4"
                                        placeholder="Your Name"
                                    />
                                    <input
                                        type="email"
                                        className="w-100 form-control border-0 py-3 mb-4"
                                        placeholder="Enter Your Email"
                                    />
                                    <textarea
                                        className="w-100 form-control border-0 mb-4"
                                        rows={5}
                                        cols={10}
                                        placeholder="Your Message"
                                        defaultValue={""}
                                    />
                                    <button
                                        className="w-100 btn form-control border-secondary py-3 bg-white "
                                        style={{ color: '#81c408' }}
                                        type="submit"
                                    >
                                        Submit
                                    </button>
                                </form>
                            </div>
                            <div className="col-lg-5">
                                <div className="d-flex p-4 rounded mb-4 bg-white">
                                    <i className="fas fa-map-marker-alt fa-2x text-primary me-4" />
                                    <div>
                                        <h4>Address</h4>
                                        <p className="mb-2">123 Street New York.USA</p>
                                    </div>
                                </div>
                                <div className="d-flex p-4 rounded mb-4 bg-white">
                                    <i className="fas fa-envelope fa-2x text-primary me-4" />
                                    <div>
                                        <h4>Mail Us</h4>
                                        <p className="mb-2">info@example.com</p>
                                    </div>
                                </div>
                                <div className="d-flex p-4 rounded bg-white">
                                    <i className="fa fa-phone-alt fa-2x text-primary me-4" />
                                    <div>
                                        <h4>Telephone</h4>
                                        <p className="mb-2">(+012) 3456 7890</p>
                                    </div>
                                </div>
                            </div>
                        </Row>
                    </div>
                </Container>
            </Container>
            <Footer />
        </>
    )
}
