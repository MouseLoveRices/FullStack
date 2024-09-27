import React, { useState } from 'react'
import { Button, Input, ListGroupItem } from 'reactstrap'

export default function Student(props) {
    const {student,deleteById, reChecked, rename} = props
    const [isEdit,setIsEdit] = useState(false)
    const [text,setText] = useState(student.name)
  return (
      <ListGroupItem className='student-item'>
        <input type="checkbox" checked={student.checked} onChange={()=>reChecked(student.id)} />
        <div onClick={()=>reChecked(student.id)} className={student&&student.checked?"student-name active":"student-name"}>

        {
          !isEdit?<p onDoubleClick={()=>setIsEdit(true)}> {student.name}</p>:
          <Input value= {text} onChange={(e)=>setText(e.target.value)} onKeyDown={(e)=>{
            if(e.key=="Enter"){
              setIsEdit(false);
              rename(student.id,text)
            }
          }} />
        } 
        </div>
        <Button className='deleteItem' onClick={()=>deleteById(student.id)}><i className='fa-solid fa-close'></i></Button>
      </ListGroupItem>
  )
}
