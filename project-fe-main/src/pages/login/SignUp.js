import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import { Button, Col, Container, Row } from "reactstrap";
import { createUsers, fecthUsers } from "../../redux/usersSlice";

export default function SignUp() {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [pwd, setPwd] = useState("");
  const handle_SignUp=(users)=>{
    dispatch(createUsers(users))
    localStorage.setItem("notifySU", JSON.stringify(users))
    setEmail("")
    setName("")
    setPwd("")
    dispatch(fecthUsers())
    navigate("/login")
  }

  return (
    <Container fluid className="bg-login-page">
      <Container className=" py-5 h-100">
        <Row className=" d-flex justify-content-center align-items-center h-100">
          <Col xs={12} md={8} lg={6} xl={5}>
            <div
              className="card shadow-2-strong"
              style={{ borderRadius: "1rem" }}
            >
              <div className="card-body p-5 text-center">
                <h3 className="mb-5" style={{ color: "#ffb524" }}>
                  Đăng ký
                </h3>
                <div className="form-outline mb-4">
                  <input
                    type="text"
                    className="form-control form-control-lg"
                    placeholder="Họ và tên"
                    value={name}
                    onChange={(e)=>setName(e.target.value)}
                  />
                </div>
                <div className="form-outline mb-4">
                  <input
                    type="email"
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
                <Col xs={12}>
                  <Button className="button-login-page border-0 btn-lg w-100 "
                    onClick={()=>handle_SignUp({name: name,email: email,pwd:pwd,sdt: "",diachi:""})}
                  >
                    Đăng ký
                  </Button>
                </Col>

                <hr className="my-4" />

                <Row>
                  <Col xs={6}>
                    <Button
                      color="primary"
                      className=" border-0 btn-lg w-100"
                      type="submit"
                      disabled
                    >
                      Facebook
                    </Button>
                  </Col>
                  <Col xs={6}>
                    <Button
                      color="danger"
                      className=" border-0 btn-lg w-100"
                      type="submit"
                      disabled
                    >
                      Google
                    </Button>
                  </Col>
                  <Col>
                    <p className="mt-4">
                      Bạn đã có tài khoản?{" "}
                      <Link to={"/login"}>Đăng nhập ngay!</Link>
                    </p>
                  </Col>
                </Row>
              </div>
            </div>
          </Col>
        </Row>
      </Container>
    </Container>
  );
}
