import { account } from "../Backend/appwriteConfig.js";
import {Button} from "@mui/material";
import {useState} from "react";

export default function Dashboard(){
    const[email,setEmail] = useState('Initial');
    async function Mail(){
        const promise = account.get();

        promise.then(function (response) {
            setEmail(response.email);
        }, function (error) {
            console.log(error); // Failure
        });
    }

    return(
        <div>
            <h1>This is the Dashboard</h1>
            <Button onClick={Mail}>Check</Button>
            <h1 style={{
                color: 'white',
            }}>{email}</h1>
        </div>
    )
}