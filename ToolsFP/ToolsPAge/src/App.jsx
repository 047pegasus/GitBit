import { useState } from 'react'
import "./css/tools.css"
import { RecoilRoot, useSetRecoilState} from 'recoil';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Tools } from './Components/Tools';

function App() {

  return (
    <div>
      <RecoilRoot>
        <div>
                <Router>
                  {/* <ActiveUser/> */}
                    <Routes>
                        <Route path={"/"} element={<Tools/>}/>
                    </Routes>
                </Router>
            </div>
      </RecoilRoot>
    </div>
  )
}

export default App
