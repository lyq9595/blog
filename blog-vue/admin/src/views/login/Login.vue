<template>
  <div class="login-container">
    <div class="login-card">
      <div class="login-title" style="margin-bottom: 1rem">管理员登录</div>
      <p style="color: #8c939d">测试账户:test@qq.com 密码:123456</p>
      <!-- 登录表单 -->
      <el-form
        status-icon
        :model="loginForm"
        :rules="rules"
        ref="ruleForm"
        class="login-form"
      >
        <!-- 用户名输入框 -->
        <el-form-item prop="username">
          <el-input
            v-model="loginForm.username"
            prefix-icon="el-icon-user-solid"
            placeholder="用户名"
            value="test@qq.com"

          />
        </el-form-item>
        <!-- 密码输入框 -->
        <el-form-item prop="password">
          <el-input
            v-model="loginForm.password"
            prefix-icon="iconfont el-icon-mymima"
            show-password
            placeholder="密码"
            @keyup.enter.native="login"
          />
        </el-form-item>
      </el-form>
      <!-- 登录按钮 -->

      <el-button
          class="loginBtn"
          :loading="loading"
          type="primary"
          style="width: 100%; margin-bottom: 30px"
          @click="login"
      >登录</el-button>
    </div>
  </div>
</template>

<script>
import { generaMenu } from "../../assets/js/menu";
export default {
  data: function() {
    return {
      loading: false,//登录加载
      loginForm: {
        username: "",
        password: ""
      },
      rules: {
        username: [
          { required: true, message: "用户名不能为空", trigger: "blur" }
        ],
        password: [{ required: true, message: "密码不能为空", trigger: "blur" }]
      }
    };
  },
  methods: {
    login() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {

          const that = this;
          that.loading = true
          // eslint-disable-next-line no-undef
          var captcha = new TencentCaptcha(
            this.config.TENCENT_CAPTCHA,
            function(res) {
              if (res.ret === 0) {
                //发送登录请求
                let param = new URLSearchParams();
                param.append("username", that.loginForm.username);
                param.append("password", that.loginForm.password);
                that.axios.post("/api/login", param).then(({ data }) => {
                  if (data.flag) {
                    // 登录后保存用户信息
                    that.$store.commit("login", data.data);
                    // 加载用户菜单
                    generaMenu();
                    that.$message.success("登录成功");
                    that.$router.push({ path: "/" });
                    // 不论是否执行 还是catch 都去关闭转圈
                    that.loading = false
                  } else {
                    // 不论是否执行 还是catch 都去关闭转圈
                    that.loading = false
                    that.$message.error(data.message);
                  }
                });
              }
              that.loading = false
            }
          );
          // 显示验证码
          captcha.show();
        } else {
          return false;
        }
      });
    }
  }
};
</script>

<style lang="scss" scoped>
$light_gray: #68b0fe;  // 将输入框颜色改成蓝色
.login-container {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  //background: url(http://upload.lyqzzk.top/config/0w3pdr.jpg) center center /
  background: url(http://upload.lyqzzk.top/config/0w3pdr.jpg) center center /
    cover no-repeat;
}

.login-card {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  background: #fff;
  padding: 170px 60px 180px;
  width: 350px;
}
.login-title {
  color: #303133;
  font-weight: bold;
  font-size: 1rem;
}
.login-form {
  margin-top: 1.2rem;
}
//hr改
.login-container{
  .el-input{
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(255, 255, 255, 0.7); // 输入登录表单的背景色
    border-radius: 5px;
    color: #454545;
    input{
      color: $light_gray;
    }
  }
}

.login-card button {
  margin-top: 1rem;
  width: 100%;
}

@media screen and (max-width:759px) {
  .login-container{
    position: relative;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    //background-image: url('../../assets/common/logBg.png'); // 设置背景图片
    background-position: center; // 将图片位置设置为充满整个屏幕
  }
}
</style>
