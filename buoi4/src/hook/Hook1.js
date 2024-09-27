import React, { useEffect, useState } from 'react'

export default function Hook1() {
    const [count,setCount] = useState(1)
    const [number,setNumber] = useState(1)
    useEffect(()=>{
        console.log("This is use effect 1")
    },[])
  return (
    <div>
        <h1>Tim hieu useEffect 1</h1>
        <p>let Count: {count}</p>
        <button onClick={()=>{setCount(count+1)}}>Click to Count</button>
    </div>
  )
}
