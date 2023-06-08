<template>
  <span class="upload-profile-image">
    <input type="file" ref="file" style="display: none" @change="setThumbnail" />
    <b-icon icon="pencil-square" @click="upload"></b-icon>
  </span>
</template>
<script>
export default {
  name: "ProfileUpload",
  methods: {
    upload(e) {
      e.preventDefault();
      this.$refs.file.click();
    },
    setThumbnail(e) {
      const reader = new FileReader();

      reader.readAsDataURL(e.target.files[0]);

      reader.onload = async (event) => {
        this.$emit("uploadedFile", event.target.result);
      };
    },
  },
};
</script>

<style scoped>
.upload-profile-image {
  cursor: pointer;
  vertical-align: bottom;
}
</style>
