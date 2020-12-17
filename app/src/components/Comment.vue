<template>
  <div>
    <article class="media">
      <figure class="media-left">
        <p class="image is-64x64">
          <img src="https://semantic-ui.com/images/avatar2/large/kristy.png" />
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong>{{ comment.author.username }}</strong>
            <br />
            {{ comment.content }}
            <br />
            <small><a>Like</a> · <a>Reply</a> · {{ comment.insertedAt }}</small>
          </p>
        </div>
      </div>
    </article>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
export default Vue.extend({
  name: "Comment",
  props: {
    comment: Object,
  },
  created() {
    console.log(this.comment);
  },
});
</script>
