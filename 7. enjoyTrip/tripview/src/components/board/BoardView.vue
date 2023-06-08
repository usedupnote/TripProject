<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show variant="light">
          <h3 id="viewHeadline">view</h3>
        </b-alert>
      </b-col>
    </b-row>
    <b-col>
      <button class="listBtn starButton" @click="checkStar(isStared)">
        <b-icon icon="star" scale="2" v-if="this.isStared == 0"></b-icon>
        <b-icon icon="star-fill" scale="2" v-else></b-icon>
      </button>
    </b-col>
    <b-row class="mb-1">
      <b-col>
        <b-card
          :header-html="`
          <h3><b>${article.title}</b></h3>
          <a class='nicknameOnBoard'>[ ${boarduser.nickname} ]</a>
          <div class='inlineContent'>
            <h6>${article.createTime}</h6>
            <h6>조회수 ${article.viewCount}</h6>
          </div>`"
          class="mb-2"
          header-bg-variant="white"
          border-variant="light"
          no-body
        >
          <b-card-body class="text-left cardbodyContent">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button class="listBtn" @click="moveList">목록으로</b-button>
      </b-col>

      <b-col class="text-right" v-if="article.userEmail == curToken.email || (userInfo && userInfo.grade_id == 0)">
        <b-button variant="outline-info" @click="moveModifyArticle" class="mr-2 inputButton">글수정</b-button>
        <b-button variant="outline-danger" @click="deleteArticle">글삭제</b-button>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { getArticle } from "@/api/board";
import { mapState } from "vuex";
import { findByEmail } from "@/api/member";
import { createStar, deleteStar, selectAllByBoardId } from "@/api/star";

const memberStore = "memberStore";

export default {
  name: "BoardDetail",
  data() {
    return {
      article: {},
      boarduser: {},
      isStared: 0,
      star: {
        board_id: 0,
        userEmail: "",
      },
      stars: [],
      curToken: {
        content: String,
        email: String,
        exp: 0,
        grade_id: -1,
        title: String,
      },
    };
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapState("memberStore", ["token"]),
    message() {
      if (this.article.content) return this.article.content.split("\n").join("<br>");
      return "";
    },
  },
  created() {
    let param = this.$route.params.id;

    getArticle(
      param,
      ({ data }) => {
        this.article = data;
        console.log(this.article);
        findByEmail(
          this.article.userEmail,
          ({ data }) => {
            this.boarduser = data;
            console.log(this.boarduser);
          },
          (error) => {
            console.log(error);
          }
        );
        this.star.board_id = this.article.id;
        this.star.userEmail = JSON.parse(atob(this.token.split(".")[1])).email;
        console.log("this.article.id,", this.article.id);
        selectAllByBoardId(
          this.article.id,
          ({ data }) => {
            this.stars = data;
            for (let i = 0; i < this.stars.length; i++) {
              if (this.stars[0].userEmail == JSON.parse(atob(this.token.split(".")[1])).email) {
                this.isStared = 1;
                break;
              }
            }
          },
          (error) => {
            console.log(error);
          }
        );
      },
      (error) => {
        console.log(error);
      }
    );
    if (this.token) {
      this.curToken = JSON.parse(atob(this.token.split(".")[1]));
    }
  },
  methods: {
    moveModifyArticle() {
      if (this.token) {
        this.$router.replace({
          name: "boardmodify",
          params: { id: this.article.id },
        });
        //   this.$router.push({ path: `/board/modify/${this.article.id}` });
      } else {
        alert("로그인 후 이용할 수 있습니다.");
      }
    },
    deleteArticle() {
      if (this.token) {
        if (confirm("정말로 삭제?")) {
          this.$router.replace({
            name: "boarddelete",
            params: { id: this.article.id },
          });
        }
      } else {
        alert("로그인 후 이용할 수 있습니다.");
      }
    },
    moveList() {
      this.$router.push({ name: "boardlist" });
    },
    checkStar(isStared) {
      if (isStared == 0) {
        this.isStared = 1;
        createStar(
          this.star,
          ({ data }) => {
            console.log(data);
            console.log(this.star);
          },
          (error) => {
            console.log(error);
          }
        );
      } else {
        this.isStared = 0;
        deleteStar(
          this.star,
          ({ data }) => {
            console.log(data);
            console.log(this.star);
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },
  },
};
</script>

<style>
#viewHeadline {
  font-family: EF_jejudoldam;
  font-size: 50px;
  color: var(--main-color);
}

.listBtn {
  background-color: var(--white-color);
  color: var(--main-color);
  border-color: var(--main-color);
  transform: background-color 0.5s;
}
.listBtn:hover {
  background-color: var(--main-color);
  color: var(--white-color);
  border-color: var(--main-color);
}

.inlineContent {
  display: flex;
  justify-content: center;
}

h6 {
  margin: 1%;
  color: var(--gray-color);
}

.starButton {
  font-size: small;
  width: 3%;
  color: var(--main-color);
  border-width: 0px;
  background-color: var(--white-color);
  transform: color 0.5s, background-color 0.5s;
}
.starButton:hover {
  color: var(--highlight-color);
  background-color: var(--white-color);
}
.nicknameOnBoard {
  color: var(--main-color);
}

.cardbodyContent {
  border: 3px solid var(--gray-color);
  min-height: 30vh;
  margin-bottom: 3%;
  padding: 5%;
}

.inputButton {
  color: var(--highlight-color);
  border-color: var(--highlight-color);
  background-color: var(--white-color);
  transform: color 0.5s, border-color 0.5s, background-color 0.5s;
}

.inputButton:hover {
  color: var(--white-color);
  border-color: var(--highlight-color);
  background-color: var(--highlight-color);
}
</style>
