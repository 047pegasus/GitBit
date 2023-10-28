import express from 'express';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import cors from 'cors';

const app = express();

app.use(bodyParser.json());

app.use(cors());

const userSchema = new mongoose.Schema({
    email: String,
});

const HTMUser = mongoose.model('HTMUser', userSchema);

mongoose.connect('mongodb+srv://ShashwatPS:1@cluster0.1alkv6j.mongodb.net/HTMUsers', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

app.post('/check', async (req, res) => {
    const { email } = req.body;

    try {
        const cuser = await HTMUser.findOne({ email });

        if (cuser) {
            res.status(403).json({ message: 'Exists' });
        } else {
            const newUser = new HTMUser({ email });
            await newUser.save();
            res.json({ message: 'New Created'});
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});

app.listen(5001, () => {
    console.log(`Server is running on port 5001`);
});