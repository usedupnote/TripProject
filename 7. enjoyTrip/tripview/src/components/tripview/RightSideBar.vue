<template>
  <div class="right-side-bar">
    <b-nav tabs fill>
      <b-nav-item :active="category === 1" @click="category = 1">관광지</b-nav-item>
      <b-nav-item :active="category === 2" @click="category = 2">식당</b-nav-item>
      <b-nav-item :active="category === 3" @click="category = 3">숙소</b-nav-item>
    </b-nav>
    <div class="recommand" v-if="category == 1">추천 관광지</div>
    <div class="recommand" v-if="category == 2">추천 식당</div>
    <div class="recommand" v-if="category == 3">추천 숙소</div>
    <div class="card-container" v-show="category == 1">
      <b-card
        class="card"
        v-for="(data, index) in accomodationList"
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
          <b-icon v-b-modal="`${data.name}-modal`" class="clickable" icon="info-circle"></b-icon>
        </p>

        <!-- 모달 -->
        <b-modal
          @hide="onModalClose"
          content-class="tripview-modal-content"
          body-class="tripview-modal-body"
          dialog-class="modal-dialog"
          :id="`${data.name}-modal`"
          size="lg"
          title="Large Modal"
          hide-footer
          hide-header
        >
          <img class="img-item" :src="data.imgSrc" />
          <div class="content-item">
            <div class="tripview-modal-text">
              <div class="tripview-modal-title">{{ data.name }}</div>
              <div class="tripview-modal-address">{{ data.address }}</div>
              <div class="tripview-modal-desc">{{ data.description }}</div>
            </div>
            <div class="tripview-modal-footer">
              <b-button v-if="!alreadyInplan(data)" class="add-to-plan-btn" @click="addToPlan(data)"
                >내 플랜에 추가</b-button
              >
              <b-button v-else class="add-to-plan-btn" @click="removeFromPlan(data)">플랜에서 제거</b-button>
              <b-button v-show="!reviewOpened" class="review-btn" @click="getReviews(data.id)">리뷰 보기</b-button>
              <b-button v-show="reviewOpened" class="review-btn" @click="reviewOpened = false">리뷰 닫기</b-button>
              <img
                class="redir-icon"
                @click="searchGoogle(data.name)"
                width="48"
                height="48"
                src="https://img.icons8.com/fluency/48/google-logo.png"
                alt="google-logo"
              />
              <img
                class="redir-icon"
                @click="searchInstagram(data.name)"
                width="48"
                height="48"
                src="https://img.icons8.com/color/48/instagram-new--v1.png"
                alt="instagram-new--v1"
              />
            </div>
          </div>
          <div v-show="reviewOpened" class="review-container">
            <div v-if="reviews != null && reviews != ''">
              <b-table
                id="review-table"
                thead-class="d-none"
                :borderless="true"
                :fields="fields"
                :items="reviews"
                :per-page="perPage"
                :current-page="currentPage"
                small
              ></b-table>
              <b-pagination
                class="pagination-sm custom-pagination"
                v-model="currentPage"
                :total-rows="rows"
                :per-page="perPage"
                aria-controls="my-table"
                pills
              ></b-pagination>
            </div>
            <div v-else>아직 리뷰가 없습니다~ 첫 리뷰를 작성해주세요 :)</div>
            <div class="form-inline review-form">
              <input class="form-control mr-sm-2 review-bar" placeholder="리뷰를 등록해주세요." v-model="reviewinput" />
              <button class="btn review-submit-btn my-2 my-sm-0" @click="postReview(data)">등록</button>
            </div>
          </div>
        </b-modal>
      </b-card>
    </div>
  </div>
</template>

<script>
import { mapMutations, mapState } from "vuex";
import getRequest from "@/util/api-get";
import postRequest from "@/util/api-post";

