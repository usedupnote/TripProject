import axios from "axios";

const putRequest = async (url, data, token = "") => {
  const axiosInstance = axios.create({
    baseURL: process.env.VUE_APP_API_BASE_URL,
    timeout: 5000, // Set a timeout for the request (in milliseconds)
    headers: {
      "Content-Type": "application/json", // Set the request content type
      Authorization: token,
    },
  });
  try {
    const response = await axiosInstance.put(url, data);
    return response.data;
  } catch (error) {
    // Handle error here
    console.error("PUT request error:", error);
    throw error;
  }
};

export default putRequest;
