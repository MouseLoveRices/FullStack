import React from 'react'
import { Button, Input } from 'reactstrap'

export default function Footer(props) {
  const{setFlag,checkALL}=props
  return (
    <div className='my-3'>
      <Input type="checkbox" checked={checkALL} onChange={()=>setFlag("CHECKALL")}/>
      <Button className='footerBtn' onClick={()=>setFlag("CHECK")}>filter check</Button>
      <Button className='footerBtn' onClick={()=>setFlag("NOCHECK")}>fliter no check</Button>
      <Button className='footerBtn' onClick={()=>setFlag("")}>Clear filter</Button>
      <Button className='footerBtn' onClick={()=>setFlag("DELETEALL")}>Delete all</Button>
    
    </div>
  )
}
