import axios from 'axios';

export default axios.create({
    baseURL: 'https://api.devopsbliss.online',
    headers: {
        'Content-Type': 'application/json',
    },
});
