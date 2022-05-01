<template>
  <div>
    <keep-alive>
      <router-view :fmsg="friendMsg" ></router-view>
    </keep-alive>
    <nav-bar :defaultindex="defaultIndex" :fmsg="friendMsg"></nav-bar>
  </div>
</template>

<script>
  //导入底部导航
  import Navbar from "./Navbar.vue";
  export default {
    data(){
      return {
        defaultIndex:"1",
        friendMsg:0
      }
    },
    components:{"nav-bar":Navbar},
    methods:{
      checkLogin(){  //验证用户是否登录
        if(!sessionStorage.getItem("uid")){
          //没有登录跳转登录页
          this.$router.replace("login");
        }
      },
      //获取当前用户的未读信息
      //获取当前用户的未读好友申请
      getFriendMsg(){
        this.$http.get("/users/getFriendMsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.friendMsg = data.data;
        })
      }
    },
    created(){
      this.checkLogin();
      this.$on("changeDefaultIndex",function(val){
        this.defaultIndex = val;
      });
      this.getFriendMsg();
      this.$on("updateFmsg",function(){  //当用户读取好友申请后，更新通讯上的气泡
        this.friendMsg = 0;
      });
    }
  }
</script>

<style>
</style>
