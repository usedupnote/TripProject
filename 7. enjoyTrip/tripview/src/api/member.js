import { apiInstance } from "./index.js";

const api = apiInstance();

function createUser(article, success, fail) {
  api.post(`/user`, JSON.stringify(article)).then(success).catch(fail);
}

// (start) 구현해야할 기능 -- backend (get-user-list)
function selectAllUser(success, fail) {
  api.get(`/user`).then(success).catch(fail);
}
// (end) 구현해야할 기능 -- backend (get-user-list)

async function findByEmail(email, success, fail) {
  api.defaults.headers["access-token"] = sessionStorage.getItem("access-token");
  console.log(email);
  await api.get(`/user/${email}`).then(success).catch(fail);
}

async function tokenRegeneration(user, success, fail) {
  api.defaults.headers["refresh-token"] = sessionStorage.getItem("refresh-token"); //axios header에 refresh-token 셋팅
  await api.post(`/user/refresh`, user).then(success).catch(fail);
}

export { createUser, selectAllUser, findByEmail, tokenRegeneration };
