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
          <p class="title is-4 mb-1">John Smith</p>
          <a href="#"><p class="subtitle is-6">@johnsmith</p></a>
          <div class="is-flex is-justify-content-right pt-4">
            <div>
              posted&nbsp;<time datetime="2016-1-1">11:09 PM - 1 Jan 2016</time>
            </div>
          </div>
        </div>
      </div>
      <div class="content">
        <p>
          What the fuck did you just fucking say about me, you little bitch?
          I'll have you know I graduated top of my class in the Navy Seals, and
          I've been involved in numerous secret raids on Al-Quaeda, and I have
          over 300 confirmed kills. I am trained in gorilla warfare and I'm the
          top sniper in the entire US armed forces. You are nothing to me but
          just another target. I will wipe you the fuck out with precision the
          likes of which has never been seen before on this Earth, mark my
          fucking words. You think you can get away with saying that shit to me
          over the Internet? Think again, fucker. As we speak I am contacting my
          secret network of spies across the USA and your IP is being traced
          right now so you better prepare for the storm, maggot. The storm that
          wipes out the pathetic little thing you call your life. You're fucking
          dead, kid. I can be anywhere, anytime, and I can kill you in over
          seven hundred ways, and that's just with my bare hands. Not only am I
          extensively trained in unarmed combat, but I have access to the entire
          arsenal of the United States Marine Corps and I will use it to its
          full extent to wipe your miserable ass off the face of the continent,
          you little shit. If only you could have known what unholy retribution
          your little "clever" comment was about to bring down upon you, maybe
          you would have held your fucking tongue. But you couldn't, you didn't,
          and now you're paying the price, you goddamn idiot. I will shit fury
          all over you and you will drown in it. You're fucking dead, kiddo.
        </p>
      </div>
      <div class="card-footer" />
    </div>
    <div class="p-4">
      <comments />
    </div>
  </article>
</template>

<script lang="ts">
import Vue from "vue";
import Comments from "./Comments.vue";
export default Vue.extend({
  name: "Post",
  components: {
    Comments,
  },
});
</script>
