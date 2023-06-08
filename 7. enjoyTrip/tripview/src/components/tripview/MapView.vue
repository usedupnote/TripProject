<template>
  <div>
    <div v-show="naviInfo != null" class="info-block">
      거리 : {{ distance }} 미터<br />
      예상시간 : {{ duration }} 분
    </div>
    <div v-show="naviInfo != null" class="save-plan-btn" @click="savePlan">플랜 저장</div>
    <div id="map"></div>
  </div>
</template>

<script>
import tripInfos from "@/util/trip-infos";
import postRequest from "@/util/api-post";
import { mapState } from "vuex";

export default {
  name: "MapView",
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
  },
  data() {
    return {
      map: null,
      tripInfo: null,
      naviInfo: null,
      distance: null,
      duration: null,
    };
  },
  props: {
    selectedTripInfo: Object,
    naviInfoJson: Object,
  },
  watch: {
    selectedTripInfo: function (val) {
      if (this.selectedTripInfo != null) {
        this.naviInfo = null;
        this.tripInfo = val;
        this.loadMap();
      }
    },
    naviInfoJson: function (val) {
      this.naviInfo = val;
      this.loadNaviMap();
    },
  },
  mounted() {
    this.tripInfo = tripInfos.find((o) => o.location === this.$route.params.location);
    if (window.kakao && window.kakao.maps) {
      this.loadMap();
    } else {
      this.loadScript();
    }
  },
  methods: {
    savePlan() {
      if (this.token == null) {
        alert("로그인 후 저장 할 수 있습니다.");
        return;
      }
      const request = {
        userEmail: this.userInfo.email,
        naviInfo: JSON.stringify(this.naviInfo),
      };

      console.log(request);

      postRequest("plan", request).then((response) => {
        console.log(response);
        alert("계획이 저장되었습니다.");
      });
    },
    loadScript() {
      const script = document.createElement("script");
      script.src = `//dapi.kakao.com/v2/maps/sdk.js?appkey=${process.env.VUE_APP_KAKAO_MAP_KEY}&autoload=false`;
      script.onload = () => window.kakao.maps.load(this.loadMap);
      document.head.appendChild(script);
    },
    loadMap() {
      const container = document.getElementById("map");
      const options = {
        center: new window.kakao.maps.LatLng(this.tripInfo.lat, this.tripInfo.lng),
        level: 3,
      };
      this.map = new window.kakao.maps.Map(container, options);
      this.loadMarker();
    },
    loadMarker() {
      const markerPosition = new window.kakao.maps.LatLng(this.tripInfo.lat, this.tripInfo.lng);
      const marker = new window.kakao.maps.Marker({
        position: markerPosition,
      });

      marker.setMap(this.map);
    },
    loadNaviMap() {
      const result = this.naviInfo.routes[0];
      if (result.result_code != 0) {
        alert("경로를 찾을 수 없습니다.");
        return;
      }

      const origin = result.summary.origin;
      const destination = result.summary.destination;
      const waypoints = result.summary.waypoints;

      const container = document.getElementById("map");
      const options = {
        center: new window.kakao.maps.LatLng(origin.y, origin.x),
        level: 4,
      };
      this.map = new window.kakao.maps.Map(container, options);
      // 전체 검색 결과 거리(미터)
      this.distance = result.summary.distance;

      // 전체 검색 결과 이동 시간(초)
      this.duration = Math.round(result.summary.duration / 60);

      //구간별 경로 정보
      // 경유지가 존재할 경우 {경유지 수 + 1} 만큼의 섹션(경로 구간) 생성
      // (예: 경유지 수가 2개인 경우 총 3개의 섹션 정보가 생성,
      // section1: 출발지 → 경유지 1
      // section2: 경유지 1 → 경유지 2
      // section3: 경유지 2 → 목적지)
      const sections = result.sections;

      const markers = [];
      markers.push(
        new window.kakao.maps.InfoWindow({
          position: new window.kakao.maps.LatLng(origin.y, origin.x),
          content: `<div class="info-title">출발: ${origin.name}</div>`,
        })
      );
      waypoints.forEach((point) => {
        markers.push(
          new window.kakao.maps.InfoWindow({
            position: new window.kakao.maps.LatLng(point.y, point.x),
            content: `<div class="info-title">${point.name}</div>`,
          })
        );
      });
      markers.push(
        new window.kakao.maps.InfoWindow({
          position: new window.kakao.maps.LatLng(destination.y, destination.x),
          content: `<div class="info-title">도착: ${destination.name}</div>`,
        })
      );

      const vertexes = [];

      sections.forEach((section) => {
        section.roads.forEach((road) => {
          for (let i = 0; i < road.vertexes.length; i += 2) {
            const latLng = new window.kakao.maps.LatLng(road.vertexes[i + 1], road.vertexes[i]);
            vertexes.push(latLng);
          }
        });
      });

      const ployLine = new window.kakao.maps.Polyline({
        path: vertexes,
        strokeWeight: 5,
        strokeColor: "red",
        strokeOpacity: 0.7,
        strokeStyle: "solid",
      });

      ployLine.setMap(this.map);

      markers.forEach((marker) => {
        marker.setMap(this.map);
      });
    },
  },
};
</script>

<style>
.info-block {
  z-index: 1;
  font-weight: bold;
  padding: 100px;
  position: absolute;
  margin-top: 1%;
  margin-left: 17%;
  border-radius: 3px;
  padding: 10px;
  background-color: rgba(255, 255, 255, 0.7);
  text-align: left;
}

.save-plan-btn {
  z-index: 1;
  font-weight: bold;
  padding: 100px;
  position: absolute;
  margin-top: 5%;
  margin-left: 17%;
  border-radius: 3px;
  padding: 10px;
  background-color: var(--main-color);
  color: #fff;
  text-align: left;
}

.save-plan-btn:hover {
  cursor: pointer;
  background-color: blue;
}

.info-title {
  display: block;
  width: 225px;
  background: var(--highlight-color);
  color: #fff;
  text-align: center;
  height: 24px;
  line-height: 22px;
  border-radius: 4px;
  padding: 0px 10px;
}
</style>

<style scoped>
#map {
  position: fixed;
  height: 100vh;
  left: 16%;
  width: 68%;
}
</style>
