<template>
  <div>
    <el-header>
      <router-link to="/mydetail" class="el-icon-arrow-left back"></router-link>
      <span>修改头像</span>
      <i class="el-icon-more more"></i>
    </el-header>
    <el-main>
      <form action="/api/users/mydetail" method="post" enctype="multipart/form-data">
        <input type="file"  name="avatar" />
        <input type="text"  name="uid" v-model="my.uid" v-show="false" />
        <input type="submit" value="提 交" class="submit"/>
      </form>
      <!-- <div>
        <img src="uploads\a567660efb6a105e712fe78a8280624b.jpg">
      </div> -->
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
    methods:{
      //更换头像

      mymsg(){
        this.$http.get("/users/mymsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.my = data.data[0];
          // console.log(this.my.uid)
        })
      },
    },
    created() {
      this.mymsg();
    }
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
