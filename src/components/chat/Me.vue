<template>
  <div class="box">
    <div class="header">
      <div class="header_content" v-for="m in my" v-loading="loading">
        <img :src="'../../'+m.pic">
        <div>
          <h3>{{m.nickname}}</h3>
          <p>微信号：<span>{{m.username}}</span></p>
          <i class="el-icon-circle-plus-outline
"></i>
          <i class="el-icon-refresh-right"></i>
        </div>
        
        <router-link to="/mydetail">
          <i class="el-icon-arrow-right" ></i>
        </router-link>

      </div>
    </div>

    <ul>
      <li class="pay">
        <i class="el-icon-bank-card" style="color:#41b16f"></i>
        <p>支付</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <i class="el-icon-circle-check" style="color:#e8978f"></i>
        <p>收藏</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <i class="el-icon-picture-outline" style="color:#428bd4"></i>
        <p>朋友圈</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <i class="el-icon-folder-opened" style="color:#b2c9f0"></i>
        <p>卡包</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <i class="el-icon-sunny" style="color:#efce7b"></i>
        <p>表情</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="setting">
        <i class="el-icon-setting" style="color:#709ed8"></i>
        <p>设置</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="logout" @click="loginout()">
        <div>退出</div>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        my:[],
        loading:true
      }
    },
    methods:{
      mymsg(){
        this.$http.get("/users/mymsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.my = data.data;
          this.loading=false;
        })
      },
      loginout(){
        this.$confirm('此操作将注销登录, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).then(() => {
            sessionStorage.removeItem("uid");
            sessionStorage.removeItem("pic");
            this.$router.push('/login');
        }).catch(() => {
            this.$message({
            type: 'info',
            message: '已取消操作'
            });
        });
      },
    },
    created() {
      this.mymsg();
    },
    beforeCreate(){
      this.$parent.$emit("changeDefaultIndex","4");  //用来更改导航索引
    }
  }
</script>

<style lang="scss" scoped="scoped">
  .box{
    width:100%;height:95vh;
    background-color: #ededed;
    div{
      width:100%;
      box-sizing: border-box;
      background-color: white;
    }
  }

  ul{
    width:100%;
    list-style: none;
    margin: 0;padding: 0;
    li{
      list-style: none;
      height:60px;
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

  img{
    width:50px;height:50px;
  }

  .header{
    display: flex;
    align-items: center;
    width: 100%;height:20vh;
    padding: 30px 30px;
  }

  .header_content{
    display: flex;
    align-items: center;
    img{
      border-radius: 5px;
    }
    div{
      margin-left: 10px;
      height:100%;
      h3{

        margin: 0;
        padding: 40px 0 0px 0;
      }
      p{
        font-size: 15px;
        color:#7d7d7d;
        margin: 5px 0 ;
      }
    }
  }

  .pay{
    margin:10px 0;
  }
  .setting{
    margin:10px 0;
  }
  i{
    color:#7d7d7d;
    font-size: 20px;
  }

  .logout{
    text-align: center;
    div{
      width:200px;height:50px;
      line-height: 50px;
      font-size:20px;
      // background-color: #f56c96;
      border-radius: 10px;
      cursor: pointer;
      color:#f56c96;
    }
  }
</style>
