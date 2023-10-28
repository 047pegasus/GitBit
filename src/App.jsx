// import './App.css'
import { useState , useEffect } from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { LandingPage } from './Components/LandingPage';
import { RecoilRoot, useSetRecoilState} from 'recoil';
import axios from 'axios';
import Gsoc from "./Components/Gsoc.jsx";
import Trending from "./Components/Trending.jsx";
import DataFill from "./Components/DataFill.jsx";
import Dashboard from "./Components/Dashboard.jsx";
import ForestFarmer from "./Components/ForestFarmer.jsx";
import Loading from "./Components/Loading.jsx";
import Tools from './Components/Tools';
function App() {

  return (
    <RecoilRoot>
        <div>
            <Router>
                  {/* <ActiveUser/> */}
                    <Routes>
                        <Route path={"/Gsoc"} element={<Gsoc/>}/>
                        <Route path={"/Trending"} element={<Trending/>}/>
                        <Route path={"/"} element={<LandingPage/>}/>
                        <Route path={"/DataFill"} element={<DataFill/>}/>
                        <Route path={"/dashboard"} element={<Dashboard/>}/>
                        <Route path={"/forest"} element={<ForestFarmer/>}/>
                        <Route path={"/loading"} element={<Loading/>}/>
                        <Route path={"/tools"} element={<Tools/>}/>
                    </Routes>
                </Router>
            </div>
      </RecoilRoot>
  )
}

function ActiveUser() {
    const setUser = useSetRecoilState(userState);
    const AU = async() => {
        try {
            const response = axios.get("http://localhost:3000/me",{
                headers: {
                    Authorization: `Bearer ${localStorage.getItem("token")}`,
                }
            })

            if (response.data.username) {
                setUser({
                    isLoading: false,
                    userEmail: response.data.username
                })
            } else {
                setUser({
                    isLoading: false,
                    userEmail: null
                })
            }
        } catch (e) {

            setUser({
                isLoading: false,
                userEmail: null
            })
        }
    };

    useEffect(() => {
        AU();
    }, []);

    return <></>
}

export default App
