<template>
  <el-container>
    <el-header>登录</el-header>
    <el-main>
      <el-form label-position="left" label-width="80px" :rules="rules" :model="registerForm" ref="registerForm">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="registerForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="registerForm.password"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="success" :disabled="isDisabled" @click="login">登录</el-button>
        </el-form-item>
      </el-form>
      <el-row>
        <el-col :span="12">没有账号？点击<router-link to="/register">注册</router-link></el-col>
        <el-col :span="12">忘记密码？点击这里找回</el-col>
      </el-row>
    </el-main>
  </el-container>
</template>

<script>
export default {
  data(){
    return {
      registerForm:{
        username:"",
        password:""
      },
      rules:{  //表单验证规则
        username:[
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 12, message: '长度在 3 到 12 个字符', trigger: 'blur' }
        ],
        password:[
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 3, max: 8, message: '长度在 3 到 8 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods:{
    //登录
    login(){
      //发送请求
      this.$http.post("/users/login",this.registerForm).then(data=>{
        if(data.data.errCode == 0){
          //登录成功 跳转到聊天页
          sessionStorage.setItem("uid",data.data.userInfo.uid);  //保存用户id
           sessionStorage.setItem("nickname",data.data.userInfo.nickname);  //保存用户昵称
          sessionStorage.setItem("pic",data.data.userInfo.pic);  //保存用户头像
          // console.log(data);
          //链接socket服务器
          this.$parent.$emit("connSocket");
          this.$router.push({path:"/"});
        }else{
          this.$message.error('登录失败！用户名或密码错误');
        }
      })
    }
  },
  computed:{    //计算属性
    isDisabled:function(){
      let ureg = /^[\da-zA-Z_]{3,12}$/;
      let preg = /^[\w_]{3,8}$/;
      return (ureg.test(this.registerForm.username) && preg.test(this.registerForm.password)) ? false : true;
    }
  }
}
</script>

<style lang="scss" scoped="scoped">
//导入config.scss
@import  "../../assets/css/config.scss";
.el-header {
  background-color:black;
  color:#fff;
  text-align: center;
  line-height: 60px;
}
.el-button{
  width:100%;
}
</style>
