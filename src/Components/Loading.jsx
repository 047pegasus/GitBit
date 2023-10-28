import { StaticNavBar } from "./Navbar.jsx";
import {useState} from "react";

const Loading = () => {
    const [mail,setMail] = useState('');
    function getValue() {
        var emailInput = document.getElementById('emailInput');
        var emailValue = emailInput.value;
        setMail(emailValue);
    }



    return (
        <div>
            <StaticNavBar/>
        <div
            style={{
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'center',
                alignItems: 'center',
                height: '100vh',
                background: '#0d1117',
                color: '#c9d1d9',
            }}
        >
            <div
                style={{
                    marginTop: '20px',
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                }}
            >
                <label
                    htmlFor="emailInput"
                    style={{
                        marginBottom: '8px',
                    }}
                >
                    Enter your email:
                </label>
                <input
                    type="email"
                    id="emailInput"
                    style={{
                        padding: '8px',
                        borderRadius: '4px',
                        border: '1px solid #58a6ff',
                        outline: 'none',
                        marginRight: '8px',
                    }}
                />
                <button
                    style={{
                        padding: '8px',
                        borderRadius: '4px',
                        background: '#58a6ff',
                        color: '#ffffff',
                        border: 'none',
                        cursor: 'pointer',
                        outline: 'none',
                        marginTop: '10px'
                    }}
                    onClick={getValue}
                >
                    Let's Go
                </button>
            </div>
        </div>
        </div>
    );
};

export default Loading;