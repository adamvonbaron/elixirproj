<template>
  <div class="root-menu">
    <b-navbar>
      <template slot="start">
        <b-navbar-item href="/home"> Home </b-navbar-item>
      </template>

      <template slot="end">
        <b-navbar-item tag="div">
          <div class="buttons">
            <b-button @click="logoutUser()" class="is-primary is-light">
              logout
            </b-button>
          </div>
        </b-navbar-item>
      </template>
    </b-navbar>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import axios from "../axios";
import { deleteUser } from "../services/authentication";

export default Vue.extend({
  name: "RootNavBar",
  methods: {
    async logoutUser() {
      const { data } = await axios.post(
        "/logout",
        {},
        { withCredentials: true }
      );
      deleteUser();
      this.$router.push({ path: "/" });
    },
  },
});
</script>

<style lang="scss">
.root-menu {
  position: fixed;
  top: 0;
  overflow: hidden;
  z-index: 999;
  width: 100%;
}
</style>