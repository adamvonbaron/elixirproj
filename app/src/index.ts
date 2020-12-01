import Vue from "vue";
import VueRouter from "vue-router";
import VueApollo from "vue-apollo";
import router from "@/router";
import Buefy from "buefy";

import App from "@/App.vue";
import defaultClient from "@/apollo";

import "buefy/dist/buefy.css";

const apolloProvider = new VueApollo({
  defaultClient,
});

Vue.use(Buefy);
Vue.use(VueRouter);
Vue.use(VueApollo);

new Vue({
  el: "#app",
  router,
  apolloProvider,
  render: (h) => h(App),
});
