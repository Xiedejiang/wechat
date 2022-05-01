import Vue from "vue";
import Vuex from 'vuex'; //导入vuex

Vue.use(Vuex); //安装vuex插件

const store = new Vuex.Store({
  //状态--所有共享的数据
  state:{
    msg:"hello vue",
  },
  //定义依赖状态的属性
  getters:{
    lowerMsg(state){
      return state.msg.toLowerCase();
    }
  },
  //变更状态的方法
  mutations:{
    changeMsg:function(state,val){
      //变更状态
      state.msg = val;
    }
  },
  actions:{
    changeMsg(context){
      context.commit("changeMsg","QwEaSd")
    }
  }
})

export default store;  //导出store
