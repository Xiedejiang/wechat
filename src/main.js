// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';  //引入ElementUI框架
import 'element-ui/lib/theme-chalk/index.css';
import Axios from 'axios';  //导入axios
import store from './store/store.js';  //导入store

Vue.config.productionTip = false
Vue.use(ElementUI);  //绑定依赖
Axios.defaults.baseURL = process.env.NODE_ENV == "development" ? "/api" : "http://localhost:3000";
Vue.prototype.$http = Axios; //将axios绑定在vue原型上

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  store  //通过根实例的store选项为所有的子组件注入store
})
