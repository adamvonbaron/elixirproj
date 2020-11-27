<template>
  <div class="container">
    <form>
      <b-field label="email">
        <b-input v-model="email" type="email" />
      </b-field>
      <b-field label="password">
        <b-input v-model="password" type="password" />
      </b-field>
      <b-field>
        <b-button class="is-primary">login</b-button>
      </b-field>
    </form>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "Login",
  data: () => {
    return {
      email: "",
      password: "",
    };
  },
});
</script>
