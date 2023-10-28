import express from 'express';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import cors from 'cors';

const app = express();

app.use(bodyParser.json());

app.use(cors());

const userSchema = new mongoose.Schema({
    email: String,
    gender: String,
    username: String,
    pat: {
        type: String,
        required: false,
        default: null
    },
});

const UserDetails = mongoose.model('UserDetails', userSchema);

mongoose.connect('mongodb+srv://ShashwatPS:1@cluster0.1alkv6j.mongodb.net/Profile', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

app.post('/saveDetails', async (req, res) => {
    const { email,gender,username,pat = null} = req.body;
    const newUser = new UserDetails({email,gender,username,pat});
    newUser.save();
    res.status(200).json({message: "User Details Created Successfully"});
});

app.get('/getDetails',async(req,res)=>{
    const { email } = req.body;
    const user = await UserDetails.findOne({ email });
    res.status(200).json(user);
});

app.listen(5000, () => {
    console.log(`Server is running on port 3000`);
});