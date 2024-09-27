import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Button, Input, Table } from 'reactstrap'
import 'bootstrap/dist/css/bootstrap.min.css';

export default function ListApi() {
    const[data,setData] = useState([])
    const[text,setText]= useState("")
    const[newValue,setNewValue] = useState("")
    const [isEdit,setIsEdit] = useState({id:"",flag:false})

    const url ="https://66a07b117053166bcabb8872.mockapi.io/animal"

    const getAnimal=()=>{
        axios.get(url)
        .then((res)=>{
            setData(res.data)
        })
        .catch((error)=>{
            console.log(error)
        })
    }

    const deleteAnimal=(id)=>{
        axios.delete(url+"/"+id)
        .then((res)=>{
            alert("delete success")
            setData(data.filter(item=>item.id!==id))
        })
        .catch((error)=>{
            console.log(error)
        })
    }

    const renameAnimal=(id,text) =>{
        axios({
            method:"put",
            url: url +"/"+id,
            data: {animal: text}
        })
        .then((res)=>{
            alert("Updated")
            setData(data.map(item=>item.id===id?{...item,animal:text}:item))
        })
        .catch((error)=>{
            console.log(error)
        })
    }

    const addAnimal =() =>{
        axios({
            method:"post",
            url:url,
            data:{animal: text}
        })
        .then((res)=>{
            alert("add success")
            setData([...data,{id:res.data.id,animal:text}])
        })
        .catch((error)=>{
            console.log(error)
        })
    }

    useEffect(()=>{
        getAnimal()
    },[])
  return (
    <div>
        <h1>This is List API</h1>
        <Table>
            <Button className='btn btn-success' onClick={addAnimal}>Add an Animal</Button>
            <Input type='text' value={text} placeholder='Type Name Animal' onChange={(e)=>{setText(e.target.value)}}/>
            <thead>
                <tr>
                    <th>
                        #
                    </th>
                    <th>
                        Animal
                    </th>
                    <th>
                        Button
                    </th>
                </tr>
            </thead>
            <tbody>

                {
                    data.map((item,index)=>(
                        <tr key={index}>
                            <td>id:{item.id}, index:{index}</td>
                            <td>
                                {
                                    isEdit.id===item.id&&isEdit.flag===true?<Input type='text' value= {newValue} onChange={(e)=>setNewValue(e.target.value)} onKeyDown={(e)=>{
                                      if(e.key=="Enter"){
                                        renameAnimal(item.id, newValue)
                                        setIsEdit({id:"",flag:false})
                                      }
                                    }} />:
                                    <p onDoubleClick={()=>{
                                        setIsEdit({id:item.id,flag:true})
                                        setNewValue(item.animal)
                                    }}>{item.animal}</p>
                                }
                                </td>
                            <td>
                                <Button onClick={()=>{deleteAnimal(item.id)}} className='btn btn-danger'>Delete</Button>
                                <Button onClick={()=>{renameAnimal(item.id)}} className='btn btn-success'>Rename</Button>
                            </td>
                        </tr>
                        
                    ))
                }
            </tbody>
        </Table>
    </div>
  )
}
