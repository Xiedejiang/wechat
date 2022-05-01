<template>
  <div>
    <el-header>
      
    </el-header>
    <el-main>
    </el-main>
  </div>
</template>

<script >
  export default {
    data(){
      return {
        
      }
    },
    methods:{
      
    },
    created() {
      
    }
  }
</script>

<style lang="scss" scoped="scoped">
  @import "../../assets/css/config.scss";
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
</style>
