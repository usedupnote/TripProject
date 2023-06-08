import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";

//============ store 연결 ============
import boardStore from "@/store/modules/boardStore";
import memberStore from "@/store/modules/memberStore";
import planStore from "@/store/modules/planStore";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    boardStore,
    memberStore,
    planStore,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: sessionStorage,
    }),
  ],
});
