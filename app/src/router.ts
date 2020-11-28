import VueRouter from "vue-router";
import LoginView from "@/views/LoginView.vue";
import NotFoundView from "@/views/NotFoundView.vue";

const routes = [
  { path: "/", component: LoginView },
  { path: "*", component: NotFoundView },
];

const router = new VueRouter({
  routes,
  mode: "history",
});

export default router;
