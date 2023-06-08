<template>
  <div class="entry ml-auto" v-cloak>
    <!-- <h1>메인 기능들이 들어갈 페이지 https://www.myro.co.kr/ &lt;= 여기서 여행지 네비게이션 바 누르면</h1> -->
    <div id="entryPage">
      <!-- <video src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allow="autoplay" id="mainVideo"></video> -->
      <!-- <div v-html="mainVideo"></div> -->
      <!-- <video muted autoplay src="{{getBoardno()}}" loop id="entryVideo"></video> -->
      <video muted autoplay loop id="entryVideo">
        <source :src="require(`@/assets/video/MainMovie${this.boardno}.mp4`)" type="video/mp4" />
        <!-- <source src="../assets/video/MainMovie1.mp4" type="video/mp4" /> -->
      </video>
      <div id="goStart">
        <div id="entryIntroduce"><b>새로운 경험과 추억을 만나세요</b></div>
        <div id="entryHeadline"><b>EnjoyTrip</b></div>
        <blockquote class="blockquote mb-0" @click="moveMainView" id="goStartBtn">시작하기</blockquote>
        <div id="entryVisitorGroup">
          <div class="VisitorGroupItem">
            <div>총 이용자 수</div>
            <div>{{ this.members.length }}</div>
          </div>
          <div class="VisitorGroupItem">
            <div>총 게시물 수</div>
            <div>{{ this.articles.length }}</div>
          </div>
        </div>
      </div>
    </div>
    <!-- <mdb-container>
      <mdb-carousel :interval="8000" :items="videoCarousel" indicators controlls></mdb-carousel>
    </mdb-container> -->
  </div>
</template>

<script>
import { listArticle } from "@/api/board";
import { selectAllUser } from "@/api/member";

export default {
  name: "EntryView",
  data() {
    return {
      members: [],
      articles: [],
      transparNav: true,
      boardno: 0,
    };
  },
  components: {},
  methods: {
    moveMainView() {
      this.$router.push({ name: "main" });
    },
    getBoardno() {
      return "@/assets/video/MainMovie" + this.boardno + ".mp4";
    },
  },
  created() {
    this.boardno = Math.round(Math.random() * 11) + 1;
    selectAllUser(
      ({ data }) => {
        this.members = data;
      },
      (error) => {
        console.log(error);
      }
    );
    listArticle(
      ({ data }) => {
        this.articles = data;
      },
      (error) => {
        console.log(error);
      }
    );
  },
};
</script>
<style scoped>
.entry {
  width: 99vw;
}
#entryPage {
  display: Flexbox;
  align-content: right;
  width: 99.1vw;
  margin: 0;
}

#entryIntroduce {
  font-size: 1vw;
  margin: -20px;
}

#entryHeadline {
  font-size: 5vw;
}

#entryVideo {
  margin: -30px 0 0 -50vh;
  height: 100%;
  position: fixed;
  z-index: -1;
}
#goStart {
  position: fixed;
  padding: 35vh 0 35vh 0;
  align-content: center;
  height: 94vh;
  width: 35vw;
  top: 71px;
  left: 0;
  background-color: var(--white-color);
  /* border: solid 1px red; */
}
#goStartBtn {
  margin: 5vh auto 0 auto;
  color: var(--white-color);
  font-weight: bold;
  font-size: 2vw;
  text-align: center;
  line-height: 10vh;
  background-color: var(--main-color);
  width: 15vw;
  height: 10vh;
  cursor: auto;
  transition: background-color 0.5s;
}
#goStartBtn:hover {
  background-color: var(--highlight-color);
  cursor: pointer;
}
#entryVisitorGroup {
  display: flex;
  position: absolute;
  justify-content: center;
  flex-wrap: wrap-reverse;

  position: relative;
  top: 20vh;
}
.VisitorGroupItem {
  margin: auto;
  color: var(--gray-color);
  font-size: medium;
  font-weight: bold;
}

[v-clock] {
  display: none;
}
</style>
