import axios from "axios";

const postRequest = async (url, data, token = "") => {
  const axiosInstance = axios.create({
    baseURL: process.env.VUE_APP_API_BASE_URL,
    timeout: 5000, // Set a timeout for the request (in milliseconds)
    headers: {
      "Content-Type": "application/json", // Set the request content type
      Authorization: token,
    },
  });
  try {
    const response = await axiosInstance.post(url, data);
    return response.data;
  } catch (error) {
    // Handle error here
    console.error("POST request error:", error);
    throw error;
  }
};

export default postRequest;
