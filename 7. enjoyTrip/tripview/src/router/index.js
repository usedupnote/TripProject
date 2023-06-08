import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "entry",
    component: () => import("@/views/EntryView.vue"),
  },
  {
    path: "/main",
    name: "main",
    component: () => import("@/views/MainView.vue"),
  },
  {
    path: "/trip/:location",
    component: () => import("@/views/TripView.vue"),
    name: "trip",
  },
  {
    path: "/board",
    name: "board",
    component: () => import("@/views/BoardView.vue"),
    redirect: "/board/list",
    children: [
      {
        path: "list",
        name: "boardlist",
        component: () => import(/* webpackChunkName: "board" */ "@/components/board/BoardList"),
      },
      {
        path: "/write",
        name: "boardwrite",
        // beforeEnter: onlyAuthUser,
        component: () => import(/* webpackChunkName: "board" */ "@/components/board/BoardWrite"),
      },
      {
        path: "/view/:id",
        name: "boardview",
        // beforeEnter: onlyAuthUser,
        component: () => import(/* webpackChunkName: "board" */ "@/components/board/BoardView"),
      },
      {
        path: "/modify",
        name: "boardmodify",
        // beforeEnter: onlyAuthUser,
        component: () => import(/* webpackChunkName: "board" */ "@/components/board/BoardModify"),
      },
      {
        path: "/delete/:id",
        name: "boarddelete",
        // beforeEnter: onlyAuthUser,
        component: () => import(/* webpackChunkName: "board" */ "@/components/board/BoardDelete"),
      },
    ],
  },
  {
    path: "/about",
    name: "about",
    component: () => import("@/views/AboutView.vue"),
  },
  {
    path: "/login",
    name: "login",
    component: () => import("@/views/LoginView.vue"),
  },
  {
    path: "/mypage",
    component: () => import("@/views/MyPageView.vue"),
    name: "mypage",
  },
  {
    path: "/myplan",
    component: () => import("@/views/MyPlanView.vue"),
    name: "myplan",
  },
  {
    path: "/regist",
    component: () => import("@/views/RegistView.vue"),
    name: "regist",
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
