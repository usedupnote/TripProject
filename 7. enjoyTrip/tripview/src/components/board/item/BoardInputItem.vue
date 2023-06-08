<template>
  <b-row class="mb-1">
    <b-col style="text-align: left">
      <b-form @submit="onSubmit" @reset="onReset">
        <div>
          <b-form-select v-model="selected" class="mb-3 inputStyle" label-for="category">
            <b-form-select-option :value="null">Please select an option</b-form-select-option>
            <b-form-select-option v-for="category in categorys" :key="category.name" :value="category.id">
              {{ category.name }}
            </b-form-select-option>
          </b-form-select>
        </div>

        <b-form-group id="title-group" label="제목" label-for="title">
          <b-form-input
            id="title"
            v-model="article.title"
            type="text"
            required
            placeholder="제목 입력..."
            class="inputStyle"
          ></b-form-input>
        </b-form-group>

        <b-form-group id="content-group" label="내용" label-for="content">
          <b-form-textarea
            id="content"
            v-model="article.content"
            placeholder="내용 입력..."
            rows="10"
            max-rows="15"
            class="inputStyle"
          ></b-form-textarea>
        </b-form-group>

        <div class="inputButtonGroup">
          <b-button type="submit" class="m-1 inputButton" v-if="this.type === 'register'">글작성</b-button>
          <b-button type="submit" class="m-1 inputButton" v-else>글수정</b-button>
          <b-button type="reset" variant="danger" class="m-1">초기화</b-button>
        </div>
      </b-form>
    </b-col>
  </b-row>
</template>

<script>
import { writeArticle, modifyArticle, getArticle, selectAllCategory } from "@/api/board";
import { mapState } from "vuex";

export default {
  name: "BoardInputItem",

  data() {
    return {
      selected: 1,
      categorys: [],
      article: {
        id: 0,
        userEmail: "",
        title: "",
        content: "",
      },
      curToken: {
        content: String,
        email: String,
        exp: 0,
        title: String,
      },
      isUserid: false,
    };
  },
  props: {
    type: { type: String },
  },
  created() {
    selectAllCategory(
      ({ data }) => {
        this.categorys = data;
        console.log(this.categorys);
      },
      (error) => {
        console.log(error);
      }
    );
    if (this.type === "modify") {
      let param = this.$route.params.id;
      getArticle(
        param,
        ({ data }) => {
          this.article = data;
          this.selected = this.article.category;
          console.log(this.article);
        },
        (error) => {
          console.log(error);
        }
      );
      this.isUserid = true;
    }
    if (this.type === "register") {
      this.isUserid = true;
      this.curToken = JSON.parse(atob(this.token.split(".")[1]));
    }
  },
  computed: {
    ...mapState("memberStore", ["token"]),
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      this.article.userEmail = this.curToken.email;
      console.log(this.selected);
      // !this.selected && ((msg = "카테고리를 선택해주세요"), (err = false), this.$refs.category);
      // err && !this.article.title && ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      // err && !this.article.content && ((msg = "내용 입력해주세요"), (err = false), this.$refs.content.focus());
      !this.article.title && ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      err && !this.article.content && ((msg = "내용 입력해주세요"), (err = false), this.$refs.content.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registArticle() : this.modifyArticle();
    },
    onReset(event) {
      event.preventDefault();
      this.article.userEmail = 0;
      this.article.title = "";
      this.article.content = "";
      this.boardCategoryId = this.selected;
      this.moveList();
    },
    registArticle() {
      let param = {
        userEmail: this.curToken.email,
        title: this.article.title,
        content: this.article.content,
        boardCategoryId: this.selected,
      };
      console.log("param" + param);
      writeArticle(
        param,
        ({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === 1) {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        },
        (error) => {
          console.log(error);
        }
      );
    },
    modifyArticle() {
      let param = {
        id: this.article.id,
        userEmail: this.article.userEmail,
        title: this.article.title,
        content: this.article.content,
      };
      modifyArticle(
        param,
        ({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === 1) {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          // 현재 route를 /list로 변경.
          this.moveList();
        },
        (error) => {
          console.log(error);
        }
      );
    },
    moveList() {
      this.$router.push({ name: "boardlist" });
    },
  },
};
</script>

<style scoped>
.inputStyle {
  border: 2px solid var(--gray-color);
}

.inputButtonGroup {
  display: flex;
  justify-content: right;
}
.inputButton {
  color: var(--white-color);
  background-color: var(--main-color);
  border-color: var(--main-color);
  transform: background-color 0.5s, border-color 0.5s;
}
.inputButton:hover {
  background-color: var(--highlight-color);
  border-color: var(--highlight-color);
}
</style>
