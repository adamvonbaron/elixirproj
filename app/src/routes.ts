import { NavigationGuardNext, Route, RouteConfig } from "vue-router";

import { getUser } from "@/services/authentication";

/* instead of importing views directly, define each view to be a function that
 * lazily imports the proper file. this way the view is only sent to the client on
 * route match. use webpackChunkName to name the js bundle */
const LoginView = () =>
  import(/* webpackChunkName: 'login' */ "@/views/LoginView.vue");
const HomeView = () =>
  import(/* webpackChunkName: 'home' */ "@/views/HomeView.vue");
const NotFoundView = () =>
  import(/* webpackChunkName: 'notfound' */ "@/views/NotFoundView.vue");

const LOGIN_ROUTE = "@main/login";
const HOME_ROUTE = "@main/home";
const NOT_FOUND_ROUTE = "@main/notfound";

export default [
  {
    path: "/",
    component: LoginView,
    name: LOGIN_ROUTE,
    beforeEnter: (to: Route, from: Route, next: NavigationGuardNext<Vue>) => {
      if (getUser() !== null) {
        next({
          name: HOME_ROUTE,
        });
      } else {
        next();
      }
    },
  },
  {
    path: "/home",
    component: HomeView,
    name: HOME_ROUTE,
    meta: {
      requiresAuth: true,
    },
    children: [
      { path: "/posts", component: HomeView },
      { path: "*", component: NotFoundView },
    ],
  },
  { path: "*", name: NOT_FOUND_ROUTE, component: NotFoundView },
] as RouteConfig[];
