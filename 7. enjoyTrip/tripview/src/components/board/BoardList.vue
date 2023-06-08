<template>
  <div class="ml-auto">
    <div id="listHeaderArea">
      <video muted autoplay loop id="listVideo">
        <source src="@/assets/video/listMainPage1.mp4" type="video/mp4" />
      </video>
      <div id="listHeadline">List Board</div>
    </div>

    <b-container class="text-light text-center bv-example-row">
      <!-- <search-bar @search="handleSearch"> </search-bar> -->
      <b-row>
        <!-- (Start) list Nav 넣기 -->
        <b-nav class="category" pills>
          <b-nav-item
            v-for="category in categorys"
            :key="category.name"
            :active="category.name == curCategory.name"
            @click="
              getcategory(category.name);
              selectBoard(category.id);
            "
            class="categoryBtn"
          >
            {{ category.name }}
          </b-nav-item>
          <b-nav-item :active="curCategory.name == `star`" @click="staredBoard()" class="categoryBtn" v-if="this.token">
            <b-icon icon="star-fill" scale="1"></b-icon>
          </b-nav-item>
        </b-nav>

        <!-- (End) list Nav 넣기 -->
      </b-row>
      <b-row>
        <b-col class="text-left">
          <div class="articleCount">총 게시물 수 : {{ this.articles.length }}</div>
        </b-col>
        <b-col class="text-right">
          <b-button @click="moveWrite()" id="writeBtn">글쓰기</b-button>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="12">
          <template>
            <b-table
              hover
              :items="articles"
              :per-page="perPage"
              :current-page="currentPage"
              :fields="fields"
              @row-clicked="viewArticle"
            >
              <!-- <template #cell(subject)="data">
                <router-link :to="{ name: 'boardview', params: { id: data.item.title } }">
                  {{ data.item.title }}
                </router-link>
              </template> -->
              <template #cell(boardCategoryId)="data">
                {{ data.item.boardCategoryId }}
              </template>
            </b-table>
            <h2 class="noArticleAlam" v-if="articles.length == 0">등록된 게시물이 없습니다.</h2>
            <b-pagination
              class="pagination"
              v-model="currentPage"
              :total-rows="rows"
              :per-page="perPage"
              aria-controls="my-table"
              first-number
              last-number
            ></b-pagination>
          </template>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import {
  selectCategoryByName,
  listArticle,
  updateArticleCount,
  selectAllCategory,
  selectBoardByCategory,
  getAllStaredBoardByUserEmail,
} from "@/api/board";
// import SearchBar from "@/components/mainview/SearchBar";
import { mapState } from "vuex";

// function filterByValue(array, string) {
//   console.log(array[0]);
//   return array.filter((o) =>
//     Object.keys(o).some((k) => {
//       if (k === "title" || k === "userEmail" || k === "content") {
//         return o[k].toLowerCase().includes(string.toLowerCase());
//       }
//     })
//   );
// }

// function filterByProvince(array, string) {
//   console.log(array[0]);
//   if (string == "전체보기") return array;
//   return array.filter((o) => o.name.toLowerCase().includes(string.toLowerCase()));
// }

const memberStore = "memberStore";

