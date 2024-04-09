

## 技术介绍

**前端：** vue + vuex + vue-router + axios + vuetify + element + echarts

**后端：** SpringBoot + nginx + docker + SpringSecurity + Swagger2 + MyBatisPlus + Mysql + Redis + elasticsearch + RabbitMQ + MaxWell + Websocket

**其他：** 接入QQ，微博第三方登录，接入腾讯云人机验证、websocket

## 在线地址

**项目链接：** [www.lyqzzk.top](http://www.lyqzzk.top)

**后台链接：** [www.admin.lyqzzk.top](http://admin.lyqzzk.top)

测试账号：test@qq.com，密码：123456，可登入后台查看。

**Github地址：**[https://github.com/lyq9595/blog](https://github.com/lyq9595/blog)

**Gitee地址：** [https://gitee.com/li_lyq/blog](https://gitee.com/li_lyq/blog)

您的star是我坚持的动力，感谢大家的支持，欢迎提交pr共同改进项目。

## 目录结构

前端项目位于blog-vue下，blog为前台，admin为后台。

后端项目位于blog-springboot下。

SQL文件位于根目录下的blog.sql，需要MYSQL8以上版本。

接口文档地址：后端项目启动后，访问http://127.0.0.1:8080/swagger-ui.html

可直接导入该项目于本地，修改后端配置文件中的数据库等连接信息，项目中使用到的关于阿里云功能和第三方授权登录等需要自行开通。

当你克隆项目到本地后可使用邮箱账号：admin@qq.com，密码：123456 进行登录，也可自行注册账号并将其修改为admin角色。

**ps：** 请先运行后端项目，再启动前端项目，前端项目配置由后端动态加载。

```
blog-springboot
├── annotation    --  自定义注解
├── aspect        --  aop模块
├── config        --  配置模块
├── constant      --  常量模块
├── consumer      --  MQ消费者模块
├── controller    --  控制器模块
├── dao           --  框架核心模块
├── dto           --  dto模块
├── enums         --  枚举模块
├── exception     --  自定义异常模块
├── handler       --  处理器模块（扩展Security过滤器，自定义Security提示信息等）
├── service       --  服务模块
├── strategy      --  策略模块（用于扩展第三方登录，搜索模式，上传文件模式等策略）
├── util          --  工具类模块
└── vo            --  vo模块
```

## 项目特点

- 前台参考"Hexo"的"Butterfly"设计，美观简洁，响应式体验好。
- 后台参考"element-admin"设计，侧边栏，历史标签，面包屑自动生成。
- 采用Markdown编辑器，写法简单。
- 评论支持表情输入回复等，样式参考Valine。
- 添加音乐播放器，支持在线搜索歌曲。
- 前后端分离部署，适应当前潮流。
- 接入第三方登录，减少注册成本。
- 留言采用弹幕墙，更加炫酷。
- 支持代码高亮和复制，图片预览，深色模式等功能，提升用户体验。
- 搜索文章支持高亮分词，响应速度快。
- 新增文章目录、推荐文章等功能，优化用户体验。
- 新增在线聊天室，支持撤回、语音输入、统计未读数量等功能。
- 新增aop注解实现日志管理。  
- 支持动态权限修改，采用RBAC模型，前端菜单和后台权限实时更新。
- 后台管理支持修改背景图片，博客配置等信息，操作简单，支持上传相册。
- 代码支持多种搜索模式（Elasticsearch或MYSQL），支持多种上传模式（OSS或本地），可支持配置。
- 代码遵循阿里巴巴开发规范，利于开发者学习。



## 运行环境

**服务器：** 阿里云2核4G CentOS7.8

**CDN：** 阿里云全站加速

**对象存储：** 阿里云OSS

**最低配置：** 1核2G服务器（不用ElasticSearch情况下）

**推荐配置：** 2核4G服务器

## 项目截图

![](https://lyqblog.oss-cn-beijing.aliyuncs.com/1712657632324.png)



![](https://lyqblog.oss-cn-beijing.aliyuncs.com/1712656470284.png)

![](https://lyqblog.oss-cn-beijing.aliyuncs.com/1712655907667.png)

## 快速开始

### 项目环境安装

详见文章[Docker安装运行环境](http://lyqzzk.top/articles/82)

### 项目配置

详见文章[项目配置教程](http://lyqzzk.top/articles/83)

### Docker部署项目

详见文章[项目部署教程](http://lyqzzk.top/articles/84)

## 注意事项

- 项目拉下来运行后，可到后台管理页面网站配置处修改博客配置信息.
- 邮箱配置，第三方授权配置需要自己申请。
- ElasticSearch需要自己先创建索引，项目运行环境教程中有介绍。

## 项目总结

博客作为新手入门项目是十分不错的，项目所用的技术栈覆盖的也比较广，适合初学者学习。主要难点在于权限管理、第三方登录、websocket这块。有问题的或者有好的建议可以私聊联系我。







