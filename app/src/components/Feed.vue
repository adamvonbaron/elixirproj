<template>
  <div class="columns is-flex is-justify-content-center">
    <div class="column is-7 is-centered">
      <post />
      <post />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Post from "./Post.vue";
export default Vue.extend({
  name: "Feed",
  components: {
    Post,
  },
});
</script>
