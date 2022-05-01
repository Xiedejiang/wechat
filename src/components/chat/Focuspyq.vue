<template>
  <div>
    <el-header>
      <router-link to="/moments" class="el-icon-arrow-left back"></router-link>
      <span>朋友圈</span>
      <router-link to="/sendpyq" class="el-icon-camera photo"></router-link>
    </el-header>
    <el-main>
      <div class="content">
        <div v-for="m in my" class="bg">
          <span class="my_nick">{{m.nickname}}</span>
          <img :src="'../../'+m.pic" class="my_avatar">
        </div>
        <ul class="lists">
          <li class="list" v-for="p in pyq">
             <img :src="'../../'+p.pic" class="avatar_p">
             <div>
               <h3>{{p.nickname}}</h3>
               <h4>{{p.pmsg}}</h4>
               <div v-if="p.picture.length>0">
                 <img v-for="i in p.picture" :src="'../../'+i" class="pgone">
               </div>
             </div>
          </li>
        </ul>
      </div>
    </el-main>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        my:[],
        pyq:[],
        picture:[],
      }
    },
    methods:{
      mymsg(){
        this.$http.get("/users/mymsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.my = data.data;
        })
      },
      pyqmsg(){
        this.$http.get("/users/upmsg?uid="+sessionStorage.getItem("uid")).then(data=>{
          data.data.forEach(f=>{
            if(f.picture.length > 0){
              f.picture = f.picture.split(";")
            }
          })
          this.pyq = data.data;
        })
      }
    },
    created() {
      this.mymsg();
      this.pyqmsg();
    }
  }
</script>

<style lang="scss" scoped>
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
  }

  .el-main{
    margin-top: 60px;
    padding: 0;
  }

  .avatar_p{

  }

  .my_nick{
    position: absolute;
    z-index: 999;
    right:80px;
    bottom: 0;
    color:white;
  }

  .my_avatar{
    position: absolute;
    right: 10px;
    bottom: -15px;
  }

  .bg{
    width:100%;height:300px;
    background: url("../../assets/images/pyq_bg.jpg");
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

  .photo{
    margin-top:20px;margin-right: 15px;
  }

  .content{
    width:100%;height:100vh;
    overflow: auto;
  }

  .lists{
    width: calc(100% - 40px);
    padding: 20px;
  }
  li.list{
    border-bottom: 1px solid #ededed;
    display: flex;
    align-items: flex-start;
    img{
      width:50px;height:50px;
      margin-bottom: 10px;
    }
    div{
      h3{
        color:#6c788c;
        padding: 0px 0 5px 10px;
        margin: 0;
      }
      h4{
        width:300px;
        // height:100px;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 4;
        overflow: hidden;
        padding: 0px 0 0px 10px;
        margin: 0;
      }
      .pgone{
        margin-left: 5px;
      }
      img{
        width:90px;height:90px;
        margin-top: 5px;
      }
    }
  }

  .more{
    margin-top: 170px;
  }
</style>
