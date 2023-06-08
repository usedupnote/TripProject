<template>
  <article class="main">
    <h2>어디로 여행을 떠나시나요?</h2>
    <p class="meta-info">여행지를 검색하거나 목록에서 직접 선택해주세요.</p>
    <search-bar @search="handleSearch"></search-bar>
    <div>
      <b-nav class="w-50 mt-3" style="margin: auto" align="center" pills>
        <b-nav-item
          v-for="province in provinces"
          :key="province"
          :active="selectedProvince == province"
          @click="selectedProvince = province"
          >{{ province }}</b-nav-item
        >
      </b-nav>
    </div>
    <div class="row four-cards">
      <!-- image-card -->
      <image-card
        v-for="tripInfo in FilteredTripInfos"
        :key="tripInfo.imageFileName"
        :title="tripInfo.location"
        :desc="tripInfo.desc"
        :imageUrl="require(`@/assets/images/${tripInfo.imageFileName}`)"
        v-b-modal="`${tripInfo.location}-modal`"
      />
      <!-- modal -->
      <b-modal
        v-for="tripInfo in FilteredTripInfos"
        :key="tripInfo.location"
        :id="`${tripInfo.location}-modal`"
        dialog-class="trip-modal-dialog"
        hide-footer
        hide-header
      >
        <template #modal-title> Using <code>$bvModal</code> Methods </template>
        <div class="d-block text-center">
          <h1>{{ tripInfo.location }}</h1>
          <p>{{ tripInfo.desc }}</p>
          <p class="detail-info">{{ tripInfo.detail }}</p>
        </div>
        <router-link
          :to="{ name: 'trip', params: { tripInfo, location: tripInfo.location } }"
          custom
          v-slot="{ navigate }"
        >
          <b-button @click="navigate" class="mt-3" block role="link">자세히 살펴보기</b-button>
        </router-link>
      </b-modal>
    </div>
  </article>
</template>

<script>
import tripInfos from "@/util/trip-infos";
import SearchBar from "@/components/mainview/SearchBar";
import ImageCard from "@/components/mainview/ImageCard";

function filterByValue(array, string) {
  return array.filter((o) =>
    Object.keys(o).some((k) => {
      if (k === "location" || k === "province" || k === "desc") {
        return o[k].toLowerCase().includes(string.toLowerCase());
      }
    })
  );
}

function filterByProvince(array, string) {
  if (string == "전체") return array;
  return array.filter((o) => o.province.toLowerCase().includes(string.toLowerCase()));
}
export default {
  name: "MainView",
  components: { SearchBar, ImageCard },
  data() {
    return {
      selectedProvince: "전체",
      provinces: ["전체", "서울", "경기", "강원", "충청", "경상", "전라", "제주"],
      searchKey: "",
    };
  },
  methods: {
    handleSearch(value) {
      this.searchKey = value;
    },
  },
  computed: {
    FilteredTripInfos() {
      if (this.searchKey.length > 0) {
        return filterByValue(filterByProvince(tripInfos, this.selectedProvince), this.searchKey);
      }
      return filterByProvince(tripInfos, this.selectedProvince);
    },
  },
};
</script>

<style>
.trip-modal-dialog {
  margin-top: 16rem;
  -ms-user-select: none;
  -moz-user-select: -moz-none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  user-select: none;
}
</style>

<style scoped>
.detail-info {
  text-align: left;
  color: gray;
}

.nav-pills .nav-link.active,
.nav-pills .show > .nav-link {
  color: #fff;
  background-color: #acb1d6;
}
a {
  color: #444c61;
}

.four-cards {
  width: 1232px;
}

.row {
  margin: 0.75rem auto auto auto;
}

article > h2 {
  font-weight: bolder;
  margin-top: 30px;
}

article[class="main"] {
  align-content: center;
}

.meta-info {
  font-size: 0.875rem;
  margin: 20px 0px 20px 0px;
  color: RGB(115, 115, 115);
}
</style>
