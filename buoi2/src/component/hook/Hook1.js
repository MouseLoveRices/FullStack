import React, { useRef, useState } from 'react'

import './hook1.css'
import { Button, Modal, ModalBody, ModalFooter, ModalHeader } from 'reactstrap';
 function Hook1() {
    const[modal,setModal]=useState(false)
    const toggle =()=>setModal(!modal)

     
    const [flag,setFlag]= useState(true);
    let [count, setCount] = useState(10);
    const countDown=()=>{
        setCount(count-1)
        setCount(count-1) // setCount(count-1) *100 lan van -1
        setCount(preState=>preState-1)
        setCount(preState=>preState-1) // moi dong setCount(preState=>preState-1) se tru di so don vi truong ung preState-1, o day 100 dong se tru 100 don vi
    }
    let testRef=useRef()
  return (
    <>
       <div>
        <h1>Value: {count}</h1>
        <button onClick={countDown}>Count down</button>
      </div>
      <div className={flag?"hook1":"hook1 active"}>
          <h1>This is hook 1</h1>
          <p>Flag: {flag?"True ne":"False ne"}</p>
          
      </div>
      <div className='meo' ref={testRef}>
        <p>dat mot bien va su dung ham useRef() de lay mot the html, sau do dung current.classList de them active cho the do</p>
      </div>
      <button onClick={()=>{
        setFlag(!flag)
        testRef.current.classList.toggle("active")
        }}>Click me</button> 

<div>
      <Button color="danger" onClick={toggle}>
        Click Me
      </Button>
      <Modal isOpen={modal} toggle={toggle} >
        <ModalHeader toggle={toggle} >
          Modal title
        </ModalHeader>
        <ModalBody>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi ut
          aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
          pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
          culpa qui officia deserunt mollit anim id est laborum.
        </ModalBody>
        <ModalFooter>
          <Button color="primary" onClick={toggle}>
            Do Something
          </Button>{' '}
          <Button color="secondary" onClick={toggle}>
            Cancel
          </Button>
        </ModalFooter>
      </Modal>
    </div>
    </>
  )
}

export default Hook1;