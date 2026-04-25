import axios from 'axios';

export default axios.create({
    baseURL: 'http://172.214.28.235:8080',
    headers: {
        'Content-Type': 'application/json',
    },
});
