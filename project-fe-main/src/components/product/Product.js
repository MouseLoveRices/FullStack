import React, { useEffect } from 'react'
import { useDispatch } from 'react-redux'
import { Link } from 'react-router-dom'

import { Button, Col } from 'reactstrap'
import { addCart } from '../../redux/cartSlice'
import Swal from 'sweetalert2'
import Images from '../../images/Images'

export default function Product(props) {
    // console.log(Images)
    const dispatch = useDispatch()
    const { index, item, error } = props
    const handle_addCart = (item) => {
        Swal.fire({
            position: "center",
            icon: "success",
            title: "Sản phẩm đã có trong giỏ hàng",
            showConfirmButton: false,
            timer: 1000
        });
        dispatch(addCart(item))
    }

    // let imgPath = async (img) => {
    //     try {
    //         // await import(`../..${img}`);
    //         console.log(require(img))
    //         return await require(img)

    //     } catch (err) {
    //         console.error("Image not found:", err);
    //         return '/images/default-image.jpg'; // Fallback image from public folder
    //     }
    // };
    return (
        <Col xl={4} lg={6} key={index} >
            <div className="rounded position-relative fruite-item">
                <div className="fruite-img">
                    {/* <img src={test} className="img-fluid w-100 rounded-top" /> */}
                    <img src={item.images ? Images.products[item.images] : test} className="img-fluid w-100 rounded-top" alt="" />
                </div>
                <div className="text-white  px-3 py-1 rounded position-absolute " style={{ top: 10, left: 10, background: "#ffb524 " }} >10%</div>
                <div className="p-4 border border-secondary border-top-0 rounded-bottom">
                    <h4><Link to={`/detail/${item.id}`}>{item.name ? item.name : ""}</Link></h4>
                    <p>{item.description ? item.description : ""}</p>
                    <div className="d-flex justify-content-between flex-lg-wrap">
                        <p className="text-dark fs-5 fw-bold mb-0">{item.price} ₫ / kg</p>
                        <Button onClick={() => handle_addCart(item)} className="btn border border-0 rounded-pill px-3 text-white" style={{ background: "#ffb524" }}>
                            Add to cart
                        </Button>
                    </div>
                </div>
            </div>
        </Col>
    )
}
