<template>
  <div>
    <div class="my-plan d-flex justify-content-center align-items-center" style="height: 80vh">
      <div class="mx-auto" style="width: 300px">
        <div class="text">나의 계획</div>
        <div v-if="plans == null || plans.length == 0">저장된 계획이 없습니다!</div>
        <div class="plan" v-for="plan in plans" :key="plan.id" @click="selectedPlan = plan.route">
          <div>
            <div>총 이동거리: {{ plan.route.routes[0].summary.distance }} 미터</div>
            <div>총 예상 이동시간 : {{ Math.round(plan.route.routes[0].summary.duration / 60) }} 분</div>
            출발지 : {{ plan.route.routes[0].summary.origin.name }} <br />
            목적지 : {{ plan.route.routes[0].summary.destination.name }}
            <div>경유지들</div>
            <div v-for="(waypoint, idx) in plan.route.routes[0].summary.waypoints" :key="idx">
              {{ waypoint.name }}
            </div>
          </div>
          <b-button class="del-btn" variant="danger" @click="del(plan.id)">삭제</b-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import getRequest from "@/util/api-get";
import delRequest from "@/util/api-del";

export default {
  name: "MyPlanView",
  data() {
    return {
      plans: [],
      selectedPlan: null,
    };
  },
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
  },
  methods: {
    del(id) {
      console.log(id);
      delRequest(`${process.env.VUE_APP_API_BASE_URL}/plan/${id}`, this.token).then(() => {
        alert("삭제되었습니다.");
        this.plans = [];
        getRequest(`${process.env.VUE_APP_API_BASE_URL}/plan?email=${this.userInfo.email}`, this.token).then(
          (responseData) => {
            if (responseData == null || responseData.length == 0) {
              return;
            }
            responseData.forEach((resp) => {
              this.plans.push({
                id: resp.id,
                route: JSON.parse(resp.naviInfo),
              });
            });
          }
        );
      });
    },
  },
  created() {
    getRequest(`${process.env.VUE_APP_API_BASE_URL}/plan?email=${this.userInfo.email}`, this.token).then(
      (responseData) => {
        if (responseData == null || responseData.length == 0) {
          return;
        }
        responseData.forEach((resp) => {
          this.plans.push({
            id: resp.id,
            route: JSON.parse(resp.naviInfo),
          });
        });
      }
    );
  },
};
</script>

<style scoped>
.del-btn {
  margin: 0.1rem;
}

.text {
  color: var(--main-color);
  font-size: 2.5rem;
}

.plan {
  border-radius: 3px;
  color: white;
  background-color: rgba(0, 0, 255, 0.4);
  margin: 01rem;
}
</style>
