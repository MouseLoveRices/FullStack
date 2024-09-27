import React, { useState } from 'react'

export default function Hook() {
   const[student,setStudent] = useState({name:"",age:0})
    return ( 
    <>
    <h1>Your name is {student.name}, Age: {student.age} </h1> 
    <form>
        <input type="text" placeholder='Type Name' value={student.name} onChange={(e)=>setStudent({...student,name:e.target.value})}/> <br/>
        <input type="text" placeholder='Type Age' value= {student.age} onChange={(e)=>setStudent({...student,age:e.target.value})}/> <br/>  
    </form>
    </>
  )
}
