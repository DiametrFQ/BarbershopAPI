import axios from "axios";

const $host = axios.create({
    baseURL: import.meta.env.VITE_REACT_APP_API_URL
})

const $autHost = axios.create({
    baseURL: import.meta.env.VITE_REACT_APP_API_URL
})

export {
    $host,
    $autHost
}