import React, { useEffect, useState } from 'react'

export default function Hook2() {
    const [count,setCount] = useState(1)
    const [number,setNumber] = useState(1)
    useEffect(()=>{
        console.log("This is use effect 2 : dependence = count")
    },[count])
  return (
    <div>
        <h1>Tim hieu useEffect 2</h1>
        <p>let Count: {count}</p>
        <button onClick={()=>{setCount(count+1)}}>Click to Count</button>
    </div>
  )
}