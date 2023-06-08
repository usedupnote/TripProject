<template>
  <div class="trip">
    <left-side-bar @tripData="changeMap" @naviData="changeNaviData" />
    <map-view :selectedTripInfo="tripData" :naviInfoJson="naviData" />
    <right-side-bar @tripData="changeMap" />
  </div>
</template>

<script>
import MapView from "@/components/tripview/MapView.vue";
import LeftSideBar from "@/components/tripview/LeftSideBar.vue";
import RightSideBar from "@/components/tripview/RightSideBar.vue";

export default {
  name: "TripView",
  components: { MapView, LeftSideBar, RightSideBar },
  data() {
    return {
      tripData: null,
      naviData: null,
    };
  },
  methods: {
    changeMap(data) {
      this.tripData = data;
    },
    changeNaviData(data) {
      console.log(data);
      this.naviData = data;
    },
  },
};
</script>

<css></css>
