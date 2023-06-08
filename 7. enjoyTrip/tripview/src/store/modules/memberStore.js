import router from "@/router";
import postRequest from "@/util/api-post";
import getRequest from "@/util/api-get";
import putRequest from "@/util/api-put";

const memberStore = {
  namespaced: true,
  state: {
    token: null,
    userInfo: null,
  },
  mutations: {
    setToken(state, token) {
      state.token = token;
    },
    setUserInfo: (state, userInfo) => {
      state.userInfo = userInfo;
    },
  },
  actions: {
    login({ commit, dispatch }, { email, password }) {
      // 로그인 API 호출
      postRequest("user/login", { email, password })
        .then((responseData) => {
          // Handle response data
          // 토큰을 Vuex 스토어에 저장, // 로그인 성공 시 토큰을 받아온다고 가정 아직은 토큰이 없음
          commit("setToken", responseData);
          dispatch("getUserInfo", responseData);
          alert("로그인 성공");
          router.push("/main");
        })
        .catch((error) => {
          // Handle error
          console.error("Error:", error);
          alert("로그인 실패! 아이디와 패스워드를 다시 확인해보세요.");
        });
    },
    logout({ commit }) {
      // 로그아웃 로직
      // 토큰을 삭제하여 로그아웃 상태로 만듦
      commit("setToken", null);

      // 로그아웃 후에 필요한 다른 작업 수행
      alert("로그아웃되었습니다.");
      if (router.history.current.name !== "entry") {
        router.push({ name: "entry" });
      }
    },
    async getUserInfo({ commit }, token) {
      const email = JSON.parse(atob(token.split(".")[1])).email;
      const data = await getRequest(`${process.env.VUE_APP_API_BASE_URL}/user/${email}`, token);
      commit("setUserInfo", data);
    },
    async updateUser({ commit, state }, data) {
      const email = JSON.parse(atob(state.token.split(".")[1])).email;
      data.email = email;
      const response = await putRequest(`${process.env.VUE_APP_API_BASE_URL}/user`, data, this.state.token);
      commit("setUserInfo", data);
      return response;
    },
  },
};

export default memberStore;
