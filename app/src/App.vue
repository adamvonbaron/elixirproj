<template>
  <div id="app">
    <login />
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import Login from "@/components/Login.vue";

export default Vue.extend({
  name: "App",
  components: { Login },
});
</script>
