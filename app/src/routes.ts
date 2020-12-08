import { RouteConfig } from "vue-router";

import LoginView from "@/views/LoginView.vue";
import NotFoundView from "@/views/NotFoundView.vue";
import HomeView from "@/views/HomeView.vue";

export default [
  { path: "/", component: LoginView },
  {
    path: "/home",
    component: HomeView,
    children: [{ path: "posts", component: HomeView }],
  },
  { path: "*", component: NotFoundView },
] as RouteConfig[];
