import React, { useEffect, useState } from 'react'

export default function Hook3() {
    const [count,setCount] = useState(1)
    const [number,setNumber] = useState(1)
    useEffect(()=>{
        console.log("This is use effect 3 : dependence = count + number")
    },[count, number])
  return (
    <div>
        <h1>Tim hieu useEffect 3</h1>
        <p>let Count: {count}</p>
        <button onClick={()=>{setCount(count+1)}}>Click to Count</button>
        <p>le number: {number}</p>
        <button onClick={()=>{setNumber(number+1)}}>Click to Up Number</button>
    </div>
  )
}