export default {
  name: "BoardList",
  // components: { SearchBar },
  data() {
    return {
      perPage: 10,
      currentPage: 1,
      boarduser: {},
      articles: [],
      fields: [
        { key: "id", label: "글번호", tdClass: "tdClass" },
        // { key: "boardCategoryId", label: "❤", tdClass: "tdClass" },
        { key: "title", label: "제목", tdClass: "tdSubject" },
        // { key: "userEmail", label: "작성자", tdClass: "tdClass" },
        { key: "createTime", label: "작성일", tdClass: "tdClass" },
        { key: "viewCount", label: "조회수", tdClass: "tdClass" },
      ],
      curCategory: {
        id: -1,
        name: "전체보기",
      },
      categorys: [],
      searchKey: "",
    };
  },
  created() {
    listArticle(
      ({ data }) => {
        this.articles = data;
      },
      (error) => {
        console.log(error);
      }
    );
    selectAllCategory(
      ({ data }) => {
        this.categorys = data;
      },
      (error) => {
        console.log(error);
      }
    );
  },
  computed: {
    ...mapState(memberStore, ["userInfo"]),
    ...mapState("memberStore", ["token"]),
    rows() {
      return this.articles.length;
    },
    // FilteredTripInfos() {
    //   if (this.searchKey.length > 0) {
    //     return filterByValue(filterByProvince(this.articles, this.curCategory.name), this.searchKey);
    //   }
    //   return filterByProvince(this.articles, this.curCategory.name);
    // },
  },
  methods: {
    // handleSearch(value) {
    //   this.searchKey = value;
    // },
    moveWrite() {
      if (this.token) {
        this.$router.push({ name: "boardwrite" });
      } else {
        alert("로그인 후 이용할 수 있습니다.");
        this.$router.push({ name: "login" });
      }
    },
    viewArticle(article) {
      updateArticleCount(
        article.id,
        ({ data }) => {
          let msg = "조회수 + 실패";
          if (data === 1) {
            msg = "조회수 +";
          }
          console.log(msg);
        },
        (error) => {
          console.log(error);
        }
      );
      this.$router.push({
        name: "boardview",
        params: { id: article.id },
      });
    },
    updateArticleCount(id) {
      console.log(id);
    },
    getcategory(category) {
      if (this.curCategory.name == category) {
        this.curCategory.id = -1;
        this.curCategory.name = "전체보기";
      } else {
        this.curCategory.id = -1;
        this.curCategory.name = category;
        selectCategoryByName(
          this.curCategory.name,
          ({ data }) => {
            this.curCategory = {
              id: -1,
              name: "전체보기",
            };
            if (data != "") {
              this.curCategory = data;
            }
            console.log(data);
            console.log(this.curCategory);
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },
    selectBoard(category) {
      console.log(this.curCategory.id);
      if (this.curCategory.name == "전체보기") {
        listArticle(
          ({ data }) => {
            this.articles = data;
            console.log(this.articles);
          },
          (error) => {
            console.log(error);
          }
        );
      } else {
        selectBoardByCategory(
          category,
          ({ data }) => {
            this.articles = data;
            if (data.length != 0) {
              console.log("this.articles" + data.length);
            }
            console.log("data");
          },
          (error) => {
            console.log(error);
          }
        );
      }
    },
    staredBoard() {
      console.log("userInfo : ");
      console.log(this.userInfo.email);
      if (this.curCategory.name == "star") {
        this.curCategory.name = "전체보기";
        this.curCategory.id = -1;
        listArticle(
          ({ data }) => {
            this.articles = data;
            console.log(this.articles);
          },
          (error) => {
            console.log(error);
          }
        );
      } else {
        this.curCategory.name = "star";
        this.curCategory.id = -1;
        getAllStaredBoardByUserEmail(
          this.userInfo.email,
          ({ data }) => {
            console.log(data);
            this.articles = data;
            if (data.length != 0) {
              console.log("this.articles" + data.length);
            }
            console.log("data");
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

<style scope>
#listHeaderArea {
  position: relative;
  align-content: center;
  width: 100vw;
}
#listVideo {
  position: relative;
  width: 100%;
  height: 30vh;
  object-fit: none;
}
#listHeadline {
  font-family: EF_jejudoldam;
  position: absolute;
  color: var(--white-color);
  font-size: 100px;
  width: 100vw;
  height: 30vh;
  line-height: 30vh;
  top: 0;
  z-index: 1;
}
.articleCount {
  color: var(--highlight-color);
  font-weight: bold;
}
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
/* ------ category ------ */
.category {
  display: flex;
  justify-content: center;
  width: 100%;
}
.nav-pills .nav-link.active,
.nav-pills .show > .nav-link {
  background-color: var(--main-color);
  color: var(--white-color);
}
.nav-pills .nav-link {
  color: var(--main-color);
  font-weight: bold;
  border: 0 solid white;
}
.categoryBtn {
  margin: 1%;
  border-radius: 5%;
  background-color: var(--white-color);
  /* border: 2px solid var(--highlight-color); */
}
#writeBtn {
  color: var(--main-color);
  font-weight: bold;
  background-color: var(--white-color);
  border: 3px solid var(--main-color);
  transform: background-color 0.5s;
  margin: 1%;
}
#writeBtn:hover {
  background-color: rgb(230, 230, 230);
}
.pagination {
  display: flex;
  justify-content: center;
}
.page-link {
  color: var(--highlight-color);
  border: 0px solid var(--transpar-color);
}
.page-item.active .page-link {
  background-color: var(--highlight-color);
}

.noArticleAlam {
  color: var(--highlight-color);
}
</style>
