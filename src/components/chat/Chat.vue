<template>
  <div>
    <el-header>
      <router-link to="/chatlist" class="el-icon-arrow-left back"></router-link>
      <span>{{finfo.nickname}}</span>
      <!-- <router-link to="/more/:uid" class="el-icon-more more"></router-link> -->
      <router-link :to="'/frienddel/'+finfo.uid" class="el-icon-more more"></router-link>
    </el-header>
    <div>
      <ul id="content">
        <li v-for="f in m_msg" :class="f.cla">
          <img :src="'../../'+f.pic" id="profile">
          <span class="contentBox">{{f.msg}}</span>
        </li>
      </ul>
    </div>
    <el-footer>
      <el-input v-model="msg" placeholder="请输入内容" id="input"></el-input>
      <el-button type="success" @click="sendMsg" id="send">发送</el-button>
    </el-footer>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        msg: '',
        finfo: {},
        avatar:sessionStorage.getItem("pic"),
        m_msg:[sessionStorage.getItem("pic")],
      }
    },
    methods:{
      sendMsg(){
        if(!this.msg){
          this.$message.error('消息不能为空！~');
        }else{
          //发送信息
          this.$parent.socket.emit("onMsg",{uid:sessionStorage.getItem("uid"),fid:this.finfo.uid,msg:this.msg,pic:sessionStorage.getItem("pic")});
        }

      },
      receive(){
        this.$http.get(`/users/receivemsg?uid=${sessionStorage.getItem("uid")}&fid=${this.finfo.uid}`).then(data=>{
          // console.log(data);
          data.data=data.data.map(data=>{
            if(sessionStorage.getItem("uid") == data.uid){
              data.pic=this.avatar;
              data.cla="right"
            }else{
              data.pic=this.finfo.pic;
              data.cla="left"
            }
            return data
          });
          this.m_msg=data.data;
          this.msg = "";
        })
      },
      more(){
        this.$router.push({ name: 'More', params: { uid: sessionStorage.getItem("uid") } });
      }
    },
    created() {
      let list = decodeURIComponent(this.$route.params.fobj);
      this.finfo = JSON.parse(list);
      this.receive();
      let _this = this;
      //监听服务端发回的信息
      this.$parent.socket.on("receiveMsg",function(data){
        if(sessionStorage.getItem("uid") == data.uid){
          // data.pic=_this.avatar;
          data.cla="right"
        }else{
          data.pic=_this.finfo.pic;
          data.cla="left"
        }
        _this.m_msg.push(data);
        _this.msg = "";
      })
    },
    watch:{
      //消息页自动从最底开始
      m_msg:function(){
        this.$nextTick(function(){
          let ele = document.getElementById('content');
          ele.scrollTop = ele.scrollHeight;
        })
      }
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
      margin:0px 10px 0 0 ;
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

  .more {
    float: right;
    font-size: 22px;
    line-height: 60px;
    text-decoration: none;
    color: black;
    margin-left: 5px;
  }

  //聊天内容载体 --ul
  #content {
    height:80vh;
    margin: 10px 0;
    padding: 0;
    list-style: none;
    width: 100%;
    overflow: overlay;
    padding: 0px 10px;
    box-sizing: border-box;
    margin-top: 60px;
    li {
      display: flex;
      width: 100%;
      margin-top: 5px;
      align-items: center;
    }

    #profile {
      width: 50px;
      border-radius: 5px;
    }

    .contentBox {
      border: 1px #ccc solid;
      padding: 5px;
      border-radius: 5px;
      position: relative;
      word-wrap: break-word;
      margin-left: 10px;
    }

    .left>.contentBox::before {
      content: "";
      width: 10px;
      height: 10px;
      border: 1px #ccc solid;
      transform: rotateZ(-45deg);
      position: absolute;
      top: 10px;
      left: -7px;
      border-bottom: 0;
      border-right: 0;
      z-index: 1;
      background-color: #fff;
    }

    .right {
      flex-direction: row-reverse;
    }

    .right>.contentBox {
      margin-right: 10px;
      background-color: #9eea6a;
    }

    .right>.contentBox::after {
      content: "";
      width: 10px;
      height: 10px;
      border: 1px #ccc solid;
      position: absolute;
      top: 10px;
      rigth: 0px;
      transform: rotateZ(135deg);
      border-bottom: 0;
      border-right: 0;
      z-index: 1;
      background-color: #9eea6a;
    }
  }

  //底部
  .el-footer {
    height:60px;
    display: flex;
    position: fixed;
    z-index: 999;
    bottom: 0;
    width: 100%;
    background-color: #F4F4F5;
    align-items: center;

    .el-input {
      margin-right: 10px;
    }
  }
</style>
