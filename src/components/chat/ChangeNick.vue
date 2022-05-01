<template>
  <div>
    <el-header>
      <router-link to="/mydetail" class="el-icon-arrow-left back"></router-link>
      <span>修改昵称</span>
      <i class="el-icon-more more"></i>
    </el-header>
    <el-main>
      <form action="/api/users/cnick" method="post">
        <input type="text"  name="nickname" placeholder="请输入修改的昵称" />
        <input type="text"  name="uid" v-model="my.uid" v-show="false" />
        <input type="submit" value="提 交" class="submit"/>
      </form>
    </el-main>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        my:{"uid":sessionStorage.getItem("uid")},
      }
    },
  }
</script>

<style lang="scss" scoped="scoped">
  @import "../../assets/css/config.scss";

  .el-header{
    height:60px;
    display: flex;
    background-color: black;
    justify-content: space-between;
    position: fixed;
    top:0;z-index: 999;
    span{
      color:white
    }
    i{
      margin:0px 10px 0 0 ;
    }
  }

  .back {
    float: left;
    font-size: 22px;
    line-height: 60px;
    text-decoration: none;
    color: white;
    margin-left: 5px;
  }

  .more {
    float: right;
    font-size: 22px;
    line-height: 60px;
    text-decoration: none;
    color: white;
    margin-left: 5px;
  }

  div{
    width:100%;
    // height:calc(100% - 60px);
    box-sizing: border-box;
    // outline: 1px solid red;
    margin-top: 60px;
    img{
      width:100%;
    }
  }

  .el-main{
    form{
      width:100%;
      overflow: hidden;
      input{
        height:30px;
        width:80%;
      }
      .submit{
        width:25%;height:30px;
      }
    }
  }
</style>
