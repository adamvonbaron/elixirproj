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
        <b-button class="is-primary" @click="loginUser()">login</b-button>
      </b-field>
    </form>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import axios from "@/axios";
import { storeUser } from "@/services/authentication";

@Component
export default class Login extends Vue {
  email = "";
  password = "";

  async loginUser(): Promise<void> {
    const { data } = await axios.post(
      "/login",
      {
        email: this.email,
        password: this.password,
      },
      { withCredentials: true }
    );
    storeUser(data);
    this.$router.push({ path: "/home" });
  }
}
</script>
