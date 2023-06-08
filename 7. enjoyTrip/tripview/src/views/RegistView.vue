<template>
  <div class="my-page d-flex justify-content-center align-items-center" style="height: 80vh">
    <div class="mx-auto" style="width: 300px">
      <div class="text">회원가입</div>
      <b-form class="user-info-form">
        <b-form-group id="email-group" label="이메일" label-align="left" label-for="email-input">
          <b-form-input id="email-input" v-model="createData.email" type="email" />
        </b-form-group>
        <b-form-group id="name-group" label="이름" label-align="left" label-for="name-input">
          <b-form-input id="name-input" v-model="createData.name" />
        </b-form-group>
        <b-form-group id="nickname-group" label="별명" label-align="left" label-for="nickname-input">
          <b-form-input id="nickname-input" v-model="createData.nickname" />
        </b-form-group>
        <b-form-group id="password-group" label="비밀번호" label-align="left" label-for="password-input">
          <b-form-input id="password-input" v-model="createData.password" :type="editDisabled ? 'password' : 'text'" />
        </b-form-group>
        <b-form-group label="성별" label-align="left">
          <b-dropdown
            id="gender-group"
            variant="none"
            class="form-control"
            label-for="gender-input"
            :text="createData.gender == 'M' ? '남성' : '여성'"
          >
            <b-dropdown-item id="gender-input" @click="createData.gender = 'M'">남성(Male)</b-dropdown-item>
            <b-dropdown-item id="gender-input" @click="createData.gender = 'F'">여성(Female)</b-dropdown-item>
          </b-dropdown>
        </b-form-group>
        <b-form-group id="age-group" label="나이" label-align="left" label-for="age-input">
          <b-form-input id="age-input" v-model="createData.age" />
        </b-form-group>
        <b-button id="submit-btn" @click="[handleUpdateUser($event)]">회원가입</b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
import { createUser } from "@/api/member";
import { mapState, mapActions } from "vuex";

export default {
  name: "RegistView",
  components: {},
  data() {
    return {
      editDisabled: true,
      createData: {
        email: "",
        name: "",
        nickname: "",
        gender: "M",
        age: 0,
        password: "",
      },
    };
  },
  methods: {
    ...mapActions("memberStore", ["updateUser"]),
    handleUpdateUser() {
      createUser(
        this.createData,
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
    moveList() {
      this.$router.push({ name: "entry" });
    },
  },
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
  },
  created() {},
};
</script>

<style scoped>
.my-page {
  -ms-user-select: none;
  -moz-user-select: -moz-none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  user-select: none;
}

#submit-btn {
  margin: 0 0.25rem 0 0.25rem;
  background-color: var(--main-color) !important;
  border-color: transparent;
}
.text {
  color: var(--main-color);
  font-size: 2.5rem;
}

.sign-in {
  margin-top: 0.8rem;
}

.meta {
  font-size: 0.75rem;
  color: gray;
}

.user-info-form {
  margin-top: 0.5rem;
  -ms-user-select: none;
  -moz-user-select: -moz-none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  user-select: none;
}

#login-btn {
  width: 100%;
  background-color: var(--main-color);
  border-color: var(--main-color);
}

#gender-group {
  background-color: var(--white-color);
  color: var(--main-color);
  padding: 0;
}
</style>
