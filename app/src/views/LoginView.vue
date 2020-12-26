<template>
  <login />
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import Login from "@/components/Login.vue";

@Component({
  components: {
    Login,
  },
})
export default class LoginView extends Vue {}
</script>
