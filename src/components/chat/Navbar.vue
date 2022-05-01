<template>
  <el-menu
        :default-active="defaultindex"
        class="el-menu-vertical-demo"
        background-color="#eaeaea"
        text-color="#606266"
        active-text-color="#67C23A"
        mode="horizontal">
        <el-menu-item index="1">
          <i class="el-icon-chat-dot-round"></i>
          <router-link to="/chatlist" slot="title">
            <el-badge :value="1" :max="99" class="item" :hidden="true">
              微信
              <!-- {{this.$store.state.msg}} -->
            </el-badge>
          </router-link>
        </el-menu-item>
        <el-menu-item index="2">
          <i class="el-icon-phone-outline"></i>
          <router-link to="/friends" slot="title">
            <el-badge :value="fmsg" :max="99" class="item" :hidden="fhidden">
              通讯录
            </el-badge>
          </router-link>
        </el-menu-item>
        <el-menu-item index="3">
          <i class="el-icon-help"></i>
          <router-link to="/moments" slot="title">
            <el-badge  :max="99" class="item">
              发现
            </el-badge>
          </router-link>
        </el-menu-item>
        <el-menu-item index="4" >
          <i class="el-icon-user"></i>
          <router-link to="/me" slot="title" >我
          <!-- {{$store.getters.lowerMsg}} --></router-link>
        </el-menu-item>
      </el-menu>
</template>

<script>
  export default {
    props:["defaultindex","fmsg"],
    data(){
      return {

      }
    },
    methods:{

    },
    created(){
    },
    computed:{
      fhidden:function(){
        return this.fmsg > 0 ? false : true;
      },
    }
  }
</script>

<style lang="scss">
  .el-menu{
    position: fixed;
    bottom: 0;
    display: flex;
    width:100%;
    .el-menu-item{
      flex:auto;
      text-align: center;
      a{
        font-size: 16px;
        text-decoration: none;
      }
      i{
        font-size: 25px;
      }
    }
  }
  .el-badge__content.is-fixed{
    top:12px;right:6px;
  }
</style>
