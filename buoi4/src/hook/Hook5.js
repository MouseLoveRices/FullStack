import React, { useEffect, useState } from 'react'
import './hook5.css'

export default function Hook5() {
  const [width,setWidth] = useState(window.innerWidth)
  const [isActive,setIsActive] = useState(true)
  useEffect(()=>{
    if(width<700){
      setIsActive(true)
    }else{
      setIsActive(false)
    }
  },[])
  useEffect(()=>{
    const handleResize=()=>{
      setWidth(window.innerWidth)
      console.log(window.innerWidth)
      if(window.innerWidth<700){
        setIsActive(true)
      }else{
        setIsActive(false)
      }
    }
    window.addEventListener("resize", handleResize)
    return()=>{
      window.removeEventListener("resize", handleResize)
    }
  },[])
  return (
    <div>
      <h1>This is hook 5</h1>
      <p>Width: {width}</p>
      <div className={isActive?"active sidebar":"sizebar"}></div>
    </div>
  )
}
