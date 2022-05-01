<template>
  <el-container>
    <el-header>
      <header-component>
        微信
      </header-component>
    </el-header>
    <el-main>
      <ul class="lists">
        <li v-for="f in friends" @click="chat(f)">
          <img :src="f.pic" >
          <span >{{f.nickname}}</span>
          <!-- <el-button type="primary" icon="el-icon-delete" >
          </el-button> -->
        </li>
      </ul>
    </el-main>
  </el-container>
</template>

<script>
  //导入公共头部
  import Header from "./Header.vue";
  export default {
    data(){
      return {
        friends:[]
      }
    },
    methods:{
      getAllFriends(){
        this.$http.get("/users/getAllFriends?uid="+sessionStorage.getItem("uid")).then(data=>{
          this.friends = data.data;
          // console.log(this.friends);
        })
      },
      chat(f){
        this.$router.push({path:"/chat/"+encodeURIComponent(JSON.stringify(f))});
      },

    },
    created() {
      this.getAllFriends();
    },
    beforeCreate(){
      this.$parent.$emit("changeDefaultIndex","1");  //用来更改导航索引
    },
    components:{
      "header-component":Header
    }
  }
</script>

<style lang="scss">
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
      i{
        font-size:25px;
      }
    }
  }

  img{
    width:50px;height:50px;
  }

  .el-menu-item{
    padding: 0;
  }
</style>
