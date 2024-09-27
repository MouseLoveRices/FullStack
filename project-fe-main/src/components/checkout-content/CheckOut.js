import React, { useState } from 'react'
import { useDispatch, useSelector } from 'react-redux'
import { Link, NavLink, useNavigate } from 'react-router-dom'
import { Button, ButtonGroup, Col, Container, Form, Input, Label, Row, Table } from 'reactstrap'
import Images from '../../images/Images'
import { clearCart, removeCart } from '../../redux/cartSlice'
import Swal from 'sweetalert2'

export default function CheckOut() {
    const { carts } = useSelector(state => state.carts)
    const dispatch = useDispatch()
    const navigate = useNavigate()

    const u = JSON.parse(localStorage.getItem("login"))
    const [name, setName] = useState(u && u.name != "" ? u.name : "")
    const [mail, setMail] = useState(u && u.email != "" ? u.email : "")
    const [sdt, setSdt] = useState(u && u.sdt != "" ? u.sdt : "")
    const [address, setAddress] = useState(u && u.diachi != "" ? u.diachi : "")


    console.log(u)
    // if(u){
    //     setName(u.name)
    //     setMail(u.email)
    //     setSdt(u.sdt)
    //     setAddress(u.diachi)
    // }


    const subTotal = () => {
        let sum = 0
        carts.forEach(item => {
            sum += (item.qty * item.price)
        });
        return sum
    }
    const subTotal1 = subTotal()

    // const form = useRef();

    // const sendEmail = (e) => {
    //   e.preventDefault();

    //   emailjs
    //     .sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', form.current, {
    //       publicKey: 'YOUR_PUBLIC_KEY',
    //     })
    //     .then(
    //       () => {
    //         console.log('SUCCESS!');
    //       },
    //       (error) => {
    //         console.log('FAILED...', error.text);
    //       },
    //     );
    // };

    const handle_checkOut = () => {
        if (name != "" && mail != "" && sdt != "" && address != "") {
            if (localStorage.getItem("order")) {
                const o = JSON.parse(localStorage.getItem("order"))
                const order = [...o, { name: name, email: mail, sdt: sdt, diachi: address, carts: carts },]
                localStorage.setItem("order", JSON.stringify(order))
                setName("")
                setMail("")
                setSdt("")
                setAddress("")
                dispatch(clearCart())
                localStorage.setItem("thanks", name)
                navigate("/")
            } else {
                const order = [
                    {
                        name: name,
                        email: mail,
                        sdt: sdt,
                        diachi: address,
                        carts: carts
                    },
                ]
                localStorage.setItem("order", JSON.stringify(order))
                setName("")
                setMail("")
                setSdt("")
                setAddress("")
                dispatch(clearCart())
                localStorage.setItem("thanks", name)
                navigate("/")
            }
            // console.log(order)
        } else {
            Swal.fire({
                position: "center",
                icon: "error",
                title: `Vui lòng điền đầy đủ thông tin`,
                showConfirmButton: false,
                timer: 1000,
            });
        }
    }

    return (
        <Container fluid className='py-5'>
            <Container className='py-5'>
                <h1 className='mb-4'>Chi tiết đơn hàng</h1>
                <Form>
                    <Row className='g-5'>
                        <Col md={12} lg={6} xl={7}>
                            <Label>Tên người nhận:</Label>
                            <Input type='text'
                                value={name}
                                onChange={(e) => setName(e.target.value)}
                            />
                            <Label>Email:</Label>
                            <Input type='text'
                                value={mail}
                                onChange={(e) => setMail(e.target.value)}
                            />
                            <Label>Sđt:</Label>
                            <Input type='text'
                                value={sdt}
                                onChange={(e) => setSdt(e.target.value)}
                            />
                            <Label>Địa chỉ:</Label>
                            <Input type='text'
                                value={address}
                                onChange={(e) => setAddress(e.target.value)}
                            />
                            <Button className='mt-3 border-0' style={{ background: "#81C408" }} onClick={() => {
                                navigate("/cart")
                            }
                            }>Quay về giỏ hàng</Button>
                        </Col>
                        <Col md={12} lg={6} xl={5}>
                            {
                                <Table hover>
                                    <thead>
                                        <tr>
                                            <th >
                                                #
                                            </th>
                                            <th>
                                                Name
                                            </th>
                                            <th>
                                                Price
                                            </th>
                                            <th>
                                                Qty
                                            </th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {
                                            carts.map((item, index) => (
                                                <tr key={index}>
                                                    <td >
                                                        <img className='img-cart img-fluid' src={Images.products[item.images]} />
                                                    </td>
                                                    <td>
                                                        <p className='mt-3'>{item.name}</p>
                                                    </td>
                                                    <td>
                                                        <p className='mt-3'>{item.price}</p>
                                                    </td>

                                                    <td>
                                                        <ButtonGroup className="mt-3" >
                                                            <span className='mx-3'>{item.qty}</span>
                                                        </ButtonGroup>
                                                    </td>
                                                    <td >
                                                        <p className='mt-3'>{item.price * item.qty}</p>
                                                    </td>
                                                </tr>
                                            ))
                                        }
                                        {/* <tr>
                                            <td colSpan={2}>
                                                Tạm tính :
                                            </td>
                                            <td colSpan={3}>
                                                aaaaaaa
                                            </td>
                                        </tr> */}
                                        <tr>
                                            <td colSpan={2}>
                                                Ship :
                                            </td>
                                            <td colSpan={3}>
                                                Free
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colSpan={2}>
                                                Hình thức thanh toán :
                                            </td>
                                            <td colSpan={3}>
                                                COD
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colSpan={2}>
                                                Tổng cộng:
                                            </td>
                                            <td colSpan={3}>
                                                {subTotal1}
                                            </td>
                                        </tr>
                                    </tbody>
                                </Table>
                            }
                            <Button onClick={() => handle_checkOut()} className='w-100 mt-3 p-3 border-0' style={{ background: "#81C408" }}>Hoàn tất đơn hàng</Button>
                        </Col>
                    </Row>
                </Form>
            </Container>
        </Container >
    )
}
