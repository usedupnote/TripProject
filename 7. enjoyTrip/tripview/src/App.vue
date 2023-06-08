<template>
  <div id="app">
    <header-nav />
    <router-view />
    <footer-nav v-if="!excludePage.includes($route.name)" />
  </div>
</template>

<script>
import HeaderNav from "./components/common/HeaderNav.vue";
import FooterNav from "./components/common/Footer.vue";
export default {
  data() {
    return {
      transparNav: false,
      excludePage: ["trip", "entry"],
    };
  },
  components: {
    HeaderNav,
    FooterNav,
  },
};
</script>

<style>
@font-face {
  font-family: "NanumSquareNeo-Variable";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2")
    format("woff2");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "EF_jejudoldam";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_jejudoldam.woff2") format("woff2");
  font-weight: normal;
  font-style: normal;
}
body {
  padding-top: 60px;
}
@media (max-width: 979px) {
  body {
    padding-top: 0px;
  }
}

:root {
  /* Palette */
  --white-color: #fff;
  --main-color: #8294c4;
  --highlight-color: #425494;
  --gray-color: rgba(155, 155, 155, 0.7);
  --transpar-color: rgba(0, 0, 0, 0);
}
#app {
  font-family: NanumSquareNeo-Variable, Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
  background-color: var(--main-color);
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}

/* .transparNav {
  background-color: var(--transpar-color);
} */
</style>
