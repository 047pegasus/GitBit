import { useState } from 'react'
import { RecoilRoot, useSetRecoilState} from 'recoil';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Checkout from './components/Checkout';
import './App.css'

function App() {

  return (
    <RecoilRoot>
        <div>
                <Router>
                  {/* <ActiveUser/> */}
                    <Routes>
                        <Route path={"/"} element={<Checkout/>}/>
                    </Routes>
                </Router>
            </div>
      </RecoilRoot>
  )
}

export default App
