import axios from 'axios'
import React, { useEffect, useState } from 'react'

export default function API1() {
    const [data,setData] = useState([])
    const fetchAPI = () =>{
        const url = "https://66a07b117053166bcabb8872.mockapi.io/testStudent"
        axios.get(url)
        .then(function(res){
            console.log(res)
            setData(res.data)
        })
        .catch(function(error){
            console.log(error)
        })
    }
    useEffect(()=>{
        fetchAPI()
    },[])
  return (
    <div>
      <h1>This is API 1</h1>
      <h3>This is list get from api</h3>
      {
        data.map((item,index)=>(
            <p key={index}>{item.id}, {item.student}</p>
        ))
      }
    </div>
  )
}
