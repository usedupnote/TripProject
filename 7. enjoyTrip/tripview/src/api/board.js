import { apiInstance } from "./index.js";

const api = apiInstance();

function listArticle(success, fail) {
  api.get(`/board`).then(success).catch(fail);
}

function listPageArticle(page, success, fail) {
  api.get(`/board/page/${page}`).then(success).catch(fail);
}

function writeArticle(article, success, fail) {
  api.post(`/board`, JSON.stringify(article)).then(success).catch(fail);
}

function getArticle(id, success, fail) {
  api.get(`/board/${id}`).then(success).catch(fail);
}

function modifyArticle(article, success, fail) {
  api.put(`/board`, JSON.stringify(article)).then(success).catch(fail);
}

function updateArticleCount(id, success, fail) {
  api.put(`/board/view-count/${id}`).then(success).catch(fail);
}

function deleteArticle(id, success, fail) {
  api.delete(`/board/${id}`).then(success).catch(fail);
}

function selectBoardByCategory(categoryno, success, fail) {
  api.get(`/board/category/${categoryno}`).then(success).then(fail);
}

function selectAllCategory(success, fail) {
  api.get("/category").then(success).catch(fail);
}

function selectCategoryByName(name, success, fail) {
  api.get(`/category/byname/${name}`).then(success).catch(fail);
}

function selectCategoryById(id, success, fail) {
  api.get(`/category/byid/${id}`).then(success).catch(fail);
}
function getAllStaredBoardByUserEmail(email, success, fail) {
  api.get(`/board/category/star/${email}`).then(success).catch(fail);
}

export {
  listArticle,
  listPageArticle,
  writeArticle,
  getArticle,
  modifyArticle,
  deleteArticle,
  updateArticleCount,
  selectBoardByCategory,
  selectAllCategory,
  selectCategoryByName,
  selectCategoryById,
  getAllStaredBoardByUserEmail,
};
