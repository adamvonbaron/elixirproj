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
            <strong>Barbara Middleton</strong>
            <br />
            Kappa
            <br />
            <small><a>Like</a> · <a>Reply</a> · 3 hrs</small>
          </p>
        </div>

        <article class="media">
          <figure class="media-left">
            <p class="image is-48x48">
              <img
                src="https://semantic-ui.com/images/avatar2/large/molly.png"
              />
            </p>
          </figure>
          <div class="media-content">
            <div class="content">
              <p>
                <strong>Sean Brown</strong>
                <br />
                Donec sollicitudin urna eget eros malesuada sagittis.
                Pellentesque habitant morbi tristique senectus et netus et
                malesuada fames ac turpis egestas. Aliquam blandit nisl a nulla
                sagittis, a lobortis leo feugiat.
                <br />
                <small><a>Like</a> · <a>Reply</a> · 2 hrs</small>
              </p>
            </div>
          </div>
        </article>

        <article class="media">
          <figure class="media-left">
            <p class="image is-48x48">
              <img
                src="https://semantic-ui.com/images/avatar2/large/elyse.png"
              />
            </p>
          </figure>
          <div class="media-content">
            <div class="content">
              <p>
                <strong>Kayli Eunice </strong>
                <br />
                Sed convallis scelerisque mauris, non pulvinar nunc mattis vel.
                Maecenas varius felis sit amet magna vestibulum euismod
                malesuada cursus libero. Vestibulum ante ipsum primis in
                faucibus orci luctus et ultrices posuere cubilia Curae;
                Phasellus lacinia non nisl id feugiat.
                <br />
                <small><a>Like</a> · <a>Reply</a> · 2 hrs</small>
              </p>
            </div>
          </div>
        </article>
      </div>
    </article>
    <article class="media">
      <figure class="media-left">
        <p class="image is-64x64">
          <img src="https://bulma.io/images/placeholders/128x128.png" />
        </p>
      </figure>
      <div class="media-content">
        <div class="field">
          <p class="control">
            <textarea
              class="textarea"
              placeholder="Add a comment..."
            ></textarea>
          </p>
        </div>
        <div class="field">
          <p class="control">
            <button class="button">Post comment</button>
          </p>
        </div>
      </div>
    </article>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
export default Vue.extend({
  name: "Comments",
});
</script>