export default {
  name: "RightSideBar",
  data() {
    return {
      reviewinput: "",
      perPage: 3,
      currentPage: 1,
      fields: ["userNickName", "review", "createdAt"],
      category: 1,
      accomodationList: null,
      reviews: null,
      reviewOpened: false,
    };
  },
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
    ...mapState("planStore", ["plans"]),
    rows() {
      if (this.reviews != null) {
        return this.reviews.length;
      }
      return 0;
    },
  },
  methods: {
    ...mapMutations("planStore", ["appendPlan", "removePlan"]),
    alreadyInplan(data) {
      const isInPlan = this.plans.find((p) => p.name === data.name);
      return isInPlan;
    },
    addToPlan(data) {
      if (this.token == null) {
        alert("로그인 후에 플랜에 추가할 수 있습니다.");
        return;
      }
      this.appendPlan(data);
    },
    removeFromPlan(data) {
      this.removePlan(data);
    },
    async getAccomodationList() {
      this.accomodationList = await getRequest(
        `${process.env.VUE_APP_API_BASE_URL}/accommodation/${this.$route.params.location}`
      );
    },
    async getReviews(id) {
      if (this.token == null) {
        alert("리뷰를 보기 위해서는 로그인 해야 합니다.");
        return;
      }
      this.reviewOpened = true;
      this.reviews = await getRequest(`${process.env.VUE_APP_API_BASE_URL}/reviews/${id}`);
    },
    async postReview(data) {
      if (this.token == null) {
        alert("리뷰를 작성하기 위해서는 로그인 해야 합니다.");
        return;
      }

      const payload = {
        placeId: data.id,
        review: this.reviewinput,
        userEmail: this.userInfo.email,
      };

      this.reviewinput = "";
      await postRequest(`${process.env.VUE_APP_API_BASE_URL}/reviews`, payload);
      this.getReviews(data.id);
    },
    onModalClose() {
      this.reviewOpened = false;
      this.reviews = null;
      this.reviewinput = "";
    },
    searchGoogle(name) {
      window.open(`https://www.google.com/search?q=${name}`, "_blank");
    },
    searchInstagram(name) {
      window.open(`https://www.instagram.com/explore/tags/${name}/`, "_blank");
    },
    emitData(data) {
      this.$emit("tripData", data);
    },
  },
  created() {
    this.getAccomodationList();
  },
};
</script>

<style>
.modal-dialog {
  margin-top: 16rem;
  -ms-user-select: none;
  -moz-user-select: -moz-none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  user-select: none;
}

.tripview-modal-content {
  border-radius: 0 !important;
  border: none;
  height: 300px;
}

.tripview-modal-body {
  padding: 0;
}

.img-item {
  vertical-align: top;
  display: inline-block;
  height: 300px;
  width: 30%;
}

.content-item {
  vertical-align: middle;
  display: inline-block;
  height: 300px;
  width: 70%;
}

.custom-pagination .page-item.active .page-link {
  z-index: 3;
  color: #fff;
  background-color: var(--main-color);
  border-color: var(--main-color);
}

.custom-pagination .page-link {
  color: var(--main-color);
}
</style>

<style scoped>
#review-table {
  height: 100px;
}

.review-submit-btn {
  border: 1px solid var(--highlight-color);
  color: var(--highlight-color);
}

.review-form {
  position: absolute;
  width: 100%;
  bottom: 10px;
}

.review-bar {
  width: 80%;
}

.review-container {
  padding-top: 10px;
  padding-left: 10px;
  background-color: white;
  box-shadow: inset 2px 2px 4px rgba(0, 0, 0, 0.2);
  height: 210px;
}

.tripview-modal-title {
  font-size: 20px;
  margin-left: 10px;
  padding-top: 10px;
}

.tripview-modal-address {
  color: gray;
  margin-left: 10px;
}

.tripview-modal-desc {
  margin-top: 18px;
  margin-left: 10px;
  margin-right: 3px;
  font-size: 18px;
}

.tripview-modal-text {
  height: 80%;
}

.tripview-modal-footer {
  height: 20%;
  text-align: right;
}

.review-btn,
.add-to-plan-btn {
  margin-top: 10px;
  margin-right: 1rem;
}

.redir-icon {
  margin-top: 10px;
  margin-right: 3px;
}

.redir-icon:hover {
  cursor: pointer;
}

:focus {
  outline: none;
}

a {
  color: gray;
}

.clickable:hover {
  cursor: pointer;
}

.card-container {
  animation: fadeInUp 1s;
}

.recommand {
  margin-top: 18px;
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
.active {
  color: white !important;
  background-color: var(--main-color) !important;
}
.right-side-bar {
  top: 70px;
  position: fixed;
  height: 100vh;
  width: 16%;
  right: 0;
}
</style>
