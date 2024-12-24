const express = require('express');
const cors = require('cors');
const axios = require('axios');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));

const API_TOKEN = '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';

app.post('/api/detect', async (req, res) => {
    try {
        const { input } = req.body;
        if (!input || input.trim().length === 0) {
            return res.status(400).json({ error: 'Input text is required' });
        }
        
        const response = await axios.post(
            'https://api-inference.huggingface.co/models/Hello-SimpleAI/chatgpt-detector-roberta',
            { inputs: input },
            {
                headers: {
                    'Authorization': `Bearer ${API_TOKEN}`,
                    'Content-Type': 'application/json'
                }
            }
        );

        // Extract the prediction scores
        const predictions = response.data[0];
        console.log('Raw predictions:', predictions);

        // Find the prediction with the highest score
        let highestScore = 0;
        let predictedType = '';

        predictions.forEach(pred => {
            if (pred.score > highestScore) {
                highestScore = pred.score;
                predictedType = pred.label;
            }
        });

        // Convert score to percentage and determine type
        const percentage = Math.round(highestScore * 100);
        const type = predictedType === 'ChatGPT' ? 'AI' : 'HUMAN';

        console.log('Final result:', { type, percentage });

        res.json({
            type: type,
            percentage: percentage
        });

    } catch (error) {
        console.error('Error:', error.response?.data || error.message);
        res.status(500).json({ error: 'Analysis failed' });
    }
});

app.get('/', (req, res) => {
    res.sendFile('index.html');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
