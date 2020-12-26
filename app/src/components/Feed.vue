<template>
  <div class="columns is-flex is-justify-content-center">
    <div class="column is-7 is-centered">
      <post v-for="post in posts" :key="post.id" :post="post" />
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import Post from "@/components/Post.vue";
import GetPostsQuery from "@/graphql/queries/GetPosts.graphql";

@Component({
  components: {
    Post,
  },
  apollo: {
    posts: {
      query: GetPostsQuery,
      update: (data) => data.posts,
    },
  },
})
export default class Feed extends Vue {
  posts: any[] = [];
}
</script>
