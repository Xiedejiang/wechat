<template>
 <el-header>
   <slot></slot>
   <el-dropdown>
     <span class="el-dropdown-link">
       <i class="el-icon-circle-plus-outline"></i>
     </span>
     <el-dropdown-menu slot="dropdown">
       <el-dropdown-item>搜索</el-dropdown-item>
       <!-- <el-dropdown-item @click="addfrind">添加好友</el-dropdown-item> -->
       <!-- <router-link to="/addfriends" class="el-dropdown-menu__item">添加好友</router-link> -->
       <router-link to="/addfriends">
         <el-dropdown-item>添加好友</el-dropdown-item>
       </router-link>
     </el-dropdown-menu>
   </el-dropdown>
 </el-header>
</template>
<script>
  export default{
    data(){
      return{

      }
    },
    methods:{
      //加好友要先搜索好友再添加--即再出来个input框

    }
  }
</script>
<style lang="scss" scoped="scoped">
  @import "../../assets/css/config.scss"; //以当前文件所在的位置去加载
  .el-dropdown{
    float: right;
    .el-dropdown-link{
      font-size: 22px;
    }
  }
  a{
    text-decoration: none;
  }
</style>
