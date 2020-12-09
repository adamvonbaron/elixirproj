import VueRouter, {
  NavigationGuard,
  NavigationGuardNext,
  Route,
  RouteRecord,
} from "vue-router";

import routes from "@/routes";
import { getUser } from "@/services/authentication";

const checkAuthenticated: NavigationGuard<Vue> = (
  to: Route,
  from: Route,
  next: NavigationGuardNext<Vue>
) => {
  if (
    to.matched.some(
      (matchedRoute: RouteRecord) => matchedRoute.meta.requiresAuth
    )
  ) {
    const currentUser = getUser();
    if (currentUser !== null) {
      next();
    } else {
      next({
        path: "/",
      });
    }
  } else {
    next();
  }
};

const router = new VueRouter({
  routes,
  mode: "history",
});

router.beforeEach(checkAuthenticated);

export default router;
