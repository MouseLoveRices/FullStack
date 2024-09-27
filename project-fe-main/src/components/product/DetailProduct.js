import React, { useEffect, useState } from 'react'
import { Button, Col, Container, Input, InputGroup, Row } from 'reactstrap'
import "./detailprod.css"
import { FaMinus, FaPlus } from 'react-icons/fa';
import Slider2 from '../main/slider/Slider2';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { findByIdProducts } from '../../redux/productsSlice';
import Images from '../../images/Images';

export default function DetailProduct() {
    const { id } = useParams()
    const { productDetail, status, error, totalPage } = useSelector(state => state.products)
    const dispatch = useDispatch()
    // console.log(productDetail)
    useEffect(() => {
        dispatch(findByIdProducts(id))
    }, [])
    const arr = [
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
        { id: 1, name: "img1" },
    ]
    const [quantity, setQuantity] = useState(1);
    const changeQty = (flag) => {
        if (flag) {
            setQuantity(quantity + 1);
        } else {
            if (quantity > 1) {
                setQuantity(quantity - 1);
            }
        }

    }


    return (
        <Container fluid className=" py-5 mt-5">
            <Container className=" py-5">
                <Row className=" g-4 mb-5">
                    <Col lg={8} xl={9} >
                        <Row className="g-4">
                            <Col lg={6} md={12} sm={12}>
                                <div className="">
                                    <a href="#">
                                        <img src={Images.bestProduct[productDetail.images]} className="img-fluid rounded" />
                                    </a>
                                </div>
                            </Col>
                            <Col lg={6}>
                                <h4 className="fw-bold mb-3">{productDetail.name}</h4>
                                <p className="mb-3">Category: {productDetail.category}</p>
                                <h5 className="fw-bold mb-3">{productDetail.price} $</h5>
                                <p className="mb-4">The generated Lorem Ipsum is therefore always free from repetition injected humour, or non-characteristic words etc.</p>
                                <p className="mb-4">Susp endisse ultricies nisi vel quam suscipit. Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish</p>
                                <InputGroup className="quantity mb-5">
                                    <Button className="rounded-circle " onClick={() => changeQty(false)}>
                                        <FaMinus />
                                    </Button>
                                    <Input
                                        type="text"
                                        className="form-control form-control-sm text-center border-0"
                                        value={quantity}
                                        readOnly
                                    />
                                    <Button className="rounded-circle " onClick={() => changeQty(true)}>
                                        <FaPlus />
                                    </Button>
                                </InputGroup>
                                <a href="#" className="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i className="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </Col>
                            <Col lg={12}>
                                <div>
                                    <h3>Description</h3>
                                </div>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>{productDetail.description}</p>
                                        <div class="px-2">
                                            <div class="row g-4">
                                                <div class="col-6">
                                                    <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Weight</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">1 kg</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Country of Origin</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Agro Farm</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Quality</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Organic</p>
                                                        </div>
                                                    </div>
                                                    <div class="row text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Сheck</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">Healthy</p>
                                                        </div>
                                                    </div>
                                                    <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                        <div class="col-6">
                                                            <p class="mb-0">Min Weight</p>
                                                        </div>
                                                        <div class="col-6">
                                                            <p class="mb-0">250 Kg</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </Col>

                        </Row>
                    </Col>
                    <Col lg={4} xl={3}>
                        {/* category */}
                        <Col lg={12}>
                            <div className="mb-3">
                                <h4 className='fw-bold '>Danh mục</h4>
                                <ul className="list-unstyled fruite-categorie">
                                    <li>
                                        <div className="d-flex justify-content-between fruite-name">
                                            <a href="#">Apples</a>
                                            <span>(3)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div className="d-flex justify-content-between fruite-name">
                                            <a href="#">Oranges</a>
                                            <span>(5)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div className="d-flex justify-content-between fruite-name">
                                            <a href="#">Strawbery</a>
                                            <span>(2)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div className="d-flex justify-content-between fruite-name">
                                            <a href="#">Banana</a>
                                            <span>(8)</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div className="d-flex justify-content-between fruite-name">
                                            <a href="#">Pumpkin</a>
                                            <span>(5)</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </Col>
                        {/* discount */}
                        <Col lg={12}>
                            <div className="mb-3">
                                <h4 className='fw-bold '>Khuyến mãi</h4 >
                                <div class="d-flex align-items-center justify-content-start">
                                    <div class="rounded me-4" style={{ width: 100, height: 100 }}>
                                        <img src={Images.featur} class="img-fluid rounded" alt="" />
                                    </div>
                                    <div>
                                        <h6 class="mb-2">Name</h6>
                                        {/* <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div> */}
                                        <div class="d-flex mb-2">
                                            <h5 class="fw-bold me-2">2.99 $</h5>
                                            <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </Col>
                        {/* Banner */}
                        <Col lg={12}>
                            <div className="position-relative ">
                                <h4 className="fw-bold mt-5 ">Banner</h4>
                                <img src={Images.banner} className="img-fluid w-100 rounded" alt="" />
                                <div className="banner">
                                    <p>Fresh</p>
                                    <p>Fruits</p>
                                    <p>Banner</p>
                                </div>
                            </div>
                        </Col>
                    </Col>

                </Row>
                <h1 class="fw-bold mb-0">Mùa này kó</h1>
                <Slider2 arr={arr} />
            </Container>
        </Container>
    )
}
