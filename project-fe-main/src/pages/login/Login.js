import React, { useEffect, useState } from "react";
import "./login.css";
import Images from "../../images/Images";
import { Button, Col, Container, Row } from "reactstrap";
import { Link, useNavigate } from "react-router-dom";
import Swal from "sweetalert2";
import { useDispatch, useSelector } from "react-redux";
import { fecthUsers, signIn } from "../../redux/usersSlice";

export default function Login() {
  const {users} =useSelector(state=>state.users)
  const dispatch = useDispatch()
  const navigate = useNavigate()

  useEffect(() => {
    dispatch(fecthUsers())
  }, [])


  const [email,setEmail]=useState("")
  const [pwd, setPwd]=useState("")

  const notify = JSON.parse(localStorage.getItem("notifySU"));
//   const handle_notify = () => {};
  // console.log(notify)
  if (notify) {
    Swal.fire({
      position: "top-end",
      icon: "success",
      title: `Đăng ký thành công ${notify.name}`,
      showConfirmButton: false,
      timer: 1500,
    });
    localStorage.removeItem("notifySU");
  }
  const handle_login=(user)=>{
    if (email === ""||pwd==="") {
      Swal.fire({
        position: "top-end",
        icon: "success",
        title: `Bạn chưa điền đủ thông tin `,
        showConfirmButton: false,
        timer: 1500,
      });
    } else {
      dispatch(signIn(user))
      if(localStorage.getItem("login")){
        setEmail("")
        setPwd("")
        navigate("/")
      }
    }
  }
  

  return (
    <>
      <Container fluid className="bg-login-page">
        <Container className=" py-5 h-100" >
          <Row className=" d-flex justify-content-center align-items-center h-100">
            <Col xs={12} md={8} lg={6} xl={5}  
              onKeyDown={(e) => {
                if (e.key === "Enter") {
                  handle_login({ email: email, pwd: pwd })
                }
              }}>
              <div
                className="card shadow-2-strong"
                style={{ borderRadius: "1rem" }}
              >
                <div className="card-body p-5 text-center">
                  <h3 className="mb-5" style={{ color: "#ffb524" }}>
                    Đăng nhập
                  </h3>
                  <div className="form-outline mb-4">
                    <input
                      type="email"
                      id="typeEmailX-2"
                      className="form-control form-control-lg"
                      placeholder="Email"
                      value={email}
                    onChange={(e)=>setEmail(e.target.value)}
                    />
                  </div>

                  <div className="form-outline mb-4">
                    <input
                      type="password"
                      id="typePasswordX-2"
                      className="form-control form-control-lg"
                      placeholder="Pwd"
                      value={pwd}
                    onChange={(e)=>setPwd(e.target.value)}
                    />
                  </div>
                  <div className="form-outline mb-4">
                    <Link className="nav-link">Quên mật khẩu?</Link>
                  </div>
                  <Col xs={12}>
                    <Button
                      className="button-login-page border-0 btn-lg w-100 "
                      onClick={()=>handle_login({email:email,pwd:pwd})}
                    >
                      Đăng nhập
                    </Button>
                  </Col>

                  <hr className="my-4" />
                  <Row>
                    <Col xs={6}>
                      <Button
                        disabled
                        color="primary"
                        className=" border-0 btn-lg w-100"
                        type="submit"
                      >
                        Facebook
                      </Button>
                    </Col>
                    <Col xs={6}>
                      <Button
                        disabled
                        color="danger"
                        className=" border-0 btn-lg w-100"
                        type="submit"
                      >
                        Google
                      </Button>
                    </Col>
                    <Col>
                      <p className="mt-4">
                        Bạn chưa có tài khoản?{" "}
                        <Link to={"/sign-up"} className="">
                          Đăng ký ngay!
                        </Link>
                      </p>
                    </Col>
                  </Row>
                </div>
              </div>
            </Col>
          </Row>
        </Container>
      </Container>
    </>
  );
}
