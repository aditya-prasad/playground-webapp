import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

ReactDOM.render(
    <div>
        <h1>Hello, Karthik!!</h1>
        <p>Environment: {window.config["env"]}</p>
    </div>,
    document.getElementById('root')
);