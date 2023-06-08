const planStore = {
  namespaced: true,
  state: {
    plans: [],
  },
  mutations: {
    appendPlan: (state, plan) => {
      const contains = state.plans.find((p) => p.name === plan.name);
      if (contains) {
        alert("이미 추가되었습니다.");
        return;
      }
      state.plans.push(plan);
    },
    removePlan: (state, plan) => {
      state.plans = state.plans.filter((p) => p.name != plan.name);
    },
    removeAllPlans: (state) => {
      state.plans = [];
    },
  },
};

export default planStore;
