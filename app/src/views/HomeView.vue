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
import Component from "vue-class-component";
import RootNavBar from "@/components/RootNavBar.vue";
import Feed from "@/components/Feed.vue";

@Component({
  components: {
    Feed,
    RootNavBar,
  },
})
export default class HomeView extends Vue {}
</script>

<style lang="scss">
.feed {
  height: 100%;
  padding-top: 66px;
}
</style>
