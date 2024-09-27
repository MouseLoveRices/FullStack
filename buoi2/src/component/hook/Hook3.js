import React from 'react'
import { Card, CardBody, CardTitle, CardSubtitle, CardText, Button, Container, Col, Row, ListGroup, ListGroupItem } from 'reactstrap'
import './hook3.css'
import img1 from '../../img/tour-1.png'
import img2 from '../../img/tour-2.png'
import img3 from '../../img/tour-3.png'
import img4 from '../../img/tour-4.png'

//https://react-bootstrap-lovat.vercel.app/
export default function Hook3() {

    let arr =[
        {   
            location:"New York",
            title: "Three Temples Bangkok City Tour Must Visit",
            price:"$149.99",
            imgSrc: img1
        },
        {
            location:"New York",
            title: "Essene of VietNam South to North",
            price:"$167.19",
            imgSrc: img2
        },
        {
            location:"New York",
            title: "Osa Peninsula to Dominical city Tour",
            price:"$147.99",
            imgSrc: img3
        },
        {
            location:"New York",
            title: "Mt Fuji, Hakone, Lake Ashi Cruise",
            price:"$50.15",
            imgSrc: img4
        }
    ]
  return (
        <>
        <Container>
        <ListGroup>
            <ListGroupItem active >New York</ListGroupItem>
            <ListGroupItem >London</ListGroupItem>
            <ListGroupItem >Tokyo</ListGroupItem>
            <ListGroupItem >Los Angeles</ListGroupItem>       
        </ListGroup>
        </Container>    
        <Row >           
            {arr.map((card, index) => (
                <Col lg={3} md={4} sm={6} xs={6}>
                <Card key={index}  >
                    <img alt="Sample" src={card.imgSrc}/>
                    <CardBody>
                        <h6><i class="fa-solid fa-map-pin"></i> {card.location}</h6>
                        <CardTitle tag="h5"> {card.title}</CardTitle>

                        <CardText>
                            {card.text}
                        </CardText>

                        <p>From <a>{card.price} </a><span>$250.00</span></p>
                        
                        <p>
                            <i class="fa-solid fa-star icon"></i>
                            <i class="fa-solid fa-star icon"></i>
                            <i class="fa-solid fa-star icon"></i>
                            <i class="fa-solid fa-star icon"></i>
                            <i class="fa-regular fa-star-half-stroke icon"></i>
                        </p>
                    </CardBody>
                </Card>
                </Col>
            ))}
            
        </Row>
        </>
  )
}
