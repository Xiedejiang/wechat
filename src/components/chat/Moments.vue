<template>
  <div class="box">
    <div class="header">发现</div>
    <ul>
      <keep-alive>
        <router-link to="/focuspyq">
          <li class="pyq">
            <i class="el-icon-picture-outline" style="color:#b2a7df"></i>
            <p>朋友圈</p>
            <i class="el-icon-arrow-right"></i>
          </li>
        </router-link>
      </keep-alive>
      <li class="video">
        <i class="el-icon-coin" style="color:#e7c18f"></i>
        <p>视频号</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="scan">
        <i class="el-icon-menu" style="color:#6e9ccc"></i>
        <p>扫一扫</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="shake">
        <i class="el-icon-folder-opened" style="color:#5ca0d9"></i>
        <p>摇一摇</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="look">
        <i class="el-icon-view" style="color:#ebc953"></i>
        <p>看一看</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="search">
        <i class="el-icon-chat-square" style="color:#d36f64"></i>
        <p>搜一搜</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="near">
        <i class="el-icon-position" style="color:#7aa1d2"></i>
        <p>直播和附近</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="shop">
        <i class="el-icon-coffee-cup" style="color:#e0766c"></i>
        <p>购物</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="game">
        <i class="el-icon-bicycle" style="color:#d1a87b"></i>
        <p>游戏</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="routline">
        <i class="el-icon-orange" style="color:#8e8bdf"></i>
        <p>小程序</p>
        <i class="el-icon-arrow-right"></i>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    beforeCreate(){
      this.$parent.$emit("changeDefaultIndex","3");  //用来更改导航索引
    }
  }
</script>

<style lang="scss" scoped="scoped">
  
  a {
    color:black;
    text-decoration: none;
  }
  
  .router-link-active {
    text-decoration: none;
  }
  
  .box{
    width:100%;height:95vh;
    background-color: #ededed;
    .header{
      width:100%;height:60px;
      line-height: 60px;
      text-align:center;
      font-size: 20px;
      background-color: #ededed;
      position: fixed;
      top: 0;z-index: 999;
    }
  }
  ul{
    width:100%;
    list-style: none;
    margin: 60px 0 0 0;padding: 0;
    li{
      list-style: none;
      height:55px;
      display: flex;
      align-items: center;
      justify-content: space-evenly;
      background-color: #fff;
      border-bottom: 1px solid #ededed;
      p{
        width:300px;
      }
    }
  }
  i{
    color:#7d7d7d;
    font-size: 20px;
  }
  .video{
    margin:10px 0 10px 0;
  }
  .look{
    margin-top: 10px;
  }
  .search{
    margin-bottom: 10px;
  }
  .near{
    margin: 10px 0;
  }
  .routline{
    margin-top: 10px;
  }
</style>
