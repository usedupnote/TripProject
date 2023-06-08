<template>
  <div class="about">
    <div class="section">
      <b-img :src="require(`@/assets/images/about/about1.jpg`)" class="aboutImg"></b-img>
      <div class="aboutImgExp">
        <h2><b>혼자서 하지만 함께하는 여행!</b></h2>
        <br />
        <p>
          (sample) 함께하는 사람들과의 여행 계획을 세우는 것도 즐거운 경험이 될 수 있습니다. 함께하는 여행은 협력과
          의사소통을 통해 새로운 추억을 만들고 깊은 연결을 형성하는 기회를 제공합니다. 이제 함께하는 여행을 계획하는
          방법에 대해 알아보겠습니다.
        </p>
      </div>
    </div>
    <div class="section">
      <div class="aboutImgExp">
        <h2><b>전국 팔도 다양한 관광지를 한번에!</b></h2>
        <br />
        <p>
          한국은 다채로운 자연경관과 풍부한 역사, 문화를 갖춘 관광지로 가득한 나라입니다. 특히 전국 팔도에는 매력적인
          관광지들이 한데 모여 있어 한 번에 즐길 수 있는 장점이 있습니다. 이제 저희와 함께 다양한 관광지를 살펴보세요
        </p>
      </div>
      <b-img :src="require(`@/assets/images/about/about2.jpg`)" class="aboutImg"></b-img>
    </div>
    <div class="section">
      <b-img :src="require(`@/assets/images/about/about3.jpg`)" class="aboutImg"></b-img>
      <div class="aboutImgExp">
        <h2><b>손쉬운 여행지 검색</b></h2>
        <br />
        <p>
          여행을 계획할 때 어떤 여행지로 가야할지 고민되는 경우가 많습니다. 저희가 가진 다양한 검색 기능을 활용하여
          편리하고 신속하게 여행지를 검색해 보세요.
        </p>
      </div>
    </div>
    <div class="section">
      <div class="aboutImgExp">
        <h2><b>전국 팔도 다양한 관광지를 한번에!</b></h2>
        <br />
        <p>
          여행 커뮤니티는 여행자들이 자신의 경험을 공유하고 여행 관련 정보를 제공하는 공간입니다. 다양한 여행 리뷰, 추천
          장소, 호텔 및 음식점 정보 등을 한 곳에서 확인할 수 있습니다.
        </p>
      </div>
      <b-img :src="require(`@/assets/images/about/about4.jpg`)" class="aboutImg"></b-img>
    </div>
    <!-- <div class="section background"></div> -->
    <!-- <div class="section">
      <b-img
        height="300vh"
        src="https://github.com/usedupnote/usedupnote/assets/59154924/c25565ac-4d6e-4a52-aee7-cf34dff1778b"
      ></b-img>
      <b-img
        height="300vh"
        src="https://github.com/usedupnote/usedupnote/assets/59154924/e90fdf32-44dc-4340-bb37-a2d8545146e1"
        id="logoWhite"
      ></b-img>
    </div> -->
    <!-- <h1>이용방법 페이지? 더 좋은 아이디어 받아용 https://www.myro.co.kr/guide</h1> -->
  </div>
</template>

<script>
export default {
  name: "AboutView",
  components: {},
};
</script>

<style>
.about {
  align-content: center;
  margin: auto;
}
.section {
  display: flex;
  width: 99vw;
  height: 70vh;
  /* border: 3px solid #002200; */
  padding: 10%;
  align-items: center;
  line-height: 80vh;
  text-align: left;
}

.aboutImg {
  width: 50vw;
  padding: 3%;
}
.aboutImgExp {
  margin: auto;
  line-height: 20px;
}

#logoWhite {
  background-color: #888888;
}

/* .background {
  background-color: var(--gray-color);
} */
</style>
