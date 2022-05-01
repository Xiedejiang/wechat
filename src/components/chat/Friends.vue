<template>
  <el-container>
    <el-header>
      <header-component>通讯录</header-component>
    </el-header>
    <el-main>
      <ul class="lists">
        <li @click="showMsg">
          <img src="~@/assets/images/newfriend.jpg">
          <span>新的朋友</span>
          <el-badge :value="fmsg" :max="99" class="item" :hidden="fhidden">
          </el-badge>
          <i class="el-icon-arrow-right"></i>
        </li>
        <li v-for="f in friends" @click="chat(f)">
          <img :src="f.pic">
          <span>{{f.nickname}}</span>
        </li>
      </ul>
    </el-main>
  </el-container>
</template>

<script>
  //导入公共头部
  import Header from "./Header.vue";
  export default {
    props:["fmsg"],
    data(){
      return {
        friends:[]
      }
    },
    methods:{
      showMsg(){
        this.$router.push({path:"addfriends"});
      },
      getAllFriends(){
        this.$http.get("/users/getAllFriends?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.friends = data.data;
        })
      },
      chat(f){
        this.$router.push({path:"/chat/"+encodeURIComponent(JSON.stringify(f))});
      },
    },
    components:{
      "header-component":Header
    },
    beforeCreate(){
      this.$parent.$emit("changeDefaultIndex","2");  //用来更改导航索引
    },
    created() {
      this.getAllFriends();
    },
    computed:{
      fhidden:function(){
        return this.fmsg > 0 ? false : true;
      },
    }
  }
</script>

<style lang="scss" scoped="scoped">
@import  "../../assets/css/config.scss";
  .el-header {
    background-color:#eaeaea;
    color:black;
    text-align: center;
    line-height: 60px;
    .el-dropdown{
      position: absolute;
      right:0;
      margin-right: 10px;
      background-color: transparent;
      i{
        font-size:25px;
      }
    }
  }

  .el-menu-item{
    padding: 0;
  }

  img{
    width:50px;height:50px;
  }
  // .el-main{
  //   padding: 0;
  // }

</style>
