<template>
  <div class="root-menu">
    <b-navbar>
      <template slot="start">
        <b-navbar-item href="/home"> Home </b-navbar-item>
      </template>

      <template slot="end">
        <b-navbar-item tag="div">
          <div class="buttons">
            <b-button class="is-primary is-light" @click="logoutUser()">
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
import Component from "vue-class-component";
import axios from "@/axios";
import { deleteUser } from "@/services/authentication";

@Component
export default class RootNavBar extends Vue {
  async logoutUser(): Promise<void> {
    await axios.post("/logout", {}, { withCredentials: true });
    deleteUser();
    this.$router.push({ path: "/" });
  }
}
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
