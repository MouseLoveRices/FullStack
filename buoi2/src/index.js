import React from 'react';
import ReactDom from 'react-dom/client';
import App from './App';


const root = ReactDom.createRoot(document.getElementById('root'));

root.render(
   // <React.StrictMode> => dung de debug, khi console log se in 2 lan
        <App/>
      
    //</React.StrictMode>

    
)
