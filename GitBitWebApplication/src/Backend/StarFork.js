import express from 'express';
import mongoose from 'mongoose';
import axios from 'axios';
import cors from 'cors';

const app = express();
const port = 5006;

app.use(express.json());

app.use(cors());

const DataSchema = new mongoose.Schema({
    Stars: String,
    Forks: Number,
    Username: { type: String, unique: true },
});

const User = mongoose.model('User', DataSchema);

mongoose.connect('mongodb+srv://ShashwatPS:1@cluster0.1alkv6j.mongodb.net/ForkStars', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

app.post('/data', async (req, res) => {
    try {
        const { username } = req.body;
        let user = await User.findOne({ Username: username });
        if (user) {
            const githubApiResponse = await axios.get(`https://api.github-star-counter.workers.dev/user/${username}`);
            const { stars, forks } = githubApiResponse.data;

            user.Stars = stars;
            user.Forks = forks;

            await user.save();
        } else {
            const githubApiResponse = await axios.get(`https://api.github-star-counter.workers.dev/user/${username}`);
            const { stars, forks } = githubApiResponse.data;

            const newLead = new User({
                Stars: stars,
                Forks: forks,
                Username: username,
            });

            await newLead.save();
        }

        res.status(201).json({ success: true, message: 'Data saved/updated successfully!' });
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({ success: false, message: 'Internal server error' });
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
