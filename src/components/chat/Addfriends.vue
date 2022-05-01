<template>
  <el-container>
    <el-header>添加好友</el-header>
    <el-main>
      <el-autocomplete
        popper-class="my-autocomplete"
        v-model="state"
        :trigger-on-focus="false"
        :fetch-suggestions="searchFriend"
        placeholder="请输入昵称">
        <i
          class="el-icon-search el-input__icon"
          slot="suffix">
        </i>
        <template slot-scope="{ item }">
          <div class="items">
            <div class="pic"><img :src="item.pic"></div>
            <div class="nickname">{{item.nickname}}</div>
            <div class="btn" v-if="item.vif"><el-button type="success" @click="addFriend(item.uid)">加好友</el-button></div>
          </div>
        </template>
      </el-autocomplete>

      <ul class="lists">
        <li v-for="f in allMsg">
          <img :src="f.pic">
          <span>{{f.nickname}}</span>
          <el-button type="info" plain disabled v-if="f.btn==1">已接收</el-button>
          <el-button type="info" plain disabled v-if="f.btn==2">已拒绝</el-button>
          <el-button type="info" plain disabled v-if="f.btn==3">已过期</el-button>
          <el-button type="success" plain v-if="f.btn==4"  @click="isPass(1,f.mid)">接受</el-button>
          <el-button type="danger" plain v-if="f.btn==4" @click="isPass(2,f.mid)">拒绝</el-button>
        </li>
      </ul>
    </el-main>
  </el-container>
</template>

<script>
  export default {
    props:["fmsg"],
    data() {
      return {
        state: "",
        allMsg:[]
      };
    },
    methods: {
      async searchFriend(nickname, cb) {
        //默认数据 没有搜索用户
        let results = [{pic:require("@/assets/images/unkown.jpg"),nickname:"输入关键字才能搜索哦~",vif:false}];
        if(nickname != "")
          //请求数据库,获取用户
          results = await this.$http.get("/users/search?nickname="+nickname+"&uid="+sessionStorage.getItem('uid')).then(data=>{
            if(data.data.length > 0){
              return data.data;
            }else{
              return [{pic:require("@/assets/images/unkown.jpg"),nickname:"找不到用户~",vif:false}];
            }
          })
        // 调用 callback 返回建议列表的数据
        cb(results);
      },
      addFriend(uid){
        //跳转到发送好友申请界面
        // this.$router.replace({path:"sendfriendmsg/"+uid});
        this.$http.get(`/users/addfriends?from_a=${sessionStorage.getItem("uid")}&to_b=${uid}`).then(data=>{
          if(data.data.errCode == 0){
            this.$message({
              message:'好友申请发送成功~',
              type:'success'
            });
          }else if(data.data.errCode == 2){
            this.$message.error('对方已是您的好友！三天内不能重复申请~');
          }else{
            this.$message.error('好友申请发送失败~');
          }
        });
      },
      //查询好友申请信息
      getAllFriendMsg(){
        this.$http.get(`/users/getAllFriendMsg?uid=${sessionStorage.getItem("uid")}`).then(data=>{
          // console.log(data);
          this.allMsg = data.data.map(m=>{
            if(m.ispass == 1){
              //已接受申请
              m.btn = 1;
            }else if(m.ispass == 2){
              //已拒绝
              m.btn = 2;
            }else if(m.ispass == 0){
              let exptime = new Date().getTime() - 60*60*24*1000*3; //过期时间
              if(m.systime < exptime){
                m.btn = 3;  //已过期
              }else{
                m.btn=4;  //可操作
              }
            }
            return m;
          });
        })
      },
      //更新消息已读状态
      updateFriendMsg(){
        this.$http.get(`/users/updateFriendMsg?uid=${sessionStorage.getItem("uid")}`).then(data=>{
          if(data.data.affectedRows){
            this.$parent.$emit("updateFmsg");
          }
        })
      },
      //接受或拒绝好友申请
      isPass(val,mid){
        this.$http.get(`/users/isPass?mid=${mid}&ispass=${val}`).then(data=>{
          // console.log(data.data);
          if(data.data.affectedRows > 0){  //更新成功，更新页面中申请的接受状态
          for(let i = 0;i < this.allMsg.length;i++){
            if(this.allMsg[i].mid == mid){
              this.allMsg[i].btn = val;
              break;
            }
          }
          }
        })
      }
    },
    beforeCreate(){
      this.$parent.$emit("changeDefaultIndex","2");  //用来更改导航索引
    },
    watch:{
      fmsg:function(val,oldval){
        //只要有新的申请信息，就查询好友申请
        if(val > oldval){
          this.getAllFriendMsg();
          this.updateFriendMsg();
        }
      }
    },
    created(){
      this.getAllFriendMsg();
      if(this.fmsg > 0){
        this.updateFriendMsg();
      }
    }
  }

</script>

<style lang="scss" scoped="scoped">
  @import "../../assets/css/config.scss"; //以当前文件所在的位置去加载
  .el-header {
    background-color:#eaeaea;
    color:black;
    text-align: center;
    line-height: 60px;
    a{
      text-decoration: none;
    }
  }
  .el-menu-item{
    padding: 0;
  }

  .el-autocomplete{
    width: 100%;
    .my-autocomplete {
      li {
        line-height: normal;
        padding: 7px;
      }
    }
  }

  .items{
    display: flex;
    align-items: center;
    margin: 5px 0;
    .nickname {
      padding-left: 5px;
      text-overflow: ellipsis;
      overflow: hidden;
      flex: auto;
    }
    .pic{
      width:50px;height:50px;
      img{
        width:100%;
        vertical-align: middle;
      }
    }
  }

  // .lists{
  //   li{
  //     .el-button{
  //       padding: 0;
  //     }
  //   }
  // }
</style>
