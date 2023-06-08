import { apiInstance } from "./index.js";

const api = apiInstance();

function createStar(star, success, fail) {
  api.post(`/star/create`, JSON.stringify(star)).then(success).catch(fail);
}
function deleteStar(star, success, fail) {
  api.post(`/star/delete`, JSON.stringify(star)).then(success).catch(fail);
}
function selectAll(success, fail) {
  api.get(`/star/selectAll`).then(success).catch(fail);
}
function selectAllByEmail(email, success, fail) {
  api.get(`/star/selectAllByEmail/${email}`).then(success).catch(fail);
}
function selectAllByBoardId(board_id, success, fail) {
  api.get(`/star/selectAllByBoardId/${board_id}`).then(success).catch(fail);
}

export { createStar, deleteStar, selectAll, selectAllByEmail, selectAllByBoardId };
