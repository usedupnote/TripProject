<template>
  <div class="login d-flex justify-content-center align-items-center" style="height: 60vh">
    <div class="mx-auto" style="width: 300px">
      <div class="text">LOG IN</div>
      <div class="meta">당신의 즐거운 여행을 위한 솔루션</div>
      <b-form class="login-form">
        <b-form-group id="email-group" label="이메일" label-align="left" label-for="email-input">
          <b-form-input id="email-input" v-model="email" type="email" required></b-form-input>
        </b-form-group>

        <b-form-group id="password-group" label="비밀번호" label-align="left" label-for="password-input">
          <b-form-input id="password-input" v-model="password" type="password" required></b-form-input>
        </b-form-group>
        <b-button id="login-btn" @click="handleLogin" variant="primary">로그인</b-button>
        <div class="meta sign-in">회원이 아니세요? <router-link to="/regist">회원가입하기</router-link></div>
      </b-form>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "LoginView",
  components: {},
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    ...mapActions("memberStore", ["login"]),
    handleLogin() {
      this.login({ email: this.email, password: this.password });
    },
  },
};
</script>

<style scoped>
.text {
  font-size: 2.5rem;
}

.sign-in {
  margin-top: 0.8rem;
}

.meta {
  font-size: 0.75rem;
  color: gray;
}

.login-form {
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
</style>
