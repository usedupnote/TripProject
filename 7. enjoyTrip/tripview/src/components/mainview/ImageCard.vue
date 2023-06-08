<template>
  <div class="card" style="width: 18rem">
    <img class="card-img-top fixed-image" :src="imageUrl" />
    <div class="card-body">
      <h2>{{ title }}</h2>
      <p class="card-text">{{ desc }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    desc: String,
    imageUrl: String,
  },
  name: "ImageCard",
};
</script>

<style scoped>
.fixed-image {
  height: 192px;
}

.card {
  margin: 10px 10px 10px 10px;
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s;
}
.card:hover {
  transform: scale(1.02);
}
</style>
