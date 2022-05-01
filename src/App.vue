<template>
  <div id="app">
    <!-- 路由组件 -->
    <router-view/>
  </div>
</template>

<script>
  import { io } from "socket.io-client";
export default {
  name: 'App',
  data(){
    return {
      socket:null
    }
  },
  beforeCreate() {
    let _this = this;
    this.$on("connSocket",function(){
      //连接socket服务器
      const socket = io("http://localhost:3000");
      socket.on("connect",()=>{
        console.log("已连接socket服务器");
        _this.socket = socket;
        _this.socket.emit("onLine",sessionStorage.getItem("uid"));  //上线
      });
    })
  }
}
</script>

<style lang="scss">
$black:"#303133";
body{
  padding: 0;
  margin: 0;
}
</style>
