<template>
  <div>
    <el-header>
      <router-link to="/focuspyq" class="el-icon-arrow-left back"></router-link>
      <p>这一刻的想法...</p>
    </el-header>
    <el-main>
      <form action="/api/users/up" method="post" enctype="multipart/form-data">
        <input type="text"  name="uid" v-model="my.uid" v-show="false">
        <input type="file" multiple="multiple"  name="picture" style="margin-left: 25px;margin-top: 10px;"/>
        <textarea name="pmsg" class="content" style="resize: none;width:350px;height:150px;margin-left: 25px;margin-top: 10px;"></textarea>
        <button class="submit" style="width:80px;height:30px;line-height: 30px;margin-left: 25px;">完 成</button>
      </form>
    </el-main>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        my:{"uid":sessionStorage.getItem("uid"),"nickname":sessionStorage.getItem("nickname"),"pic":sessionStorage.getItem("pic")},
      }
    },
    methods:{

    }
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

  ul{
    li{
      list-style: none;
    }
  }
  img{
    width:60px;height:60px;
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
    p{
      width:200px;
      height:60px;
      margin: 0;
      line-height: 60px;
      padding-right: 110px;
    }
  }

  .el-main{
    margin-top: 60px;
    padding: 0;
  }

  .my_nick{
    position: absolute;
    z-index: 999;
    right:80px;
    bottom: 0;
    color:white;
  }

  .my_avatar{
    position: absolute;z-index: 999;
    right: 10px;
    bottom: -15px;
  }

  .bg{
    width:100%;height:300px;
    background: url("../../assets/images/unkown.jpg");
    background-size:cover;
    position: relative;
  }

  .back {
    float: left;
    font-size: 22px;
    line-height: 60px;
    text-decoration: none;
    color: black;
    margin-left: 5px;
  }

  // .content{
  //   max-width:90vw;max-height: 200px;
  //   margin-left: 20px;
  // }

  .submit{
    border-width:0;
    width:50px;height:25px;
    line-height: 25px;
    border-radius: 5px;
    background-color: #00be5c;
    color: white;
    margin-left: 20px;
  }
</style>
