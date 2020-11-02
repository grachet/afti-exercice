import React from 'react';
import './App.css';
import List from './component/List';

function App() {
  return (
    <div className="App">
      <List list={["My button", "My second button", "My third button"]} />
    </div >
  );
}

export default App;
