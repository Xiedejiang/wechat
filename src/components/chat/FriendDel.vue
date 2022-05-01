<template>
  <div id="box">
    <el-header>
      <router-link to="/friends" class="el-icon-arrow-left back"></router-link>
    </el-header>
    <div class="header">
      <div class="header_content" v-for="f in friend">
        <img :src="'../../'+f.pic">
        <div>
          <h3>{{f.nickname}}</h3>
          <p>微信号：<span>{{f.username}}</span></p>
          <p>地区:中国大陆</p>
        </div>
      </div>
    </div>
    <ul>
      <li class="tag">
        <p>标签</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="set">
        <p>朋友权限</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li>
        <p>更多信息</p>
        <i class="el-icon-arrow-right"></i>
      </li>
      <li class="delete" v-on:click="frienddel();logout()" >
        <p>删除好友</p>

      </li>
      <li class="return_s" @click="goback()">
        <p>返回好友页面</p>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        friend:[],
      }
    },
    methods:{
      friendmsg(){
        this.$http.get(`/users/friendmsg?fid=${this.$route.params.fid}`).then(data=>{
          this.friend = data.data;
        })
      },
      frienddel(){
          this.$http.get(`/users/frienddel?fid=${this.$route.params.fid}`).then(data=>data);
           
      },
      logout(){
         this.$confirm('此操作将删除好友, 是否继续?', '提示', {
             confirmButtonText: '确定',
             cancelButtonText: '取消',
             type: 'warning'
         }).then(() => {
             this.$router.push('/friends');
         }).catch(() => {
             this.$message({
             type: 'info',
             message: '已取消操作'
             });
         });
      },
      goback(){
        this.$router.go(-1);
      }
    },
    created() {
      this.friendmsg();
      this.frienddel();
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

  #box{
    width:100%;height:90vh;
    background-color: #eaeaea;
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

  img{
    width:50px;height:50px;
  }

  .header{
    display: flex;
    align-items: center;
    width: 100%;height:20vh;
    background-color: white;
    margin-top: 60px;
    // padding: 30px 30px;
  }

  .header_content{
    display: flex;
    background-color: white;
    padding-left: 40px;
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

  ul{
    width:100%;
    list-style: none;
    margin: 0px 0 0 0;padding: 0 ;
    li{
      list-style: none;
      height:60px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      background-color: #fff;
      border-bottom: 1px solid #ededed;
      // padding: 0 20px;
      p{
        width:300px;
      }
      h4{
        width:200px;
        text-align: right;
      }
    }
  }

  .delete{
    width:100%;
    text-align: center;
    display: flex;
    justify-content: center;
    margin-top: 10px;
    p{
      width:200px;height:50px;
      line-height: 50px;
      font-size:20px;
      color:#f56c96;
    }
  }

  .return_s{
    width:100%;
    text-align: center;
    display: flex;
    justify-content: center;
    p{
      width:200px;height:50px;
      line-height: 50px;
      font-size:20px;
      color:#7c87a9;
    }
  }

  .tag{
    border-top: 1px solid #ededed;;
  }
  .set{
    margin-top: 10px;
  }
</style>
