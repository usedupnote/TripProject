<template>
  <div class="left-side-bar">
    <div class="location-name">{{ this.$route.params.location }} - {{ this.tripInfo.province }}</div>
    <div class="meta">{{ this.tripInfo.detail }}</div>
    <hr />
    <div class="my-plan">나의 플랜</div>
    <div class="card-container">
      <b-card
        class="card"
        v-for="(data, index) in plans"
        @click="emitData(data)"
        :key="index"
        img-height="80px"
        img-width="80px"
        :img-src="data.imgSrc"
        img-alt="Card image"
        img-left
      >
        <b-card-text> {{ data.name }} </b-card-text>
        <p style="text-align: right">
          <b-btn
            :class="['start-btn', start != null && data.name === start.name ? 'selected' : '']"
            @click="start = data"
            >출발지</b-btn
          >
          <b-btn :class="['dest-btn', dest != null && data.name === dest.name ? 'selected' : '']" @click="dest = data"
            >도착지</b-btn
          >
          <b-icon v-b-modal="`${data.name}-modal`" class="clickable info-icon" icon="info-circle"></b-icon>
        </p>
      </b-card>
    </div>
    <div class="btn-container">
      <b-button class="plan-confirm-btn" @click="confirmPlan">경로 생성</b-button>
      <b-button class="remove-btn" @click="removePlan">전부 제거</b-button>
    </div>
  </div>
</template>

<script>
import tripInfos from "@/util/trip-infos";
import postRequest from "@/util/api-post";
import { mapState, mapMutations } from "vuex";

export default {
  name: "LeftSideBar",
  data() {
    return {
      tripInfo: null,
      start: null,
      dest: null,
    };
  },
  computed: {
    ...mapState("planStore", ["plans"]),
  },
  methods: {
    ...mapMutations("planStore", ["removeAllPlans"]),
    emitData(data) {
      this.$emit("tripData", data);
    },
    removePlan() {
      this.removeAllPlans();
    },
    confirmPlan() {
      if (this.start == null || this.dest == null) {
        alert("출발지와 도착지를 선택해주세요!");
        return;
      }
      if (this.start == this.dest) {
        alert("출발지와 도착지가 같습니다.");
        return;
      }
      const waypoints = [];
      this.plans.forEach((plan) => {
        if (plan.name != this.start.name && plan.name != this.dest.name) {
          waypoints.push({
            name: plan.name,
            x: plan.lng,
            y: plan.lat,
          });
        }
      });

      const wayPointJson = JSON.stringify(waypoints);

      const data = `{
      "origin": {
          "name" : "${this.start.name}",
          "x": "${this.start.lng}",
          "y": "${this.start.lat}"
      },
      "destination": {
          "name" : "${this.dest.name}",
          "x": "${this.dest.lng}",
          "y": "${this.dest.lat}"
      },
      "waypoints": ${wayPointJson},
      "priority": "RECOMMEND",
      "car_fuel": "GASOLINE",
      "car_hipass": false,
      "alternatives": false,
      "road_details": false
      }`;

      postRequest(`${process.env.VUE_APP_KAKAO_NAVI_URL}`, data, `${process.env.VUE_APP_KAKAO_NAVI_REST}`).then(
        (responseData) => {
          this.$emit("naviData", responseData);
        }
      );
    },
  },
  created() {
    tripInfos.forEach((info) => {
      if (info.location === this.$route.params.location) {
        this.tripInfo = info;
        return;
      }
    });
  },
};
</script>

<style scoped>
.selected {
  border-color: var(--main-color);
  background-color: var(--main-color);
}

.start-btn,
.dest-btn {
  height: 30px;
  font-size: 12px;
  vertical-align: top;
  margin-right: 0.2rem;
  margin-left: 0.2rem;
}

.info-icon {
  margin-left: 0.2rem;
  vertical-align: -6px;
}
.btn-container {
  margin-top: 0.5rem;
  margin-bottom: 0.5rem;
}
.plan-confirm-btn,
.remove-btn {
  margin-left: 0.2rem;
  margin-right: 0.2rem;
}
.plan-confirm-btn {
  border: 0px;
  background-color: var(--main-color);
}

.plan-confirm-btn:active,
.plan-confirm-btn:focus {
  background-color: blue !important;
  box-shadow: none !important;
}

.remove-btn {
  border: 0px;
  background-color: #ed544a;
}

.remove-btn:active,
.remove-btn:focus {
  background-color: red !important;
  box-shadow: none !important;
}

.meta {
  margin: 10px;
  font-size: 0.75rem;
  color: gray;
}
.my-plan {
  margin-top: 18px;
}

.card-container {
  animation: fadeInUp 1s;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateZ(0);
  }
}

.location-name {
  color: var(--highlight-color);
  font-weight: bolder;
  margin-top: 15px;
  font-size: x-large;
}
.left-side-bar {
  color: var(--highlight-color);
  background-color: var(--white-color);
  position: fixed;
  height: 100vh;
  width: 16%;
}

.card {
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  margin: 16px 8px;
  transition: transform 0.3s;
}

.card:hover {
  transform: scale(1.02);
}

.card-body {
  flex: 1 1 auto;
  height: 50px;
  padding-top: 8px;
  padding-left: 12px;
  text-align: left;
}

:focus {
  outline: none;
}

.clickable:hover {
  cursor: pointer;
}
</style>
