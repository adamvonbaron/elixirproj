import axios from "axios";

const instance: any = axios.create({
  baseURL: "https://localhost:4001/api",
});

export default instance;
