import React from 'react'
import { Card, CardBody, CardTitle, CardSubtitle, CardText, Button, Container, Row, Col } from 'reactstrap'
import './hook2.css'
import img1 from '../../logo192.png'
export default function Hook2() {
    return (
        <div className='contain'>
            <img src={img1} />
            <Card
                style={{
                    width: '18rem',
                    marginTop: 10
                }}
            >
                <img
                    alt="Sample"
                    src="https://picsum.photos/300/200"
                />
                <CardBody>
                    <CardTitle tag="h5">
                        Card1 title
                    </CardTitle>
                    <CardSubtitle
                        className="mb-2 text-muted"
                        tag="h6"
                    >
                        Card subtitle
                    </CardSubtitle>
                    <CardText>
                        Some quick example text to build on the card title and make up the bulk of the card‘s content.
                    </CardText>
                    <Button>
                        Button
                    </Button>
                </CardBody>
            </Card>

            <Card
                style={{
                    width: '18rem',
                    marginTop: 10
                }}
            >
                <img
                    alt="Sample"
                    src="https://picsum.photos/300/200"
                />
                <CardBody>
                    <CardTitle tag="h5">
                        Card2 title
                    </CardTitle>
                    <CardSubtitle
                        className="mb-2 text-muted"
                        tag="h6"
                    >
                        Card subtitle
                    </CardSubtitle>
                    <CardText>
                        Some quick example text to build on the card title and make up the bulk of the card‘s content.
                    </CardText>
                    <Button>
                        Button
                    </Button>
                </CardBody>
            </Card>

            <Container>
                <Row>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                    <Col lg={3} md={4} sm={6} xs={6}>Row</Col>
                </Row>
            </Container>
        </div>
    )
}
