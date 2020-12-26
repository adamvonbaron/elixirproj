<template>
  <div class="columns is-flex is-justify-content-center">
    <div class="column is-7 is-centered">
      <post v-for="post in posts" :key="post.id" :post="post" />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Post from "@/src/components/Post.vue";
import GetPostsQuery from "@/graphql/queries/GetPosts.graphql";
export default Vue.extend({
  name: "Feed",
  components: {
    Post,
  },
  apollo: {
    posts: {
      query: GetPostsQuery,
      update: (data) => data.posts,
    },
  },
  data() {
    return {
      posts: [],
    };
  },
});
</script>
