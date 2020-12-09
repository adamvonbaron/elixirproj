<template>
  <div>
    <root-nav-bar />
    <div class="container feed">
      <feed />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import RootNavBar from "../components/RootNavBar.vue";
import Feed from "../components/Feed.vue";
export default Vue.extend({
  name: "HomeView",
  components: {
    Feed,
    RootNavBar,
  },
});
</script>

<style lang="scss">
.feed {
  height: 100%;
}
</style>
