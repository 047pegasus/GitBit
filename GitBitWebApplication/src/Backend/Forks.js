import { Octokit } from '@octokit/rest';
import axios from 'axios';
import express from 'express';
import mongoose from 'mongoose';
import bodyParser from 'body-parser';
import cors from 'cors';

const app = express();
const port = 5004;

app.use(bodyParser.json());
app.use(cors())

mongoose.connect('mongodb+srv://ShashwatPS:1@cluster0.1alkv6j.mongodb.net/Forked', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const ForkedSchema = new mongoose.Schema({
    Name: String,
    Forks: [],
});

const Forked = mongoose.model('Forked', ForkedSchema);

async function getAllRepoNames(username) {
    try {
        const apiUrl = `https://api.github.com/users/${username}/repos`;
        const response = await axios.get(apiUrl);
        const repositories = response.data;

        const repoNames = repositories.map(repo => repo.name);

        console.log(`Repository names for ${username}:`, repoNames);

        return repoNames;
    } catch (error) {
        console.error('Error:', error.message);
        return [];
    }
}

app.post('/update-forks', async (req, res) => {
    const { username, authtoken } = req.body;

    const octokit = new Octokit({
        auth: authtoken,
    });

    try {
        const repoNames = await getAllRepoNames(username);

        const existingUser = await Forked.findOne({ Name: username });

        if (existingUser) {
            await Forked.updateOne({ Name: username }, { Forks: repoNames });
            res.status(200).json({ message: `Updated Forks for user ${username} in the database.` });
        } else {
            const newUser = new Forked({ Name: username, Forks: repoNames });
            await newUser.save();
            res.status(201).json({ message: `Saved Forks for a new user ${username} in the database.` });
        }
    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
