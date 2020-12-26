<template>
  <article class="card my-4">
    <div class="card-content">
      <div class="media-content columns">
        <div class="column is-2">
          <figure class="image is-96x96">
            <img
              src="https://semantic-ui.com/images/avatar2/large/matthew.png"
              alt="Placeholder image"
            />
          </figure>
        </div>
        <div class="column">
          <p class="title is-4 mb-1">{{ post.author.username }}</p>
          <!-- <a href="#"><p class="subtitle is-6">@johnsmith</p></a> -->
          <div class="is-flex is-justify-content-right pt-4">
            <div>
              posted&nbsp;<time>{{ post.insertedAt }}</time>
            </div>
          </div>
        </div>
      </div>
      <div class="content">
        <p>
          {{ post.content }}
        </p>
      </div>
      <div class="card-footer" />
    </div>
    <div class="p-4">
      <comment
        v-for="comment in post.comments"
        :key="comment.id"
        :comment="comment"
      />
    </div>
    <div class="p-4">
      <add-comment />
    </div>
  </article>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import Comment from "@/components/Comment.vue";
import AddComment from "@/components/AddComment.vue";

@Component({
  components: {
    Comment,
    AddComment,
  },
  props: {
    post: Object,
  },
})
export default class Post extends Vue {}
</script>
