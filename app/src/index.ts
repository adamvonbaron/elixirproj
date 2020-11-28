import Vue from "vue";
import VueRouter from "vue-router";
import router from "@/router";
import Buefy from "buefy";

import App from "@/App.vue";

import "buefy/dist/buefy.css";

Vue.use(Buefy);
Vue.use(VueRouter);

new Vue({
  el: "#app",
  router,
  render: (h) => h(App),
});
