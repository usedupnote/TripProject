<template>
  <div class="search-bar">
    <b-input-group size="lg" class="mb-2 w-25">
      <b-input-group-prepend is-text class="border-right-0">
        <b-icon icon="search"></b-icon>
      </b-input-group-prepend>
      <b-form-input type="search" v-model="searchKeyword" @input="emitSearchText"></b-form-input>
    </b-input-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchKeyword: "",
    };
  },
  methods: {
    emitSearchText() {
      this.$emit("search", this.searchKeyword);
    },
  },
  name: "SearchBar",
};
</script>

<style scoped>
.search-bar {
  display: flex;
  justify-content: center;
}

.input-group-text {
  background-color: transparent;
  border-right: none;
}
.form-control {
  border-left: none;
}

.form-control:focus {
  border-color: #ced4da;
  box-shadow: none;
}
</style>
