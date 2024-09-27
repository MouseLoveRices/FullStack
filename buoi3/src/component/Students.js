import React, { useEffect, useState } from 'react'
import { Container, ListGroup } from 'reactstrap'
import Add from './Add'
import Student from './Student'
import Footer from './Footer'
import './style.css'

export default function Students() {
    const [flag, setFlag] =useState("")
    const [checkALL,setCheckALL] = useState(false) 
    const [list,setList] = useState([
        {
            id:1,
            name:"Le Meo",
            checked:false
        },
        {
            id:2,
            name:"Le Tho",
            checked:true
        },
        {
            id:3,
            name:"Le Nai",
            checked:false
        },
        {
            id:4,
            name:"Le Gau",
            checked:false
        },
        {
            id:5,
            name:"Le Chuot",
            checked:false
        }
    ])
    useEffect(()=>{
        if(localStorage.getItem("list")){
            setList(JSON.parse(localStorage.getItem("list")))
        }
    },[]) // useEffect dung de load duy nhat 1 lan
    const deleteById=(id)=>{
        let newList= list.filter(stud=>stud.id!==id)
        setList(newList)
        localStorage.setItem("list",JSON.stringify(newList))
    }
    const reChecked=(id)=>{
        let newList = list.map((stud=>stud.id===id?{...stud,checked:!stud.checked}:stud))
        setList(newList)
        localStorage.setItem("list",JSON.stringify(newList))
    }
    const checkId=(id)=>{
        if(id>list.length){
            id++
            return id
        }else if(id<1){
            return id=1
        }

    }
    const addNewStudent=(name)=>{       
        let newList = [...list,{id:checkId,name:name}]
        setList(newList)
        localStorage.setItem("list",JSON.stringify(newList))
    }
    const rename=(id,name)=>{
        let newList = list.map(stud=>stud.id===id?{...stud,name:name}:stud)
        setList(newList) // list=newList
        localStorage.setItem("list",JSON.stringify(newList))
    }
    const filterStudents=(list,flag)=>{
        if(flag=="CHECK"){
            return list.filter(stud=>stud.checked)
        }else if(flag=="NOCHECK"){
            return list.filter(stud=>!stud.checked)
        }else if(flag=="DELETEALL"){
            let newList = list.map(stud => stud.checked ? { ...stud, checked: false } : stud)
            setList(newList)
            setFlag("")
            localStorage.setItem("list",JSON.stringify(newList)) 
            return newList
        }else if(flag=="CHECKALL"){
            let newList = list.map(student=>({...student,checked:!checkALL}))
            setList(newList)
            localStorage.setItem("list",JSON.stringify(newList))
            setCheckALL(!checkALL)
            setFlag("") 
        }   
        return list 
    }
    return (
    <div>
        <Container className='p-5 my-5'>
            <h1>Student List</h1>
            <Add addNewStudent={addNewStudent}/>
            <ListGroup>
                {
                    filterStudents(list,flag).map((stud,index)=>(<Student key={index} student={stud} deleteById={deleteById} reChecked={reChecked} rename={rename}/>))
                }
            </ListGroup>
            <Footer setFlag={setFlag} setcheckALL={setCheckALL}/>
        </Container>
    </div>
  )
}
