<template>
  <footer class="footer">
    <b-container class="p-4">
      <b-row>
        <b-col sm="6">
          <h5><b class="logo">EnjoyTrip</b></h5>
          <p>저희는 때때로 여행 중에 발생하는 문제들로 인해 즐거움을 방해되지 않기를 원합니다. 그래서 여행을 더욱 즐겁고 원활하게 즐기기 위한 솔루션을 제시해드리기 위한 사이트입니다.</p>
        </b-col>
        <b-col sm="6">
          <h5 class="text-uppercase "><b>Links</b></h5>
            <b-navbar-nav class="ml-auto footerLink">
              <b-nav-item class="footerLinkItem" to="/"><b>메인페이지</b></b-nav-item>
              <b-nav-item class="footerLinkItem" to="/main"><b>여행지</b></b-nav-item>
              <b-nav-item class="footerLinkItem" to="/board"><b>게시판</b></b-nav-item>
              <b-nav-item class="footerLinkItem" to="/about"><b>이용방법</b></b-nav-item>
            </b-navbar-nav>
        </b-col>
      </b-row>
    </b-container>
    
    
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: var(---color)">
      © 2023 Copyright:
      <a href="https://www.ssafy.com">Ssafy 9th_CodeTourist </a>
    </div>
    <!-- Copyright -->
  </footer>
</template>

<script>

export default {
  name: "FooterNav",
};
</script>

<style scoped>
.logo {
  font-family: EF_jejudoldam;
  margin-left: 45px;
  font-size: 30px;
  vertical-align: bottom;
  color: var(--main-color) !important;
}

.footer {
  margin-top: 5%;
  background-color: var(--white-color);
}
.footerLink {
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.footerLinkItem{
  margin: 0 5% 0 5%;
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
