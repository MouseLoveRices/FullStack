import { useState } from "react";
import Hook1 from "./hook/Hook1";
import Hook2 from "./hook/Hook2";
import Hook3 from "./hook/Hook3";
import Hook4 from "./hook/Hook4";
import API1 from "./hook/API1";
import Hook5 from "./hook/Hook5";
import ListApi from "./hook/ListApi";

function App() {
  const [show,setShow] = useState(true)
  return (
    <div>
        <Hook1/>
        <Hook2/>
        {
          show?<Hook3/>:"Hook 3 was unmounded"
        }       
        <Hook4/>
        <button onClick={()=> setShow(!show)}>SHOW HOOK 3</button>
        <API1/>
        <Hook5/>
        <ListApi/>
    </div>
  );
}

export default App;
