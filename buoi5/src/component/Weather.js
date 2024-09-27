import axios from 'axios'
import React, { useEffect, useState } from 'react'
import './weather.css'

export default function Weather() {
    const[data,setData] = useState(null)
    const[city,setCity]= useState("Ho Chi Minh")
    const[text,setText]= useState("")
    
    const APIkey = "5559ac8e1c24efb740f76dbe2daa45e3"
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${APIkey}`
    const fetchData =()=>{
        axios.get(url)
        .then((res)=>{
            setData(res.data)
        })
        .catch((error)=>{
            console.log(error)       
        })
    }
    const convertUnixToTime = (unixTimestamp) => {
        const date = new Date(unixTimestamp * 1000);
        return date.toLocaleString();
    }
    useEffect(()=>{
        fetchData()
    },[city])
    return (
    <div className='contain'>
        <h1 className='title'>Weather App</h1>
        <input type="text" value={text} placeholder='Type a name of City' onChange={(e)=>{setText(e.target.value)}} onKeyDown={(e)=>{
            if(e.key === "Enter"){
                setCity(text)
                setText("")
            }
        }}/>

        {
           
            data&&
            <div className='res'> 
                <h1>Country: <span>{data.sys.country}</span></h1>              
                <h2>City: <span>{data.name}</span></h2>  
                <h2>Temp: <span>{data.main.temp}</span></h2>   
                <h2>Sunrise: <span>{convertUnixToTime(data.sys.sunrise)}</span></h2>
                <h2>Sunset: <span>{convertUnixToTime(data.sys.sunset)}</span></h2>                          
                <h2>Weather: <span>{data.weather[0].main} </span></h2>     
                <img src={`http://openweathermap.org/img/w/${data.weather[0].icon}.png`}/>                     
            </div>
        }
    </div>
  )
}
