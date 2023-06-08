<template>
  <div class="my-page d-flex justify-content-center align-items-center" style="height: 80vh">
    <div class="mx-auto" style="width: 300px">
      <div class="text">회원정보</div>
      <b-form class="user-info-form">
        <div>
          <img
            v-if="editedData.img == null"
            :class="['profile-image', !editDisabled ? 'profile-image-enabled' : '']"
            src="@/assets/default_profile.jpg"
          />
          <img v-else :class="['profile-image', !editDisabled ? 'profile-image-enabled' : '']" :src="editedData.img" />
          <PropfileUpload @uploadedFile="handleUploadedFile" v-show="!editDisabled" />
        </div>
        <b-form-group id="email-group" label="이메일" label-align="left" label-for="email-input">
          <b-form-input id="email-input" v-model="editedData.email" type="email" disabled />
        </b-form-group>
        <b-form-group id="name-group" label="이름" label-align="left" label-for="name-input">
          <b-form-input id="name-input" v-model="editedData.name" :disabled="editDisabled" />
        </b-form-group>
        <b-form-group id="nickname-group" label="별명" label-align="left" label-for="nickname-input">
          <b-form-input id="nickname-input" v-model="editedData.nickname" :disabled="editDisabled" />
        </b-form-group>
        <b-form-group id="password-group" label="비밀번호" label-align="left" label-for="password-input">
          <b-form-input
            id="password-input"
            v-model="editedData.password"
            :type="editDisabled ? 'password' : 'text'"
            :disabled="editDisabled"
          />
        </b-form-group>
        <b-form-group id="age-group" label="나이" label-align="left" label-for="age-input">
          <b-form-input id="age-input" v-model="editedData.age" :disabled="editDisabled" />
        </b-form-group>
        <b-button v-if="editDisabled" id="edit-btn" @click="toggleEditFlag">수정</b-button>
        <b-button v-if="!editDisabled" id="submit-btn" @click="[toggleEditFlag($event), handleUpdateUser($event)]"
          >완료</b-button
        >
        <b-button v-if="!editDisabled" id="cancel-btn" @click="[toggleEditFlag($event), setOriginalUserInfo($event)]"
          >취소</b-button
        >
      </b-form>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import PropfileUpload from "@/components/common/ProfileUpload.vue";

export default {
  name: "MyPageView",
  components: { PropfileUpload },
  data() {
    return {
      editDisabled: true,
      editedData: null,
    };
  },
  methods: {
    ...mapActions("memberStore", ["updateUser"]),
    toggleEditFlag() {
      this.editDisabled = !this.editDisabled;
    },
    setOriginalUserInfo() {
      this.editedData = JSON.parse(JSON.stringify(this.userInfo));
    },
    handleUpdateUser() {
      this.updateUser(this.editedData);
    },
    handleUploadedFile(e) {
      this.editedData.img = e;
    },
  },
  computed: {
    ...mapState("memberStore", ["userInfo", "token"]),
  },
  created() {
    this.setOriginalUserInfo();
  },
};
</script>

<style scoped>
.profile-image {
  border-radius: 30px;
  width: 30px;
  height: 30px;
  object-fit: cover;
}

.profile-image-enabled {
  margin-left: 16px;
}
.my-page {
  -ms-user-select: none;
  -moz-user-select: -moz-none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  user-select: none;
}

#image-edit-btn {
  vertical-align: bottom;
}

#submit-btn,
#cancel-btn {
  margin: 0 0.25rem 0 0.25rem;
}

#edit-btn,
#submit-btn {
  background-color: var(--main-color) !important;
  border-color: transparent;
}
.profile-image {
  width: 60px;
  height: 60px;
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
</style>
