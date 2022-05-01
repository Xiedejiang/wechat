<template>
  <div id="box">
    <el-header>
      <keep-alive>
        <router-link to="/me" class="el-icon-arrow-left back"></router-link>
      </keep-alive>
      <span>个人信息</span>
      <i></i>
    </el-header>
    <ul v-for="m in my" >
      <router-link to="/changeAvatar">
        <li class="pay">
          <p>头像</p>
          <img :src="'../../'+m.pic">
          <i class="el-icon-arrow-right"></i>
        </li>
      </router-link>
      <router-link to="/changeNick">
        <li>
          <p>名字</p>
          <h4>{{m.nickname}}</h4>
          <i class="el-icon-arrow-right"></i>
        </li>
      </router-link>
      <li>
        <p>微信号</p>
        <h4>{{m.username}}</h4>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <p>更多</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="setting">
        <p>我的地址</p>
        <i class="el-icon-arrow-right"></i>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        my:[],
      }
    },
    methods:{
      //页面初始话个人信息
      mymsg(){
        this.$http.get("/users/mymsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.my = data.data;
        })
      },
    },
    created(){
      this.mymsg();
    },

  }
</script>

<style lang="scss" scoped="scoped">
  @import "../../assets/css/config.scss";

  a {
    color:black;
    text-decoration: none;
  }

  .router-link-active {
    text-decoration: none;
  }

  #box{
    background-color: #ededed;
  }

  img{
    width:50px;height:50px;
    border-radius: 5px;
  }
  .el-header{
    height:60px;
    display: flex;
    justify-content: space-between;
    position: fixed;
    top:0;z-index: 999;
    i{
      margin:20px 10px 0 0 ;
    }
  }

  .back {
    float: left;
    font-size: 22px;
    line-height: 60px;
    text-decoration: none;
    color: black;
    margin-left: 5px;
  }

  ul{
    width:100%;
    list-style: none;
    margin: 60px 0 0 0;padding: 0 ;
    li{
      list-style: none;
      height:60px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: #fff;
      border-bottom: 1px solid #ededed;
      padding: 0 20px;
      p{
        width:300px;
      }
      h4{
        width:200px;
        text-align: right;
      }
    }
  }
</style>
