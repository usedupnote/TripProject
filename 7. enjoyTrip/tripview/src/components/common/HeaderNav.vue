<template>
  <b-navbar :class="['nav fixed-top']" toggleable="lg">
    <b-navbar-brand to="/">
      <!-- <b-img
          height="60%"
          src="https://github.com/usedupnote/usedupnote/assets/59154924/e90fdf32-44dc-4340-bb37-a2d8545146e1"
        ></b-img> -->
      <b class="logo">EnjoyTrip</b>
      <vue-typer
        class="mini"
        :text="['당신의 즐거운 여행을 위한 솔루션']"
        :repeat="Infinity"
        :shuffle="false"
        initial-action="typing"
        :pre-type-delay="70"
        :type-delay="70"
        :pre-erase-delay="2000"
        :erase-delay="250"
        erase-style="backspace"
        :erase-on-complete="true"
        caret-animation="blink"
      ></vue-typer>
    </b-navbar-brand>

    <b-navbar-nav class="ml-auto">
      <b-navbar-toggle target="nav-collapse"> </b-navbar-toggle>
      <b-collapse is-nav
        ><b-nav-item class="custom-nav-item" to="/main"><b>여행지</b></b-nav-item>
        <b-nav-item class="custom-nav-item" to="/board"><b>게시판</b></b-nav-item>
        <b-nav-item class="custom-nav-item" to="/about"><b>이용방법</b></b-nav-item>
        <b-nav-item class="custom-nav-item" v-if="token == null" to="/login"><b>로그인</b></b-nav-item>
        <b-nav-item-dropdown class="custom-nav-item" no-caret v-else right>
          <!-- Using 'button-content' slot -->
          <template #button-content>
            <img v-if="userInfo.img == null" class="profile-image" src="@/assets/default_profile.jpg" />
            <img v-else class="profile-image" :src="userInfo.img" />
          </template>
          <b-dropdown-item to="/mypage">마이페이지</b-dropdown-item>
          <b-dropdown-item to="/myplan">나의 여행계획</b-dropdown-item>
          <b-dropdown-item @click="handleLogout">로그아웃</b-dropdown-item>
        </b-nav-item-dropdown></b-collapse
      >
    </b-navbar-nav>
  </b-navbar>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "HeaderNav",
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
  },
  methods: {
    ...mapActions("memberStore", ["logout"]),
    handleLogout() {
      this.logout();
    },
  },
};
</script>

<style>
.dropdown-item:active {
  color: white !important;
  background-color: var(--main-color) !important;
}

.dropdown-item {
  color: gray !important;
}
</style>

<style scoped>
a.dropdown-item {
  color: rgba(0, 0, 0, 0.5);
}

.logo {
  font-family: EF_jejudoldam;
  margin-left: 45px;
  font-size: 30px;
  vertical-align: bottom;
  color: var(--main-color) !important;
}

.profile-image {
  border-radius: 30px;
  width: 30px;
  height: 30px;
  object-fit: cover;
}

.nav {
  background-color: var(--white-color);
}
.mini {
  margin-left: 5px;
  font-size: 13px;
  vertical-align: bottom;
  color: var(--main-color);
}
</style>

<style>
.vue-typer .custom.char.typed {
  color: var(--main-color);
}

.vue-typer .custom.char.selected {
  background-color: var(--white-color);
}

.vue-typer .custom.caret {
  width: 5px;
  background-color: var(--main-color);
}
</style>
