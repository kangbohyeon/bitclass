import React, { Component } from 'react';
import { Route } from "react-router-dom";

// css
import '../css/new.css';

// header
import HeaderAdmin from './Header/Header admin';

// footer
import Footer from './Footer/Footer';

// login
import LoginForm from './LoginForm';

//
import SoftwareList from './SoftwareToolsManage/SoftwareList';

class App extends Component {
  render () {
    return (
      <div className="App">
        <HeaderAdmin/> 
        <Route exact path='/' component={LoginForm} />
        <Route path='/SoftwareList' component={SoftwareList} />
        <Footer/>
      </div>
    );
  }
}

export default App;