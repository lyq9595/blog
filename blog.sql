/*
Navicat MySQL Data Transfer

Source Server         : 1yeay/39.108.91.243
Source Server Version : 80027
Source Host           : 39.108.91.243:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-01-19 13:06:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int DEFAULT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章类型 1原创 2转载 3翻译',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '原文链接',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶 0否 1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密 3评论可见',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT KEY `ft_search` (`article_content`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES ('47', '1', '184', 'https://www.static.talkxj.com/articles/bd74062266c1fb04f3084968231c0580.jpg', '测试文章', '## 目录\n欢迎访问wkc++博客!', '1', '', '0', '1', '1', '2022-01-01 15:50:57', '2022-01-17 00:06:02');
INSERT INTO `tb_article` VALUES ('48', '6', '184', 'http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png', '22', '大家好我是wkc++!', '1', '', '0', '0', '1', '2022-01-01 16:59:39', '2022-01-17 23:51:45');
INSERT INTO `tb_article` VALUES ('53', '1', '332', 'http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/aabc2a7d61ad9858993a5fdc41619b69.jpeg', 'Mybatis复习1', '\n\n### 一.Mybatis快速入门\n\n#### 1.1 框架介绍\n\n- 框架是一款半成品软件，我们可以基于这个半成品软件继续开发，来完成我们个性化的需求！\n\n\n\n​ \n\n#### 1.2 ORM介绍\n\n- ORM(Object Relational Mapping)： 对象关系映射\n- 指的是持久化数据和实体对象的映射模式，为了解决面向对象与关系型数据库存在的互不匹配的现象的技术。\n- 如图:\n  ![1590919786415.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8ce998dd74db7b60d378287d18f0a328.png)\n- 具体映射关系如下图:\n\n![1590919824416.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/233bb18c9a211f13a4d6610919f3cfed.png)\n\n\n\n#### 1.4 原始jdbc操作的分析\n\n- 原始 JDBC 的操作问题分析 \n\n  ​    1.频繁创建和销毁数据库的连接会造成系统资源浪费从而影响系统性能。\n\n  1. sql 语句在代码中硬编码，如果要修改 sql 语句，就需要修改 java 代码，造成代码不易维护。\n  2. 查询操作时，需要手动将结果集中的数据封装到实体对象中。\n  3. 增删改查操作需要参数时，需要手动将实体对象的数据设置到 sql 语句的占位符。 \n\n- 原始 JDBC 的操作问题解决方案 \n\n  ​    1.使用数据库连接池初始化连接资源。 \n\n  1. 将 sql 语句抽取到配置文件中。 \n  2. 使用反射、内省等底层技术，将实体与表进行属性与字段的自动映射    \n\n#### 1.5 什么是Mybatis\n\nmybatis 是一个优秀的基于java的持久层框架，它内部封装了jdbc，使开发者只需要关注sql语句本身，而不需要花费精力去处理加载驱动、创建连接、创建statement等繁杂的过程。\n\nmybatis通过xml或注解的方式将要执行的各种 statement配置起来，并通过java对象和statement中sql的动态参数进行映射生成最终执行的sql语句。\n\n最后mybatis框架执行sql并将结果映射为java对象并返回。采用ORM思想解决了实体和数据库映射的问题，对jdbc 进行了封装，屏蔽了jdbc api 底层访问细节，使我们不用与jdbc api 打交道，就可以完成对数据库的持久化操作。\n\nMyBatis官网地址：<http://www.mybatis.org/mybatis-3/> \n\n#### 1.6  Mybatis的快速入门\n\n**MyBatis开发步骤：**\n\n①添加MyBatis的jar包\n\n②创建Student数据表\n\n③编写Studentr实体类 \n\n④编写映射文件StudentMapper.xml\n\n⑤编写核心文件MyBatisConfig.xml\n\n⑥编写测试类\n\n##### 1.7.1  环境搭建\n\n1)导入MyBatis的jar包\n\n- mysql-connector-java-5.1.37-bin.jar\n- mybatis-3.5.3.jar\n- log4j-1.2.17.jar\n\n2)  创建student数据表\n\n![1590916243454.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/09928c1e6fe5125ea2fe6ff158e5b53f.png)\n3) 编写Student实体\n\n```java\npublic class Student {\n    private Integer id;\n    private String name;\n    private Integer age;\n    //省略get个set方法\n}\n```\n\n4)编写StudentMapper.xml映射文件\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!--MyBatis的DTD约束-->\n<!DOCTYPE mapper\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n\n<!--\n    mapper：核心根标签\n    namespace属性：名称空间\n-->\n<mapper namespace=\"StudentMapper\">\n    <!--\n        select：查询功能的标签\n        id属性：唯一标识\n        resultType属性：指定结果映射对象类型\n        parameterType属性：指定参数映射对象类型\n    -->\n    <select id=\"selectAll\" resultType=\"student\">\n        SELECT * FROM student\n    </select>\n</mapper>\n```\n\n5) 编写MyBatis核心文件\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!--MyBatis的DTD约束-->\n<!DOCTYPE configuration PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\n\n<!--configuration 核心根标签-->\n<configuration>\n\n    <!--引入数据库连接的配置文件-->\n    <properties resource=\"jdbc.properties\"/>\n\n    <!--配置LOG4J-->\n    <settings>\n        <setting name=\"logImpl\" value=\"log4j\"/>\n    </settings>\n\n    <!--起别名-->\n    <typeAliases>\n        <typeAlias type=\"com.lyq.bean.Student\" alias=\"student\"/>\n        <!--<package name=\"com.lyq.bean\"/>-->\n    </typeAliases>\n\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\n    <environments default=\"mysql\">\n        <!--environment配置数据库环境  id属性唯一标识-->\n        <environment id=\"mysql\">\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\n            <transactionManager type=\"JDBC\"></transactionManager>\n            <!-- dataSource数据源信息   type属性 连接池-->\n            <dataSource type=\"POOLED\">\n                <!-- property获取数据库连接的配置信息 -->\n                <property name=\"driver\" value=\"${driver}\" />\n                <property name=\"url\" value=\"${url}\" />\n                <property name=\"username\" value=\"${username}\" />\n                <property name=\"password\" value=\"${password}\" />\n            </dataSource>\n        </environment>\n    </environments>\n\n    <!-- mappers引入映射配置文件 -->\n    <mappers>\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\n        <mapper resource=\"StudentMapper.xml\"/>\n    </mappers>\n</configuration>\n\n```\n\n##### 1.7.2编写测试代码\n\n```java\n/*\n    控制层测试类\n */\npublic class StudentController {\n    //创建业务层对象\n    private StudentService service = new StudentServiceImpl();\n\n    //查询全部功能测试\n    @Test\n    public void selectAll() {\n        List<Student> students = service.selectAll();\n        for (Student stu : students) {\n            System.out.println(stu);\n        }\n    }\n}\n```\n\n#### 1.8 知识小结\n\n- 框架       \n\n  框架是一款半成品软件，我们可以基于框架继续开发，从而完成一些个性化的需求。\n\n- ORM        \n\n  对象关系映射，数据和实体对象的映射。\n\n- MyBatis       \n\n  是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC。\n\n### 二. MyBatis的相关api\n\n#### 2.1 Resources\n\n- org.apache.ibatis.io.Resources：加载资源的工具类。\n- 核心方法\n\n![1590917572321.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/afbb2dc902c798cba23eccbe1732d40a.png)\n\n#### 2.2 构建器SqlSessionFactoryBuilder\n\n- org.apache.ibatis.session.SqlSessionFactoryBuilder：获取 SqlSessionFactory 工厂对象的功能类\n- 核心方法\n\n![1590916852504.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/1c35b367f9cce5175287391d8ba4b4b2.png)\n\n- 通过加载mybatis的核心文件的输入流的形式构建一个SqlSessionFactory对象\n\n```java\nString resource = \"org/mybatis/builder/mybatis-config.xml\"; \nInputStream inputStream = Resources.getResourceAsStream(resource); \nSqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); \nSqlSessionFactory factory = builder.build(inputStream);\n```\n\n其中， Resources 工具类，这个类在 org.apache.ibatis.io 包中。Resources 类帮助你从类路径下、文件系统或一个 web URL 中加载资源文件。\n\n#### 2.3 工厂对象SqlSessionFactory\n\n- org.apache.ibatis.session.SqlSessionFactory：获取 SqlSession 构建者对象的工厂接口。\n- 核心api\n\n![1590917006637.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/e35580b64672c4115d300bae9b6ca28e.png)\n\n#### 2.4 SqlSession会话对象\n\n- org.apache.ibatis.session.SqlSession：构建者对象接口。用于执行 SQL、管理事务、接口代理。\n- 核心api\n  ![1590917052849.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a88e0f3169cef143cbca4675e9f51754.png)\n  SqlSession 实例在 MyBatis 中是非常强大的一个类。在这里你会看到所有执行语句、提交或回滚事务和获取映射器实例的方法。\n\n### 三.MyBatis 映射配置文件\n\n#### 3.1 映射配置文件介绍\n\n- 映射配置文件包含了数据和对象之间的映射关系以及要执行的 SQL 语句\n\n#### 3.2 查询功能\n\n- <select>：查询功能标签。\n\n- 属性        \n\n  id：唯一标识， 配合名称空间使用。     \n\n  parameterType：指定参数映射的对象类型。       \n\n  resultType：指定结果映射的对象类型。\n\n- SQL 获取参数:        #{属性名}\n\n####3.3 新增功能 \n\n- <insert>：新增功能标签。\n\n- 属性        \n\n  id：唯一标识， 配合名称空间使用。     \n\n  parameterType：指定参数映射的对象类型。       \n\n  resultType：指定结果映射的对象类型。\n\n- SQL 获取参数:        #{属性名}\n\n\n\n#### 3.4 修改功能\n\n- <update>：修改功能标签。\n\n- 属性        \n\n  id：唯一标识， 配合名称空间使用。     \n\n  parameterType：指定参数映射的对象类型。       \n\n  resultType：指定结果映射的对象类型。\n\n- SQL 获取参数:        #{属性名}\n\n\n\n#### 3.5 删除功能\n\n- <delete>：查询功能标签。\n\n- 属性        \n\n  id：唯一标识， 配合名称空间使用。     \n\n  parameterType：指定参数映射的对象类型。       \n\n  resultType：指定结果映射的对象类型。\n\n- SQL 获取参数:        #{属性名}\n\n\n- 总结： 大家可以发现crud操作，除了标签名称以及sql语句不一样之外，其他属性参数基本一致。\n\n#### 3.6 映射配置文件小结\n\n![1590918743943.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a074e7c53ea558ca61c0f7dbaa619ece.png)\n\n### 四.Mybatis核心配置文件介绍\n\n#### 4.1 核心配置文件介绍\n\n核心配置文件包含了 MyBatis 最核心的设置和属性信息。如数据库的连接、事务、连接池信息等。\n\n如下图:\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!--MyBatis的DTD约束-->\n<!DOCTYPE configuration PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\" \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\n\n<!--configuration 核心根标签-->\n<configuration>\n\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\n    <environments default=\"mysql\">\n        <!--environment配置数据库环境  id属性唯一标识-->\n        <environment id=\"mysql\">\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\n            <transactionManager type=\"JDBC\"></transactionManager>\n            <!-- dataSource数据源信息   type属性 连接池-->\n            <dataSource type=\"POOLED\">\n                <!-- property获取数据库连接的配置信息 -->\n                <property name=\"driver\" value=\"com.mysql.jdbc.Driver\" />\n                <property name=\"url\" value=\"jdbc:mysql:///db1\" />\n                <property name=\"username\" value=\"root\" />\n                <property name=\"password\" value=\"root\" />\n            </dataSource>\n        </environment>\n    </environments>\n\n    <!-- mappers引入映射配置文件 -->\n    <mappers>\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\n        <mapper resource=\"StudentMapper.xml\"/>\n    </mappers>\n</configuration>\n```\n\n#### 4.2 数据库连接配置文件引入\n\n- properties标签引入外部文件\n\n  ```xml\n      <!--引入数据库连接的配置文件-->\n      <properties resource=\"jdbc.properties\"/>\n  ```\n\n- 具体使用，如下配置\n\n  ```xml\n    <!-- property获取数据库连接的配置信息 -->\n      <property name=\"driver\" value=\"${driver}\" />\n      <property name=\"url\" value=\"${url}\" />\n      <property name=\"username\" value=\"${username}\" />\n      <property name=\"password\" value=\"${password}\" />\n  ```\n\n#### 4.3 起别名\n\n- <typeAliases>：为全类名起别名的父标签。\n\n- <typeAlias>：为全类名起别名的子标签。\n\n- 属性      \n\n  type：指定全类名      \n\n  alias：指定别名\n\n- <package>：为指定包下所有类起别名的子标签。(别名就是类名)\n\n- 如下图：\n\n![1590919106324.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/5d4beb5d51aba65b50c8554454b2fef9.png)\n\n- 具体如下配置\n\n  ```xml\n      <!--起别名-->\n      <typeAliases>\n          <typeAlias type=\"com.itheima.bean.Student\" alias=\"student\"/>\n          <!--<package name=\"com.itheima.bean\"/>-->\n      </typeAliase\n  ```\n\n#### 4.4 总结\n\n![1590919367790.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/d47caea100afecaa5cbe73d10d013dbe.png)\n\n### 五.Mybatis传统方式开发\n\n#### 5.1 Dao 层传统实现方式\n\n- 分层思想：控制层(controller)、业务层(service)、持久层(dao)。\n- 调用流程\n  ![1590919558066.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/f1597c1ad9a283c1f3f91546b727e2e8.png)\n\n#### 5.2 LOG4J的配置和使用\n\n- 在日常开发过程中，排查问题时难免需要输出 MyBatis 真正执行的 SQL 语句、参数、结果等信息，我们就可以借助 LOG4J 的功能来实现执行信息的输出。\n- 使用步骤：\n\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)\n\n\n\n\n\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)', '1', '', '0', '0', '1', '2022-01-15 23:39:58', '2022-01-17 00:21:22');
INSERT INTO `tb_article` VALUES ('54', '1', '332', 'http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6519bfb2d15698120af5aa8e3ba50640.png', 'Mybatis复习2', '### 一.接口代理方式实现Dao\n\n#### 1.1 代理开发方式介绍\n\n​	采用 Mybatis 的代理开发方式实现 DAO 层的开发，这种方式是我们后面进入企业的主流。\n\nMapper 接口开发方法只需要程序员编写Mapper 接口（相当于Dao 接口），由Mybatis 框架根据接口定义创建接口的动态代理对象，代理对象的方法体同上边Dao接口实现类方法。\n\nMapper 接口开发需要遵循以下规范：\n\n**1) Mapper.xml文件中的namespace与mapper接口的全限定名相同**\n\n**2) Mapper接口方法名和Mapper.xml中定义的每个statement的id相同**\n\n**3) Mapper接口方法的输入参数类型和mapper.xml中定义的每个sql的parameterType的类型相同**\n\n**4) Mapper接口方法的输出参数类型和mapper.xml中定义的每个sql的resultType的类型相同**\n\n总结: \n\n接口开发的方式: 程序员只需定义接口,就可以对数据库进行操作,那么具体的对象怎么创建?\n\n1.程序员负责定义接口\n\n2.在操作数据库,mybatis框架根据接口,通过动态代理的方式生成代理对象,负责数据库的crud操作\n\n\n![1590937589503.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/b9ee3ea9d0c6438663c9e1ecd41d4dff.png)\n\n\n#### 1.3 测试代理方式\n\n```java\n public Student selectById(Integer id) {\n        Student stu = null;\n        SqlSession sqlSession = null;\n        InputStream is = null;\n        try{\n            //1.加载核心配置文件\n            is = Resources.getResourceAsStream(\"MyBatisConfig.xml\");\n\n            //2.获取SqlSession工厂对象\n            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\n\n            //3.通过工厂对象获取SqlSession对象\n            sqlSession = sqlSessionFactory.openSession(true);\n\n            //4.获取StudentMapper接口的实现类对象\n            StudentMapper mapper = sqlSession.getMapper(StudentMapper.class); // StudentMapper mapper = new StudentMapperImpl();\n\n            //5.通过实现类对象调用方法，接收结果\n            stu = mapper.selectById(id);\n\n        } catch (Exception e) {\n\n        } finally {\n            //6.释放资源\n            if(sqlSession != null) {\n                sqlSession.close();\n            }\n            if(is != null) {\n                try {\n                    is.close();\n                } catch (IOException e) {\n                    e.printStackTrace();\n                }\n            }\n        }\n\n        //7.返回结果\n        return stu;\n    }\n```\n\n#### 1.4 源码分析\n- 分析动态代理对象如何生成的？ \n\n  通过动态代理开发模式，我们只编写一个接口，不写实现类，我们通过 getMapper() 方法最终获取到 org.apache.ibatis.binding.MapperProxy 代理对象，然后执行功能，而这个代理对象正是 MyBatis 使用了 JDK 的动态代理技术，帮助我们生成了代理实现类对象。从而可以进行相关持久化操作。 \n\n- 分析方法是如何执行的？\n\n  动态代理实现类对象在执行方法的时候最终调用了 mapperMethod.execute() 方法，这个方法中通过 switch 语句根据操作类型来判断是新增、修改、删除、查询操作，最后一步回到了 MyBatis 最原生的 SqlSession 方式来执行增删改查。   \n\n#### 1.5 知识小结\n\n 接口代理方式可以让我们只编写接口即可，而实现类对象由 MyBatis 生成。 \n\n 实现规则 ：\n\n1. 映射配置文件中的名称空间必须和 Dao 层接口的全类名相同。\n2. 映射配置文件中的增删改查标签的 id 属性必须和 Dao 层接口的方法名相同。 \n3. 映射配置文件中的增删改查标签的 parameterType 属性必须和 Dao 层接口方法的参数相同。 \n4. 映射配置文件中的增删改查标签的 resultType 属性必须和 Dao 层接口方法的返回值相同。 \n5. 获取动态代理对象 SqlSession 功能类中的 getMapper() 方法。    \n\n### 二. 动态sql语句\n\n#### 2.1 动态sql语句概述\n\n​	Mybatis 的映射文件中，前面我们的 SQL 都是比较简单的，有些时候业务逻辑复杂时，我们的 SQL是动态变化的，此时在前面的学习中我们的 SQL 就不能满足要求了。\n\n参考的官方文档，描述如下：\n![图片2.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/3a6bbc0c410b2b346a6b993a8bcf26aa.png)\n\n#### 2.2 动态 SQL  之<**if>**\n\n我们根据实体类的不同取值，使用不同的 SQL语句来进行查询。比如在 id如果不为空时可以根据id查询，如果username 不同空时还要加入用户名作为条件。这种情况在我们的多条件组合查询中经常会碰到。\n\n\n如下图：\n\n```xml\n<select id=\"findByCondition\" parameterType=\"student\" resultType=\"student\">\n    select * from student\n    <where>\n        <if test=\"id!=0\">\n            and id=#{id}\n        </if>\n        <if test=\"username!=null\">\n            and username=#{username}\n        </if>\n    </where>\n</select>\n\n```\n\n当查询条件id和username都存在时，控制台打印的sql语句如下：\n\n\n```java\n     … … …\n     //获得MyBatis框架生成的StudentMapper接口的实现类\n    StudentMapper mapper = sqlSession.getMapper( StudentMapper.class);\n    Student condition = new Student();\n    condition.setId(1);\n    condition.setUsername(\"lucy\");\n    Student student = mapper.findByCondition(condition);\n    … … …\n```\n![1590936579118.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/4567f438797078e9e117ddff6c534a00.png)\n\n \n\n当查询条件只有id存在时，控制台打印的sql语句如下：\n\n\n```java\n … … …\n //获得MyBatis框架生成的UserMapper接口的实现类\n StudentMapper mapper = sqlSession.getMapper( StudentMapper.class);\n    Student condition = new Student();\n    condition.setId(1);\n    Student student = mapper.findByCondition(condition);\n… … …\n\n```\n\n![1590936654661.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10383fe26f8f53920e7c8bbbe5657b0b.png)\n\n总结语法:\n\n```xml\n<where>：条件标签。如果有动态条件，则使用该标签代替 where 关键字。\n<if>：条件判断标签。\n<if test=“条件判断”>\n	查询条件拼接\n</if>\n```\n\n\n\n#### 2.3  动态 SQL  之<**foreach>**\n循环执行sql的拼接操作，例如：SELECT * FROM student  WHERE id IN (1,2,5)。\n\n```xml\n<select id=\"findByIds\" parameterType=\"list\" resultType=\"student\">\n    select * from student\n    <where>\n        <foreach collection=\"array\" open=\"id in(\" close=\")\" item=\"id\" separator=\",\">\n            #{id}\n        </foreach>\n    </where>\n</select>\n```\n\n测试代码片段如下：\n\n```java\n … … …\n //获得MyBatis框架生成的UserMapper接口的实现类\nStudentMapper mapper = sqlSession.getMapper(StudentMapper.class);\nint[] ids = new int[]{2,5};\nList<Student> sList = mapper.findByIds(ids);\nSystem.out.println(sList);\n… … …\n\n```\n\n总结语法:\n\n```xml\n<foreach>：循环遍历标签。适用于多个参数或者的关系。\n    <foreach collection=“”open=“”close=“”item=“”separator=“”>\n		获取参数\n	</foreach>\n```\n\n属性\ncollection：参数容器类型， (list-集合， array-数组)。\nopen：开始的 SQL 语句。\nclose：结束的 SQL 语句。\nitem：参数变量名。\nseparator：分隔符。\n\n#### 2.4  SQL片段抽取\n\nSql 中可将重复的 sql 提取出来，使用时用 include 引用即可，最终达到 sql 重用的目的\n\n```xml\n<!--抽取sql片段简化编写-->\n<sql id=\"selectStudent\" select * from student</sql>\n<select id=\"findById\" parameterType=\"int\" resultType=\"student\">\n    <include refid=\"selectStudent\"></include> where id=#{id}\n</select>\n<select id=\"findByIds\" parameterType=\"list\" resultType=\"student\">\n    <include refid=\"selectStudent\"></include>\n    <where>\n        <foreach collection=\"array\" open=\"id in(\" close=\")\" item=\"id\" separator=\",\">\n            #{id}\n        </foreach>\n    </where>\n</select>\n```\n\n总结语法:\n\n我们可以将一些重复性的 SQL 语句进行抽取，以达到复用的效果。 \n\n```xml\n-  <sql>：抽取 SQL 语句标签。 \n-  <include>：引入 SQL 片段标签。 \n   <sql id=“片段唯一标识”>抽取的 SQL 语句</sql> <include refid=“片段唯一标识”/>\n \n```\n\n#### 2.5 知识小结\n\nMyBatis映射文件配置：\n\n```xml\n<select>：查询\n\n<insert>：插入\n\n<update>：修改\n\n<delete>：删除\n\n<where>：where条件\n\n<if>：if判断\n\n<foreach>：循环\n\n<sql>：sql片段抽取\n\n```\n\n\n### 三. 分页插件\n\n#### 3.1 分页插件介绍\n\n![1590937779260.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/3a76d554d7cbbd61e8b8384f53138a76.png)\n\n- 分页可以将很多条结果进行分页显示。 \n- 如果当前在第一页，则没有上一页。如果当前在最后一页，则没有下一页。 \n- 需要明确当前是第几页，这一页中显示多少条结果。    \n- MyBatis分页插件总结\n  1. 在企业级开发中，分页也是一种常见的技术。而目前使用的 MyBatis 是不带分页功能的，如果想实现分页的 功能，需要我们手动编写 LIMIT 语句。但是不同的数据库实现分页的 SQL 语句也是不同的，所以手写分页 成本较高。这个时候就可以借助分页插件来帮助我们实现分页功能。 \n  2. PageHelper：第三方分页助手。将复杂的分页操作进行封装，从而让分页功能变得非常简单。    \n\n#### 3.2 分页插件的使用\n\nMyBatis可以使用第三方的插件来对功能进行扩展，分页助手PageHelper是将分页的复杂操作进行封装，使用简单的方式即可获得分页的相关数据\n\n开发步骤：\n\n①导入与PageHelper的jar包\n\n②在mybatis核心配置文件中配置PageHelper插件\n\n```xml\n<!-- 注意：分页助手的插件  配置在通用mapper之前 -->\n<plugin interceptor=\"com.github.pagehelper.PageHelper\">\n    <!-- 指定方言 -->\n    <property name=\"dialect\" value=\"mysql\"/>\n</plugin>\n```\n\n③测试分页数据获取\n\n```java\n@Test\npublic void testPageHelper(){\n    //设置分页参数\n    PageHelper.startPage(1,2);\n\n    List<User> select = userMapper2.select(null);\n    for(User user : select){\n        System.out.println(user);\n    }\n}\n```\n\n#### 3.3 分页插件的参数获取\n\n**获得分页相关的其他参数**：\n\n```java\n//其他分页的数据\nPageInfo<User> pageInfo = new PageInfo<User>(select);\nSystem.out.println(\"总条数：\"+pageInfo.getTotal());\nSystem.out.println(\"总页数：\"+pageInfo.getPages());\nSystem.out.println(\"当前页：\"+pageInfo.getPageNum());\nSystem.out.println(\"每页显示长度：\"+pageInfo.getPageSize());\nSystem.out.println(\"是否第一页：\"+pageInfo.isIsFirstPage());\nSystem.out.println(\"是否最后一页：\"+pageInfo.isIsLastPage());\n\n```\n\n#### 3.4  分页插件知识小结\n\n​    分页：可以将很多条结果进行分页显示。 \n\n- 分页插件 jar 包： pagehelper-5.1.10.jar jsqlparser-3.1.jar \n\n- <plugins>：集成插件标签。 \n\n- 分页助手相关 API \n\n  ​    1.PageHelper：分页助手功能类。\n\n  1. startPage()：设置分页参数 \n  2. PageInfo：分页相关参数功能类。 \n  3. getTotal()：获取总条数 \n  4. getPages()：获取总页数\n  5. getPageNum()：获取当前页\n  6. getPageSize()：获取每页显示条数\n  7. getPrePage()：获取上一页 \n  8. getNextPage()：获取下一页 \n  9. isIsFirstPage()：获取是否是第一页 \n  10. isIsLastPage()：获取是否是最后一页    \n\n### 四.MyBatis的多表操作\n\n#### 4.1 多表模型介绍\n\n我们之前学习的都是基于单表操作的，而实际开发中，随着业务难度的加深，肯定需要多表操作的。 \n\n- 多表模型分类 一对一：在任意一方建立外键，关联对方的主键。\n- 一对多：在多的一方建立外键，关联一的一方的主键。\n- 多对多：借助中间表，中间表至少两个字段，分别关联两张表的主键。    \n\n\n#### 4.2 多表模型一对一操作\n\n1. 一对一模型： 人和身份证，一个人只有一个身份证\n\n2. 代码实现\n\n   - 步骤一: sql语句准备\n\n     ```sql\n     CREATE TABLE person(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	NAME VARCHAR(20),\n     	age INT\n     );\n     INSERT INTO person VALUES (NULL,\'张三\',23);\n     INSERT INTO person VALUES (NULL,\'李四\',24);\n     INSERT INTO person VALUES (NULL,\'王五\',25);\n\n     CREATE TABLE card(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	number VARCHAR(30),\n     	pid INT,\n     	CONSTRAINT cp_fk FOREIGN KEY (pid) REFERENCES person(id)\n     );\n     INSERT INTO card VALUES (NULL,\'12345\',1);\n     INSERT INTO card VALUES (NULL,\'23456\',2);\n     INSERT INTO card VALUES (NULL,\'34567\',3);\n     ```\n\n   - 步骤二:配置文件\n\n     ```xml\n     <?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n     <!DOCTYPE mapper\n             PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n             \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n\n     <mapper namespace=\"com.lyq.table01.OneToOneMapper\">\n         <!--配置字段和实体对象属性的映射关系-->\n         <resultMap id=\"oneToOne\" type=\"card\">\n             <id column=\"cid\" property=\"id\" />\n             <result column=\"number\" property=\"number\" />\n             <!--\n                 association：配置被包含对象的映射关系\n                 property：被包含对象的变量名\n                 javaType：被包含对象的数据类型\n             -->\n             <association property=\"p\" javaType=\"person\">\n                 <id column=\"pid\" property=\"id\" />\n                 <result column=\"name\" property=\"name\" />\n                 <result column=\"age\" property=\"age\" />\n             </association>\n         </resultMap>\n\n         <select id=\"selectAll\" resultMap=\"oneToOne\">\n             SELECT c.id cid,number,pid,NAME,age FROM card c,person p WHERE c.pid=p.id\n         </select>\n     </mapper>\n     ```\n\n   - 步骤三：测试类\n\n     ```java\n      @Test\n         public void selectAll() throws Exception{\n             //1.加载核心配置文件\n             InputStream is = Resources.getResourceAsStream(\"MyBatisConfig.xml\");\n\n             //2.获取SqlSession工厂对象\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\n\n             //3.通过工厂对象获取SqlSession对象\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\n\n             //4.获取OneToOneMapper接口的实现类对象\n             OneToOneMapper mapper = sqlSession.getMapper(OneToOneMapper.class);\n\n             //5.调用实现类的方法，接收结果\n             List<Card> list = mapper.selectAll();\n\n             //6.处理结果\n             for (Card c : list) {\n                 System.out.println(c);\n             }\n\n             //7.释放资源\n             sqlSession.close();\n             is.close();\n         }\n     ```\n\n   3.一对一配置总结:\n\n   ```xml-dtd\n   <resultMap>：配置字段和对象属性的映射关系标签。\n       id 属性：唯一标识\n       type 属性：实体对象类型\n   <id>：配置主键映射关系标签。\n   <result>：配置非主键映射关系标签。\n       column 属性：表中字段名称\n       property 属性： 实体对象变量名称\n   <association>：配置被包含对象的映射关系标签。\n       property 属性：被包含对象的变量名\n       javaType 属性：被包含对象的数据类型\n   ```\n\n#### 4.3 多表模型一对多操作\n1. 一对多模型： 一对多模型：班级和学生，一个班级可以有多个学生。    \n\n2. 代码实现\n\n   - 步骤一: sql语句准备\n\n     ```sql\n     CREATE TABLE classes(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	NAME VARCHAR(20)\n     );\n     INSERT INTO classes VALUES (NULL,\'一班\');\n     INSERT INTO classes VALUES (NULL,\'二班\');\n\n\n     CREATE TABLE student(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	NAME VARCHAR(30),\n     	age INT,\n     	cid INT,\n     	CONSTRAINT cs_fk FOREIGN KEY (cid) REFERENCES classes(id)\n     );\n     INSERT INTO student VALUES (NULL,\'张三\',23,1);\n     INSERT INTO student VALUES (NULL,\'李四\',24,1);\n     INSERT INTO student VALUES (NULL,\'王五\',25,2);\n     INSERT INTO student VALUES (NULL,\'赵六\',26,2);\n     ```\n\n   - 步骤二:配置文件\n\n     ```xml\n     <mapper namespace=\"com.lyq.table02.OneToManyMapper\">\n         <resultMap id=\"oneToMany\" type=\"classes\">\n             <id column=\"cid\" property=\"id\"/>\n             <result column=\"cname\" property=\"name\"/>\n\n             <!--\n                 collection：配置被包含的集合对象映射关系\n                 property：被包含对象的变量名\n                 ofType：被包含对象的实际数据类型\n             -->\n             <collection property=\"students\" ofType=\"student\">\n                 <id column=\"sid\" property=\"id\"/>\n                 <result column=\"sname\" property=\"name\"/>\n                 <result column=\"sage\" property=\"age\"/>\n             </collection>\n         </resultMap>\n         <select id=\"selectAll\" resultMap=\"oneToMany\">\n             SELECT c.id cid,c.name cname,s.id sid,s.name sname,s.age sage FROM classes c,student s WHERE c.id=s.cid\n         </select>\n     </mapper>\n     ```\n\n   - 步骤三：测试类\n\n     ```java\n         @Test\n         public void selectAll() throws Exception{\n             //1.加载核心配置文件\n             InputStream is = Resources.getResourceAsStream(\"MyBatisConfig.xml\");\n\n             //2.获取SqlSession工厂对象\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\n\n             //3.通过工厂对象获取SqlSession对象\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\n\n             //4.获取OneToManyMapper接口的实现类对象\n             OneToManyMapper mapper = sqlSession.getMapper(OneToManyMapper.class);\n\n             //5.调用实现类的方法，接收结果\n             List<Classes> classes = mapper.selectAll();\n\n             //6.处理结果\n             for (Classes cls : classes) {\n                 System.out.println(cls.getId() + \",\" + cls.getName());\n                 List<Student> students = cls.getStudents();\n                 for (Student student : students) {\n                     System.out.println(\"\\t\" + student);\n                 }\n             }\n\n             //7.释放资源\n             sqlSession.close();\n             is.close();\n         }\n     ```\n\n   3.一对多配置文件总结：\n\n   ```xml-dtd\n   <resultMap>：配置字段和对象属性的映射关系标签。\n       id 属性：唯一标识\n       type 属性：实体对象类型\n   <id>：配置主键映射关系标签。\n   <result>：配置非主键映射关系标签。\n       column 属性：表中字段名称\n       property 属性： 实体对象变量名称\n   <collection>：配置被包含集合对象的映射关系标签。\n       property 属性：被包含集合对象的变量名\n       ofType 属性：集合中保存的对象数据类型\n   ```\n\n\n#### 4.4 多表模型多对多操作\n\n1. 多对多模型：学生和课程，一个学生可以选择多门课程、一个课程也可以被多个学生所选择。       \n\n2. 代码实现\n\n   - 步骤一: sql语句准备\n\n     ```sql\n     CREATE TABLE course(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	NAME VARCHAR(20)\n     );\n     INSERT INTO course VALUES (NULL,\'语文\');\n     INSERT INTO course VALUES (NULL,\'数学\');\n\n\n     CREATE TABLE stu_cr(\n     	id INT PRIMARY KEY AUTO_INCREMENT,\n     	sid INT,\n     	cid INT,\n     	CONSTRAINT sc_fk1 FOREIGN KEY (sid) REFERENCES student(id),\n     	CONSTRAINT sc_fk2 FOREIGN KEY (cid) REFERENCES course(id)\n     );\n     INSERT INTO stu_cr VALUES (NULL,1,1);\n     INSERT INTO stu_cr VALUES (NULL,1,2);\n     INSERT INTO stu_cr VALUES (NULL,2,1);\n     INSERT INTO stu_cr VALUES (NULL,2,2);\n     ```\n\n   - 步骤二:配置文件\n\n     ```xml\n     <?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n     <!DOCTYPE mapper\n             PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n             \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n\n     <mapper namespace=\"com.lyq.table03.ManyToManyMapper\">\n         <resultMap id=\"manyToMany\" type=\"student\">\n             <id column=\"sid\" property=\"id\"/>\n             <result column=\"sname\" property=\"name\"/>\n             <result column=\"sage\" property=\"age\"/>\n\n             <collection property=\"courses\" ofType=\"course\">\n                 <id column=\"cid\" property=\"id\"/>\n                 <result column=\"cname\" property=\"name\"/>\n             </collection>\n         </resultMap>\n         <select id=\"selectAll\" resultMap=\"manyToMany\">\n             SELECT sc.sid,s.name sname,s.age sage,sc.cid,c.name cname FROM student s,course c,stu_cr sc WHERE sc.sid=s.id AND sc.cid=c.id\n         </select>\n     </mapper>\n     ```\n\n   - 步骤三：测试类\n\n     ```java\n      @Test\n         public void selectAll() throws Exception{\n             //1.加载核心配置文件\n             InputStream is = Resources.getResourceAsStream(\"MyBatisConfig.xml\");\n\n             //2.获取SqlSession工厂对象\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\n\n             //3.通过工厂对象获取SqlSession对象\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\n\n             //4.获取ManyToManyMapper接口的实现类对象\n             ManyToManyMapper mapper = sqlSession.getMapper(ManyToManyMapper.class);\n\n             //5.调用实现类的方法，接收结果\n             List<Student> students = mapper.selectAll();\n\n             //6.处理结果\n             for (Student student : students) {\n                 System.out.println(student.getId() + \",\" + student.getName() + \",\" + student.getAge());\n                 List<Course> courses = student.getCourses();\n                 for (Course cours : courses) {\n                     System.out.println(\"\\t\" + cours);\n                 }\n             }\n\n             //7.释放资源\n             sqlSession.close();\n             is.close();\n         }\n         \n     ```\n\n   3.多对多配置文件总结：\n\n   ```xml-dtd\n   <resultMap>：配置字段和对象属性的映射关系标签。\n   	id 属性：唯一标识\n   	type 属性：实体对象类型\n    <id>：配置主键映射关系标签。\n    <result>：配置非主键映射关系标签。\n   	column 属性：表中字段名称\n   	property 属性： 实体对象变量名称\n   <collection>：配置被包含集合对象的映射关系标签。\n   	property 属性：被包含集合对象的变量名\n   	ofType 属性：集合中保存的对象数据类型\n   ```\n\n#### 4.5 多表模型操作总结\n\n```xml-dtd\n <resultMap>：配置字段和对象属性的映射关系标签。\n    id 属性：唯一标识\n    type 属性：实体对象类型\n<id>：配置主键映射关系标签。\n<result>：配置非主键映射关系标签。\n	column 属性：表中字段名称\n	property 属性： 实体对象变量名称\n<association>：配置被包含对象的映射关系标签。\n	property 属性：被包含对象的变量名\n	javaType 属性：被包含对象的数据类型\n<collection>：配置被包含集合对象的映射关系标签。\n	property 属性：被包含集合对象的变量名\n	ofType 属性：集合中保存的对象数据类型\n```\n\n\n\n\n\n', '1', '', '0', '0', '1', '2022-01-17 00:04:53', null);
INSERT INTO `tb_article` VALUES ('55', '1', '333', 'http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6df833bf4510e56b69c1e97793733803.png', 'H5&C3-1', '\n###### 一、什么是 `HTML5`\n\n1. `HTML5` 的概念与定义 \n\n- 定义：`HTML5` 定义了 `HTML` 标准的最新版本，是对 `HTML` 的第五次重大修改，号称下一代的 `HTML` \n- 两个概念：\n  - 是一个新版本的 `HTML` 语言，定义了新的标签、特性和属性\n  - 拥有一个强大的技术集，这些技术集是指： `HTML5` 、`CSS3` 、`javascript`, 这也是广义上的 `HTML5`\n\n1. `HTML5` 拓展了哪些内容\n\n- 语义化标签\n- 本地存储\n- 兼容特性\n- `2D`、`3D` \n- 动画、过渡\n- `CSS3` 特性\n- 性能与集成\n\n1. `HTML5 ` 的现状\n\n     绝对多数新的属性，都已经被浏览器所支持，最新版本的浏览器已经开始陆续支持最新的特性，\n\n     总的来说：`HTML5` 已经是大势所趋\n\n###### 二、`HTML5 ` 新增标签\n\n1. 什么是语义化\n2. 新增了那些语义化标签\n   - `header`   ---  头部标签\n   - `nav`        ---  导航标签\n   - `article` ---   内容标签\n   - `section` ---   块级标签\n   - `aside`     ---   侧边栏标签\n   - `footer`   ---   尾部标签\n\n\n\n\n\n\n![yuyibq.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/84b0ef16eaa0c36bf5f8f87b29122205.png)\n\n1. 使用语义化标签的注意\n\n```\n- 语义化标签主要针对搜索引擎\n- 新标签可以使用一次或者多次\n- 在 `IE9` 浏览器中，需要把语义化标签都转换为块级元素\n- 语义化标签，在移动端支持比较友好，\n- 另外，`HTML5` 新增的了很多的语义化标签，随着课程深入，还会学习到其他的\n```\n\n###### 三、多媒体音频标签\n\n1. 多媒体标签有两个，分别是\n\n- 音频  -- `audio`\n- 视频  -- `video`\n\n2. `audio` 标签说明\n\n- 可以在不使用标签的情况下，也能够原生的支持音频格式文件的播放，\n- 但是：播放格式是有限的\n\n3. audio 支持的音频格式\n   - audio 目前支持三种格式\n![audio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/c58a0577e933e61712366b1f33f5de70.png)\n\n4.audio 的参数\n\n![audiocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/195ba1f3364fc4efdc793845239e5296.png)\n\n\n5、audio 代码演示\n\n\n\n```css\n<body>\n  <!-- 注意：在 chrome 浏览器中已经禁用了 autoplay 属性 -->\n  <!-- <audio src=\"./media/snow.mp3\" controls autoplay></audio> -->\n\n  <!-- \n    因为不同浏览器支持不同的格式，所以我们采取的方案是这个音频准备多个文件\n   -->\n  <audio controls>\n    <source src=\"./media/snow.mp3\" type=\"audio/mpeg\" />\n  </audio>\n</body>\n```\n\n###### 四、多媒体视频标签\n\n1. video 视频标签\n   - 目前支持三种格式![vedio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8fb7663d9a8bf0884f3c5a56cf585af9.png)\n\n1. 语法格式\n\n   ```html\n   <video src=\"./media/video.mp4\" controls=\"controls\"></video>\n   ```\n\n2. video 参数\n![videocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6acea7a6e834704ece1f5c85cfc0f15a.png)\n\n\n1. video 代码演示\n\n   ```html\n   <body>\n     <!-- <video src=\"./media/video.mp4\" controls=\"controls\"></video> -->\n\n     <!-- 谷歌浏览器禁用了自动播放功能，如果想自动播放，需要添加 muted 属性 -->\n     <video controls=\"controls\" autoplay muted loop poster=\"./media/pig.jpg\">\n       <source src=\"./media/video.mp4\" type=\"video/mp4\">\n       <source src=\"./media/video.ogg\" type=\"video/ogg\">\n     </video>\n   </body>\n   ```\n\n2. 多媒体标签总结\n\n- 音频标签与视频标签使用基本一致\n- 多媒体标签在不同浏览器下情况不同，存在兼容性问题\n- 谷歌浏览器把音频和视频标签的自动播放都禁止了\n- 谷歌浏览器中视频添加 muted 标签可以自己播放\n- 注意：重点记住使用方法以及自动播放即可，其他属性可以在使用时查找对应的手册\n\n###### 五、新增 input 标签\n![h5input.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/da808c8c1972e9e99cac7ee6847aa050.png)\n\n六、新增表单属性\n\n![newinput.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/fa6e281cac8cb0a02699ec03b78ae288.png)\n\n\n###### 七、`CSS3 ` 属性选择器(上)\n\n1. 什么是 `CSS3`\n   - 在 `CSS2` 的基础上拓展、新增的样式\n2. `CSS3` 发展现状\n   - 移动端支持优于 `PC` 端\n   - `CSS3` 目前还草案，在不断改进中\n   - `CSS3` 相对 `H5`，应用非常广泛\n\n\n3. 属性选择器列表\n![attrcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a576b6c433fb12cf68e807fe906f8a3a.png)\n\n\n1. 属性选择器代码演示\n\n   ```css\n   button {\n     cursor: pointer;\n   }\n   button[disabled] {\n     cursor: default\n   }\n   ```\n\n###### 八、`CSS3 ` 属性选择器(下)\n\n1. 代码演示\n\n   ```css\n   input[type=search] {\n     color: skyblue;\n   }\n\n   span[class^=black] {\n     color: lightgreen;\n   }\n\n   span[class$=black] {\n     color: lightsalmon;\n   }\n\n   span[class*=black] {\n     color: lightseagreen;\n   }\n   ```\n\n###### 九、结构伪类选择器\n\n1. 属性列表\n\n\n![jiegouweilei.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/db9f6b9c4f2dafcfb2dacc9134aaddf7.png)\n\n1. 代码演示\n\n   ```css\n   ul li:first-child {\n     background-color: lightseagreen;\n   }\n\n   ul li:last-child {\n     background-color: lightcoral;\n   }\n\n   ul li:nth-child(3) {\n     background-color: aqua;\n   }\n   ```\n\n###### 十、`nth-child` 参数详解\n\n1. nth-child 详解\n   - 注意：本质上就是选中第几个子元素\n   - n 可以是数字、关键字、公式\n   - n 如果是数字，就是选中第几个\n   - 常见的关键字有 `even` 偶数、`odd` 奇数\n   - 常见的公式如下(如果 n 是公式，则从 0 开始计算)\n   - 但是第 0 个元素或者超出了元素的个数会被忽略\n  ![nthchildcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/145c319180a30513514e400bc77cac92.png)\n\n\n1. 代码演示\n\n```css\n   <style>\n     /* 偶数 */\n     ul li:nth-child(even) {\n       background-color: aquamarine;\n     }\n   \n     /* 奇数 */\n     ul li:nth-child(odd) {\n       background-color: blueviolet;\n     }\n   \n     /*n 是公式，从 0 开始计算 */\n     ul li:nth-child(n) {\n       background-color: lightcoral;\n     }\n   \n     /* 偶数 */\n     ul li:nth-child(2n) {\n       background-color: lightskyblue;\n     }\n   \n     /* 奇数 */\n     ul li:nth-child(2n + 1) {\n       background-color: lightsalmon;\n     }\n   \n     /* 选择第 0 5 10 15, 应该怎么选 */\n     ul li:nth-child(5n) {\n       background-color: orangered;\n     }\n   \n     /* n + 5 就是从第5个开始往后选择 */\n     ul li:nth-child(n + 5) {\n       background-color: peru;\n     }\n   \n     /* -n + 5 前五个 */\n     ul li:nth-child(-n + 5) {\n       background-color: tan;\n     }\n   </style>\n```\n\n###### 十一、`nth-child` 和  `nt-of-type` 的区别\n\n1. 代码演示\n\n```css\n   <style>\n     div :nth-child(1) {\n       background-color: lightblue;\n     }\n   \n     div :nth-child(2) {\n       background-color: lightpink;\n     }\n   \n     div span:nth-of-type(2) {\n       background-color: lightseagreen;\n     }\n   \n     div span:nth-of-type(3) {\n       background-color: #fff;\n     }\n   </style>\n```\n\n1. 区别\n   - `nth-child`  选择父元素里面的第几个子元素，不管是第几个类型\n   - `nt-of-type`  选择指定类型的元素\n\n\n###### 十二、伪元素选择器\n\n1. 伪类选择器\n![weiyuansu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/132368915eb385bb8e9b4ee9a82b9833.png)\n\n\n\n\n\n1. 伪类选择器注意事项\n\n   - `before` 和 `after` 必须有 `content` 属性\n   - `before` 在内容前面，after 在内容后面\n   - `before` 和 `after` 创建的是一个元素，但是属于行内元素\n   - 创建出来的元素在 `Dom` 中查找不到，所以称为伪元素\n   - 伪元素和标签选择器一样，权重为 1\n\n2. 代码演示\n\n   ```css\n   <style>\n       div {\n         width: 100px;\n         height: 100px;\n         border: 1px solid lightcoral;\n       }\n\n       div::after,\n       div::before {\n         width: 20px;\n         height: 50px;\n         text-align: center;\n         display: inline-block;\n       }\n       div::after {\n         content: \'德\';\n         background-color: lightskyblue;\n       }\n\n       div::before {\n         content: \'道\';\n         background-color: mediumaquamarine;\n       }\n     </style>\n   ```\n\n###### 十三、伪元素的案例\n\n1. 添加字体图标\n\n   ```css\n   p {\n      width: 220px;\n      height: 22px;\n      border: 1px solid lightseagreen;\n      margin: 60px;\n      position: relative;\n   }\n   p::after {\n     content: \'\\ea50\';\n     font-family: \'icomoon\';\n     position: absolute;\n     top: -1px;\n     right: 10px;\n   }\n   ```\n\n###### 十四、`2D` 转换之 `translate`\n\n1. `2D` 转换\n\n- `2D` 转换是改变标签在二维平面上的位置和形状\n- 移动： `translate`\n- 旋转： `rotate`\n- 缩放： `scale`\n\n1. `translate` 语法\n\n- x 就是 x 轴上水平移动\n- y 就是 y 轴上水平移动\n\n```css\n   transform: translate(x, y)\n   transform: translateX(n)\n   transfrom: translateY(n)\n```\n\n1. 重点知识点\n   - `2D` 的移动主要是指 水平、垂直方向上的移动\n   - `translate` 最大的优点就是不影响其他元素的位置\n   - `translate` 中的100%单位，是相对于本身的宽度和高度来进行计算的\n   - 行内标签没有效果\n2. 代码演示\n\n```css\ndiv {\n  background-color: lightseagreen;\n  width: 200px;\n  height: 100px;\n  /* 平移 */\n  /* 水平垂直移动 100px */\n  /* transform: translate(100px, 100px); */\n\n  /* 水平移动 100px */\n  /* transform: translate(100px, 0) */\n\n  /* 垂直移动 100px */\n  /* transform: translate(0, 100px) */\n\n  /* 水平移动 100px */\n  /* transform: translateX(100px); */\n\n  /* 垂直移动 100px */\n  transform: translateY(100px)\n}\n```\n\n###### 十五、让一个盒子水平垂直居中\n\n- 看代码\n\n###### 十六、`2D 转换 rotate`\n\n1. rotate 旋转\n   - `2D` 旋转指的是让元素在二维平面内顺时针或者逆时针旋转\n2. `rotate` 语法\n\n```css\n   /* 单位是：deg */\n   transform: rotate(度数) \n```\n\n1. 重点知识点\n\n- `rotate` 里面跟度数，单位是 `deg`\n- 角度为正时，顺时针，角度为负时，逆时针\n- 默认旋转的中心点是元素的中心点\n\n1. 代码演示\n\n```css\n   img:hover {\n     transform: rotate(360deg)\n   }\n```\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n', '1', '', '0', '0', '1', '2022-01-17 00:18:21', '2022-01-17 00:21:54');

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_tag_1` (`article_id`) USING BTREE,
  KEY `fk_article_tag_2` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
INSERT INTO `tb_article_tag` VALUES ('498', '49', '27');
INSERT INTO `tb_article_tag` VALUES ('499', '50', '27');
INSERT INTO `tb_article_tag` VALUES ('504', '47', '27');
INSERT INTO `tb_article_tag` VALUES ('506', '54', '28');
INSERT INTO `tb_article_tag` VALUES ('508', '53', '28');
INSERT INTO `tb_article_tag` VALUES ('509', '55', '29');
INSERT INTO `tb_article_tag` VALUES ('511', '48', '27');

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('184', '测试分类', '2022-01-01 15:50:57', null);
INSERT INTO `tb_category` VALUES ('332', 'Mybatis', '2022-01-15 23:18:40', null);
INSERT INTO `tb_category` VALUES ('333', '前端', '2022-01-17 00:09:14', null);

-- ----------------------------
-- Table structure for tb_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat_record`;
CREATE TABLE `tb_chat_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '聊天内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ip来源',
  `type` tinyint NOT NULL COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_chat_record
-- ----------------------------
INSERT INTO `tb_chat_record` VALUES ('1', null, '117.146.58.73', 'https://www.static.talkxj.com/photos/0bca52afdb2b9998132355d716390c9f.png', '000', '117.146.58.73', '新疆维吾尔自治区乌鲁木齐市 移动', '3', '2021-12-21 17:36:45', null);
INSERT INTO `tb_chat_record` VALUES ('2', null, '124.88.101.206', 'https://www.static.talkxj.com/photos/0bca52afdb2b9998132355d716390c9f.png', '1', '124.88.101.206', '新疆维吾尔自治区乌鲁木齐市 联通', '3', '2022-01-08 18:14:02', null);
INSERT INTO `tb_chat_record` VALUES ('3', null, '116.178.222.73', 'https://www.static.talkxj.com/photos/0bca52afdb2b9998132355d716390c9f.png', '<img style=\'vertical-align: middle\' src= \'https://www.static.talkxj.com/emoji/smile.jpg\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>', '116.178.222.73', '新疆维吾尔自治区乌鲁木齐市 联通', '3', '2022-01-08 20:43:27', null);
INSERT INTO `tb_chat_record` VALUES ('4', null, '49.117.191.57', 'https://www.static.talkxj.com/photos/0bca52afdb2b9998132355d716390c9f.png', 'weowoe<img style=\'vertical-align: middle\' src= \'https://www.static.talkxj.com/emoji/cy.jpg\' width=\'22\'height=\'20\' style=\'padding: 0 1px\'/>', '49.117.191.57', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '3', '2022-01-12 21:33:53', null);

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `article_id` int DEFAULT NULL COMMENT '评论文章id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int DEFAULT NULL COMMENT '父评论id',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `is_review` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_user` (`user_id`) USING BTREE,
  KEY `fk_comment_article` (`article_id`) USING BTREE,
  KEY `fk_comment_parent` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('425', '1', '47', '评论', null, null, '0', '1', '2022-01-02 15:53:27', null);

-- ----------------------------
-- Table structure for tb_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend_link`;
CREATE TABLE `tb_friend_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_friend_link_user` (`link_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单icon',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', '首页', '/', '/home/Home.vue', 'el-icon-myshouye', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', null, '0');
INSERT INTO `tb_menu` VALUES ('2', '文章管理', '/article-submenu', 'Layout', 'el-icon-mywenzhang-copy', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', null, '0');
INSERT INTO `tb_menu` VALUES ('3', '消息管理', '/message-submenu', 'Layout', 'el-icon-myxiaoxi', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '3', null, '0');
INSERT INTO `tb_menu` VALUES ('4', '系统管理', '/system-submenu', 'Layout', 'el-icon-myshezhi', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '5', null, '0');
INSERT INTO `tb_menu` VALUES ('5', '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-myuser', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '7', null, '0');
INSERT INTO `tb_menu` VALUES ('6', '发布文章', '/articles', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '2', '0');
INSERT INTO `tb_menu` VALUES ('7', '修改文章', '/articles/*', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '2', '1');
INSERT INTO `tb_menu` VALUES ('8', '文章列表', '/article-list', '/article/ArticleList.vue', 'el-icon-mywenzhangliebiao', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '3', '2', '0');
INSERT INTO `tb_menu` VALUES ('9', '分类管理', '/categories', '/category/Category.vue', 'el-icon-myfenlei', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '4', '2', '0');
INSERT INTO `tb_menu` VALUES ('10', '标签管理', '/tags', '/tag/Tag.vue', 'el-icon-myicontag', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '5', '2', '0');
INSERT INTO `tb_menu` VALUES ('11', '评论管理', '/comments', '/comment/Comment.vue', 'el-icon-mypinglunzu', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '3', '0');
INSERT INTO `tb_menu` VALUES ('12', '留言管理', '/messages', '/message/Message.vue', 'el-icon-myliuyan', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '3', '0');
INSERT INTO `tb_menu` VALUES ('13', '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '202', '0');
INSERT INTO `tb_menu` VALUES ('14', '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '213', '0');
INSERT INTO `tb_menu` VALUES ('15', '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '213', '0');
INSERT INTO `tb_menu` VALUES ('16', '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '213', '0');
INSERT INTO `tb_menu` VALUES ('17', '友链管理', '/links', '/friendLink/FriendLink.vue', 'el-icon-mydashujukeshihuaico-', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '3', '4', '0');
INSERT INTO `tb_menu` VALUES ('18', '关于我', '/about', '/about/About.vue', 'el-icon-myguanyuwo', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '4', '4', '0');
INSERT INTO `tb_menu` VALUES ('19', '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '6', null, '0');
INSERT INTO `tb_menu` VALUES ('20', '操作日志', '/operation/log', '/log/Operation.vue', 'el-icon-myguanyuwo', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '19', '0');
INSERT INTO `tb_menu` VALUES ('201', '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '7', '202', '0');
INSERT INTO `tb_menu` VALUES ('202', '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '4', null, '0');
INSERT INTO `tb_menu` VALUES ('205', '相册管理', '/album-submenu', 'Layout', 'el-icon-myimage-fill', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '5', null, '0');
INSERT INTO `tb_menu` VALUES ('206', '相册列表', '/albums', '/album/Album.vue', 'el-icon-myzhaopian', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '205', '0');
INSERT INTO `tb_menu` VALUES ('208', '照片管理', '/albums/:albumId', '/album/Photo.vue', 'el-icon-myzhaopian', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '205', '1');
INSERT INTO `tb_menu` VALUES ('209', '页面管理', '/pages', '/page/Page.vue', 'el-icon-myyemianpeizhi', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '2', '4', '0');
INSERT INTO `tb_menu` VALUES ('210', '照片回收站', '/photos/delete', '/album/Delete.vue', 'el-icon-myhuishouzhan', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '3', '205', '1');
INSERT INTO `tb_menu` VALUES ('213', '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '4', null, '0');
INSERT INTO `tb_menu` VALUES ('214', '网站管理', '/website', '/website/Website.vue', 'el-icon-myxitong', '2022-01-01 17:06:51', '2022-01-01 17:06:51', '1', '4', '0');

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户地址',
  `time` tinyint(1) DEFAULT NULL COMMENT '弹幕速度',
  `is_review` tinyint NOT NULL DEFAULT '1' COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES ('1', '游客', 'https://lyqblog.oss-cn-beijing.aliyuncs.com/config/92ecad86626e5bf5214a2bc514dddc8c.jpeg', '666666', '116.178.222.73', '新疆维吾尔自治区乌鲁木齐市 联通', '8', '1', '2022-01-08 20:42:53', null);
INSERT INTO `tb_message` VALUES ('2', 'wkc++', 'http://thirdqq.qlogo.cn/g?b=oidb&k=d0jUT6icXAA531iacTtibvZ1A&s=40&t=1592391464', '奥里给了', '124.88.101.206', '新疆维吾尔自治区乌鲁木齐市 联通', '9', '1', '2022-01-10 14:14:16', null);
INSERT INTO `tb_message` VALUES ('3', '游客', 'https://lyqblog.oss-cn-beijing.aliyuncs.com/config/92ecad86626e5bf5214a2bc514dddc8c.jpeg', '围殴', '49.117.191.57', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '7', '1', '2022-01-12 21:35:24', null);

-- ----------------------------
-- Table structure for tb_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_log`;
CREATE TABLE `tb_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `opt_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_operation_log
-- ----------------------------
INSERT INTO `tb_operation_log` VALUES ('688', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":1,\"resourceIdList\":[165,192,193,194,195,166,183,184,246,247,167,199,200,201,168,185,186,187,188,189,190,191,254,169,208,209,170,234,235,236,237,171,213,214,215,216,217,224,172,240,241,244,245,267,269,270,173,239,242,276,174,205,206,207,175,218,219,220,221,222,223,176,202,203,204,230,238,177,229,232,233,243,178,196,197,198,257,258,179,225,226,227,228,231,180,210,211,212],\"roleLabel\":\"admin\",\"roleName\":\"管理员\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', '管理员', '127.0.0.1', '', '2021-12-10 11:25:33', null);
INSERT INTO `tb_operation_log` VALUES ('689', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":3,\"resourceIdList\":[192,195,183,246,199,185,191,254,208,234,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,231,210],\"roleLabel\":\"test\",\"roleName\":\"测试\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', '管理员', '127.0.0.1', '', '2022-01-01 11:25:40', null);
INSERT INTO `tb_operation_log` VALUES ('690', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"## 目录\\n\\n恭喜你已成功运行博客，开启你的文章之旅吧\",\"articleCover\":\"https://www.static.talkxj.com/articles/bd74062266c1fb04f3084968231c0580.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":47,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', '管理员', '127.0.0.1', '', '2022-01-01 16:08:02', null);
INSERT INTO `tb_operation_log` VALUES ('691', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"大家好我是渣渣辉\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.comarticles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"2021-12-21\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', '管理员', '117.146.58.73', '新疆维吾尔自治区乌鲁木齐市 移动', '2021-12-21 16:59:40', null);
INSERT INTO `tb_operation_log` VALUES ('692', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"大家好我是渣渣辉\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"2021-12-21\",\"categoryName\":\"测试分类\",\"id\":48,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '127.0.0.1', '', '2021-12-21 23:12:51', null);
INSERT INTO `tb_operation_log` VALUES ('693', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"333\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"2021-12-21\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '127.0.0.1', '', '2021-12-21 23:19:16', null);
INSERT INTO `tb_operation_log` VALUES ('694', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"444\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/307fe188785e42e85f1be8795e6d9ab5.png\",\"articleTitle\":\"2021-12-22\",\"categoryName\":\"测试分类\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '127.0.0.1', '', '2021-12-22 17:34:27', null);
INSERT INTO `tb_operation_log` VALUES ('695', '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[50],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '127.0.0.1', '', '2021-12-22 17:34:44', null);
INSERT INTO `tb_operation_log` VALUES ('696', '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[49],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '127.0.0.1', '', '2021-12-22 17:34:49', null);
INSERT INTO `tb_operation_log` VALUES ('697', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"大家好我是wkc++\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"2021-12-21\",\"categoryName\":\"测试分类\",\"id\":48,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '117.146.58.73', '新疆维吾尔自治区乌鲁木齐市 移动', '2021-12-22 18:17:17', null);
INSERT INTO `tb_operation_log` VALUES ('698', '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[52],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '124.88.101.206', '新疆维吾尔自治区乌鲁木齐市 联通', '2022-01-08 18:11:37', null);
INSERT INTO `tb_operation_log` VALUES ('699', '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[51],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '124.88.101.206', '新疆维吾尔自治区乌鲁木齐市 联通', '2022-01-08 18:11:44', null);
INSERT INTO `tb_operation_log` VALUES ('710', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"## 目录\\n欢迎访问wkc++博客!\",\"articleCover\":\"https://www.static.talkxj.com/articles/bd74062266c1fb04f3084968231c0580.jpg\",\"articleTitle\":\"测试文章\",\"categoryName\":\"测试分类\",\"id\":47,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-15 23:18:30', null);
INSERT INTO `tb_operation_log` VALUES ('711', '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"Mybatis\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-15 23:18:40', null);
INSERT INTO `tb_operation_log` VALUES ('712', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n### 一.Mybatis快速入门\\n\\n#### 1.1 框架介绍\\n\\n- 框架是一款半成品软件，我们可以基于这个半成品软件继续开发，来完成我们个性化的需求！\\n\\n\\n\\n\\n​ \\n\\n#### 1.2 ORM介绍\\n\\n- ORM(Object Relational Mapping)： 对象关系映射\\n\\n- 指的是持久化数据和实体对象的映射模式，为了解决面向对象与关系型数据库存在的互不匹配的现象的技术。\\n\\n- 如图:\\n![1590919786415.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8ce998dd74db7b60d378287d18f0a328.png)\\n\\n- 具体映射关系如下图:\\n\\n![1590919824416.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/233bb18c9a211f13a4d6610919f3cfed.png)\\n\\n\\n\\n#### 1.4 原始jdbc操作的分析\\n\\n- 原始 JDBC 的操作问题分析 \\n\\n  ​    1.频繁创建和销毁数据库的连接会造成系统资源浪费从而影响系统性能。\\n\\n  1. sql 语句在代码中硬编码，如果要修改 sql 语句，就需要修改 java 代码，造成代码不易维护。\\n  2. 查询操作时，需要手动将结果集中的数据封装到实体对象中。\\n  3. 增删改查操作需要参数时，需要手动将实体对象的数据设置到 sql 语句的占位符。 \\n\\n- 原始 JDBC 的操作问题解决方案 \\n\\n  ​    1.使用数据库连接池初始化连接资源。 \\n\\n  1. 将 sql 语句抽取到配置文件中。 \\n  2. 使用反射、内省等底层技术，将实体与表进行属性与字段的自动映射    \\n\\n#### 1.5 什么是Mybatis\\n\\nmybatis 是一个优秀的基于java的持久层框架，它内部封装了jdbc，使开发者只需要关注sql语句本身，而不需要花费精力去处理加载驱动、创建连接、创建statement等繁杂的过程。\\n\\nmybatis通过xml或注解的方式将要执行的各种 statement配置起来，并通过java对象和statement中sql的动态参数进行映射生成最终执行的sql语句。\\n\\n最后mybatis框架执行sql并将结果映射为java对象并返回。采用ORM思想解决了实体和数据库映射的问题，对jdbc 进行了封装，屏蔽了jdbc api 底层访问细节，使我们不用与jdbc api 打交道，就可以完成对数据库的持久化操作。\\n\\nMyBatis官网地址：<http://www.mybatis.org/mybatis-3/> \\n\\n#### 1.6  Mybatis的快速入门\\n\\n**MyBatis开发步骤：**\\n\\n①添加MyBatis的jar包\\n\\n②创建Student数据表\\n\\n③编写Studentr实体类 \\n\\n④编写映射文件StudentMapper.xml\\n\\n⑤编写核心文件MyBatisConfig.xml\\n\\n⑥编写测试类\\n\\n##### 1.7.1  环境搭建\\n\\n1)导入MyBatis的jar包\\n\\n- mysql-connector-java-5.1.37-bin.jar\\n- mybatis-3.5.3.jar\\n- log4j-1.2.17.jar\\n\\n2)  创建student数据表\\n\\n![1590916243454.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/09928c1e6fe5125ea2fe6ff158e5b53f.png)\\n3) 编写Student实体\\n\\n```java\\npublic class Student {\\n    private Integer id;\\n    private String name;\\n    private Integer age;\\n    //省略get个set方法\\n}\\n```\\n\\n4)编写StudentMapper.xml映射文件\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE mapper\\n        PUBLIC \\\"-//mybatis.org//DTD Mapper 3.0//EN\\\"\\n        \\\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\\\">\\n\\n<!--\\n    mapper：核心根标签\\n    namespace属性：名称空间\\n-->\\n<mapper namespace=\\\"StudentMapper\\\">\\n    <!--\\n        select：查询功能的标签\\n        id属性：唯一标识\\n        resultType属性：指定结果映射对象类型\\n        parameterType属性：指定参数映射对象类型\\n    -->\\n    <select id=\\\"selectAll\\\" resultType=\\\"student\\\">\\n        SELECT * FROM student\\n    </select>\\n</mapper>\\n```\\n\\n5) 编写MyBatis核心文件\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE configuration PUBLIC \\\"-//mybatis.org//DTD Config 3.0//EN\\\" \\\"http://mybatis.org/dtd/mybatis-3-config.dtd\\\">\\n\\n<!--configuration 核心根标签-->\\n<configuration>\\n\\n    <!--引入数据库连接的配置文件-->\\n    <properties resource=\\\"jdbc.properties\\\"/>\\n\\n    <!--配置LOG4J-->\\n    <settings>\\n        <setting name=\\\"logImpl\\\" value=\\\"log4j\\\"/>\\n    </settings>\\n\\n    <!--起别名-->\\n    <typeAliases>\\n        <typeAlias type=\\\"com.lyq.bean.Student\\\" alias=\\\"student\\\"/>\\n        <!--<package name=\\\"com.lyq.bean\\\"/>-->\\n    </typeAliases>\\n\\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\\n    <environments default=\\\"mysql\\\">\\n        <!--environment配置数据库环境  id属性唯一标识-->\\n        <environment id=\\\"mysql\\\">\\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\\n            <transactionManager type=\\\"JDBC\\\"></transactionManager>\\n            <!-- dataSource数据源信息   type属性 连接池-->\\n            <dataSource type=\\\"POOLED\\\">\\n                <!-- property获取数据库连接的配置信息 -->\\n                <property name=\\\"driver\\\" value=\\\"${driver}\\\" />\\n                <property name=\\\"url\\\" value=\\\"${url}\\\" />\\n                <property name=\\\"username\\\" value=\\\"${username}\\\" />\\n                <property name=\\\"password\\\" value=\\\"${password}\\\" />\\n            </dataSource>\\n        </environment>\\n    </environments>\\n\\n    <!-- mappers引入映射配置文件 -->\\n    <mappers>\\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\\n        <mapper resource=\\\"StudentMapper.xml\\\"/>\\n    </mappers>\\n</configuration>\\n\\n```\\n\\n##### 1.7.2编写测试代码\\n\\n```java\\n/*\\n    控制层测试类\\n */\\npublic class StudentController {\\n    //创建业务层对象\\n    private StudentService service = new StudentServiceImpl();\\n\\n    //查询全部功能测试\\n    @Test\\n    public void selectAll() {\\n        List<Student> students = service.selectAll();\\n        for (Student stu : students) {\\n            System.out.println(stu);\\n        }\\n    }\\n}\\n```\\n\\n#### 1.8 知识小结\\n\\n- 框架       \\n\\n  框架是一款半成品软件，我们可以基于框架继续开发，从而完成一些个性化的需求。\\n\\n- ORM        \\n\\n  对象关系映射，数据和实体对象的映射。\\n\\n- MyBatis       \\n\\n  是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC。\\n\\n### 二. MyBatis的相关api\\n\\n#### 2.1 Resources\\n\\n- org.apache.ibatis.io.Resources：加载资源的工具类。\\n\\n- 核心方法\\n\\n![1590917572321.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/afbb2dc902c798cba23eccbe1732d40a.png)\\n#### 2.2 构建器SqlSessionFactoryBuilder\\n\\n- org.apache.ibatis.session.SqlSessionFactoryBuilder：获取 SqlSessionFactory 工厂对象的功能类\\n\\n- 核心方法\\n\\n![1590916852504.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/1c35b367f9cce5175287391d8ba4b4b2.png)\\n\\n- 通过加载mybatis的核心文件的输入流的形式构建一个SqlSessionFactory对象\\n\\n```java\\nString resource = \\\"org/mybatis/builder/mybatis-config.xml\\\"; \\nInputStream inputStream = Resources.getResourceAsStream(resource); \\nSqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); \\nSqlSessionFactory factory = builder.build(inputStream);\\n```\\n\\n其中， Resources 工具类，这个类在 org.apache.ibatis.io 包中。Resources 类帮助你从类路径下、文件系统或一个 web URL 中加载资源文件。\\n\\n#### 2.3 工厂对象SqlSessionFactory\\n\\n- org.apache.ibatis.session.SqlSessionFactory：获取 SqlSession 构建者对象的工厂接口。\\n\\n- 核心api\\n\\n![1590917006637.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/e35580b64672c4115d300bae9b6ca28e.png)\\n\\n#### 2.4 SqlSession会话对象\\n\\n- org.apache.ibatis.session.SqlSession：构建者对象接口。用于执行 SQL、管理事务、接口代理。\\n\\n- 核心api\\n![1590917052849.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a88e0f3169cef143cbca4675e9f51754.png)\\nSqlSession 实例在 MyBatis 中是非常强大的一个类。在这里你会看到所有执行语句、提交或回滚事务和获取映射器实例的方法。\\n\\n### 三.MyBatis 映射配置文件\\n\\n#### 3.1 映射配置文件介绍\\n\\n- 映射配置文件包含了数据和对象之间的映射关系以及要执行的 SQL 语句\\n\\n\\n#### 3.2 查询功能\\n\\n- <select>：查询功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n####3.3 新增功能 \\n\\n- <insert>：新增功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n\\n\\n#### 3.4 修改功能\\n\\n- <update>：修改功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n\\n#### 3.5 删除功能\\n\\n- <delete>：查询功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n- 总结： 大家可以发现crud操作，除了标签名称以及sql语句不一样之外，其他属性参数基本一致。\\n\\n#### 3.6 映射配置文件小结\\n\\n![1590918743943.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a074e7c53ea558ca61c0f7dbaa619ece.png)\\n\\n### 四.Mybatis核心配置文件介绍\\n\\n#### 4.1 核心配置文件介绍\\n\\n核心配置文件包含了 MyBatis 最核心的设置和属性信息。如数据库的连接、事务、连接池信息等。\\n\\n如下图:\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE configuration PUBLIC \\\"-//mybatis.org//DTD Config 3.0//EN\\\" \\\"http://mybatis.org/dtd/mybatis-3-config.dtd\\\">\\n\\n<!--configuration 核心根标签-->\\n<configuration>\\n\\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\\n    <environments default=\\\"mysql\\\">\\n        <!--environment配置数据库环境  id属性唯一标识-->\\n        <environment id=\\\"mysql\\\">\\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\\n            <transactionManager type=\\\"JDBC\\\"></transactionManager>\\n            <!-- dataSource数据源信息   type属性 连接池-->\\n            <dataSource type=\\\"POOLED\\\">\\n                <!-- property获取数据库连接的配置信息 -->\\n                <property name=\\\"driver\\\" value=\\\"com.mysql.jdbc.Driver\\\" />\\n                <property name=\\\"url\\\" value=\\\"jdbc:mysql:///db1\\\" />\\n                <property name=\\\"username\\\" value=\\\"root\\\" />\\n                <property name=\\\"password\\\" value=\\\"root\\\" />\\n            </dataSource>\\n        </environment>\\n    </environments>\\n\\n    <!-- mappers引入映射配置文件 -->\\n    <mappers>\\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\\n        <mapper resource=\\\"StudentMapper.xml\\\"/>\\n    </mappers>\\n</configuration>\\n```\\n\\n#### 4.2 数据库连接配置文件引入\\n\\n- properties标签引入外部文件\\n\\n  ```xml\\n      <!--引入数据库连接的配置文件-->\\n      <properties resource=\\\"jdbc.properties\\\"/>\\n  ```\\n\\n- 具体使用，如下配置\\n\\n  ```xml\\n    <!-- property获取数据库连接的配置信息 -->\\n      <property name=\\\"driver\\\" value=\\\"${driver}\\\" />\\n      <property name=\\\"url\\\" value=\\\"${url}\\\" />\\n      <property name=\\\"username\\\" value=\\\"${username}\\\" />\\n      <property name=\\\"password\\\" value=\\\"${password}\\\" />\\n  ```\\n\\n#### 4.3 起别名\\n\\n- <typeAliases>：为全类名起别名的父标签。\\n\\n- <typeAlias>：为全类名起别名的子标签。\\n\\n- 属性      \\n\\n  type：指定全类名      \\n\\n  alias：指定别名\\n\\n- <package>：为指定包下所有类起别名的子标签。(别名就是类名)\\n\\n- 如下图：\\n\\n![1590919106324.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/5d4beb5d51aba65b50c8554454b2fef9.png)\\n\\n- 具体如下配置\\n\\n  ```xml\\n      <!--起别名-->\\n      <typeAliases>\\n          <typeAlias type=\\\"com.itheima.bean.Student\\\" alias=\\\"student\\\"/>\\n          <!--<package name=\\\"com.itheima.bean\\\"/>-->\\n      </typeAliase\\n  ```\\n\\n#### 4.4 总结\\n![1590919367790.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/d47caea100afecaa5cbe73d10d013dbe.png)\\n\\n### 五.Mybatis传统方式开发\\n\\n#### 5.1 Dao 层传统实现方式\\n\\n- 分层思想：控制层(controller)、业务层(service)、持久层(dao)。\\n\\n- 调用流程\\n![1590919558066.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/f1597c1ad9a283c1f3f91546b727e2e8.png)\\n\\n#### 5.2 LOG4J的配置和使用\\n\\n- 在日常开发过程中，排查问题时难免需要输出 MyBatis 真正执行的 SQL 语句、参数、结果等信息，我们就可以借助 LOG4J 的功能来实现执行信息的输出。\\n\\n- 使用步骤：\\n\\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/aabc2a7d61ad9858993a5fdc41619b69.jpeg\",\"articleTitle\":\"Mybatis复习1\",\"categoryName\":\"Mybatis\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[\"Mybatis\"],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-15 23:39:58', null);
INSERT INTO `tb_operation_log` VALUES ('713', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"### 一.接口代理方式实现Dao\\n\\n#### 1.1 代理开发方式介绍\\n\\n​\\t采用 Mybatis 的代理开发方式实现 DAO 层的开发，这种方式是我们后面进入企业的主流。\\n\\nMapper 接口开发方法只需要程序员编写Mapper 接口（相当于Dao 接口），由Mybatis 框架根据接口定义创建接口的动态代理对象，代理对象的方法体同上边Dao接口实现类方法。\\n\\nMapper 接口开发需要遵循以下规范：\\n\\n**1) Mapper.xml文件中的namespace与mapper接口的全限定名相同**\\n\\n**2) Mapper接口方法名和Mapper.xml中定义的每个statement的id相同**\\n\\n**3) Mapper接口方法的输入参数类型和mapper.xml中定义的每个sql的parameterType的类型相同**\\n\\n**4) Mapper接口方法的输出参数类型和mapper.xml中定义的每个sql的resultType的类型相同**\\n\\n总结: \\n\\n接口开发的方式: 程序员只需定义接口,就可以对数据库进行操作,那么具体的对象怎么创建?\\n\\n1.程序员负责定义接口\\n\\n2.在操作数据库,mybatis框架根据接口,通过动态代理的方式生成代理对象,负责数据库的crud操作\\n\\n\\n![1590937589503.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/b9ee3ea9d0c6438663c9e1ecd41d4dff.png)\\n\\n\\n#### 1.3 测试代理方式\\n\\n```java\\n public Student selectById(Integer id) {\\n        Student stu = null;\\n        SqlSession sqlSession = null;\\n        InputStream is = null;\\n        try{\\n            //1.加载核心配置文件\\n            is = Resources.getResourceAsStream(\\\"MyBatisConfig.xml\\\");\\n\\n            //2.获取SqlSession工厂对象\\n            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\\n\\n            //3.通过工厂对象获取SqlSession对象\\n            sqlSession = sqlSessionFactory.openSession(true);\\n\\n            //4.获取StudentMapper接口的实现类对象\\n            StudentMapper mapper = sqlSession.getMapper(StudentMapper.class); // StudentMapper mapper = new StudentMapperImpl();\\n\\n            //5.通过实现类对象调用方法，接收结果\\n            stu = mapper.selectById(id);\\n\\n        } catch (Exception e) {\\n\\n        } finally {\\n            //6.释放资源\\n            if(sqlSession != null) {\\n                sqlSession.close();\\n            }\\n            if(is != null) {\\n                try {\\n                    is.close();\\n                } catch (IOException e) {\\n                    e.printStackTrace();\\n                }\\n            }\\n        }\\n\\n        //7.返回结果\\n        return stu;\\n    }\\n```\\n\\n#### 1.4 源码分析\\n- 分析动态代理对象如何生成的？ \\n\\n  通过动态代理开发模式，我们只编写一个接口，不写实现类，我们通过 getMapper() 方法最终获取到 org.apache.ibatis.binding.MapperProxy 代理对象，然后执行功能，而这个代理对象正是 MyBatis 使用了 JDK 的动态代理技术，帮助我们生成了代理实现类对象。从而可以进行相关持久化操作。 \\n\\n- 分析方法是如何执行的？\\n\\n  动态代理实现类对象在执行方法的时候最终调用了 mapperMethod.execute() 方法，这个方法中通过 switch 语句根据操作类型来判断是新增、修改、删除、查询操作，最后一步回到了 MyBatis 最原生的 SqlSession 方式来执行增删改查。   \\n\\n#### 1.5 知识小结\\n\\n 接口代理方式可以让我们只编写接口即可，而实现类对象由 MyBatis 生成。 \\n\\n 实现规则 ：\\n\\n1. 映射配置文件中的名称空间必须和 Dao 层接口的全类名相同。\\n2. 映射配置文件中的增删改查标签的 id 属性必须和 Dao 层接口的方法名相同。 \\n3. 映射配置文件中的增删改查标签的 parameterType 属性必须和 Dao 层接口方法的参数相同。 \\n4. 映射配置文件中的增删改查标签的 resultType 属性必须和 Dao 层接口方法的返回值相同。 \\n5. 获取动态代理对象 SqlSession 功能类中的 getMapper() 方法。    \\n\\n### 二. 动态sql语句\\n\\n#### 2.1 动态sql语句概述\\n\\n​\\tMybatis 的映射文件中，前面我们的 SQL 都是比较简单的，有些时候业务逻辑复杂时，我们的 SQL是动态变化的，此时在前面的学习中我们的 SQL 就不能满足要求了。\\n\\n参考的官方文档，描述如下：\\n![图片2.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/3a6bbc0c410b2b346a6b993a8bcf26aa.png)\\n\\n#### 2.2 动态 SQL  之<**if>**\\n\\n我们根据实体类的不同取值，使用不同的 SQL语句来进行查询。比如在 id如果不为空时可以根据id查询，如果username 不同空时还要加入用户名作为条件。这种情况在我们的多条件组合查询中经常会碰到。\\n\\n\\n如下图：\\n\\n```xml\\n<select id=\\\"findByCondition\\\" parameterType=\\\"student\\\" resultType=\\\"student\\\">\\n    select * from student\\n    <where>\\n        <if test=\\\"id!=0\\\">\\n            and id=#{id}\\n        </if>\\n        <if test=\\\"username!=null\\\">\\n            and username=#{username}\\n        </if>\\n    </where>\\n</select>\\n\\n```\\n\\n当查询条件id和username都存在时，控制台打印的sql语句如下：\\n\\n\\n```java\\n     … … …\\n     //获得MyBatis框架生成的StudentMapper接口的实现类\\n    StudentMapper mapper = sqlSession.getMapper( StudentMapper.class);\\n    Student condition = new Student();\\n    condition.setId(1);\\n    condition.setUsername(\\\"lucy\\\");\\n    Student student = mapper.findByCondition(condition);\\n    … … …\\n```\\n![1590936579118.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/4567f438797078e9e117ddff6c534a00.png)\\n\\n \\n\\n当查询条件只有id存在时，控制台打印的sql语句如下：\\n\\n\\n```java\\n … … …\\n //获得MyBatis框架生成的UserMapper接口的实现类\\n StudentMapper mapper = sqlSession.getMapper( StudentMapper.class);\\n    Student condition = new Student();\\n    condition.setId(1);\\n    Student student = mapper.findByCondition(condition);\\n… … …\\n\\n```\\n\\n![1590936654661.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10383fe26f8f53920e7c8bbbe5657b0b.png)\\n\\n总结语法:\\n\\n```xml\\n<where>：条件标签。如果有动态条件，则使用该标签代替 where 关键字。\\n<if>：条件判断标签。\\n<if test=“条件判断”>\\n\\t查询条件拼接\\n</if>\\n```\\n\\n\\n\\n#### 2.3  动态 SQL  之<**foreach>**\\n循环执行sql的拼接操作，例如：SELECT * FROM student  WHERE id IN (1,2,5)。\\n\\n```xml\\n<select id=\\\"findByIds\\\" parameterType=\\\"list\\\" resultType=\\\"student\\\">\\n    select * from student\\n    <where>\\n        <foreach collection=\\\"array\\\" open=\\\"id in(\\\" close=\\\")\\\" item=\\\"id\\\" separator=\\\",\\\">\\n            #{id}\\n        </foreach>\\n    </where>\\n</select>\\n```\\n\\n测试代码片段如下：\\n\\n```java\\n … … …\\n //获得MyBatis框架生成的UserMapper接口的实现类\\nStudentMapper mapper = sqlSession.getMapper(StudentMapper.class);\\nint[] ids = new int[]{2,5};\\nList<Student> sList = mapper.findByIds(ids);\\nSystem.out.println(sList);\\n… … …\\n\\n```\\n\\n总结语法:\\n\\n```xml\\n<foreach>：循环遍历标签。适用于多个参数或者的关系。\\n    <foreach collection=“”open=“”close=“”item=“”separator=“”>\\n\\t\\t获取参数\\n\\t</foreach>\\n```\\n\\n属性\\ncollection：参数容器类型， (list-集合， array-数组)。\\nopen：开始的 SQL 语句。\\nclose：结束的 SQL 语句。\\nitem：参数变量名。\\nseparator：分隔符。\\n\\n#### 2.4  SQL片段抽取\\n\\nSql 中可将重复的 sql 提取出来，使用时用 include 引用即可，最终达到 sql 重用的目的\\n\\n```xml\\n<!--抽取sql片段简化编写-->\\n<sql id=\\\"selectStudent\\\" select * from student</sql>\\n<select id=\\\"findById\\\" parameterType=\\\"int\\\" resultType=\\\"student\\\">\\n    <include refid=\\\"selectStudent\\\"></include> where id=#{id}\\n</select>\\n<select id=\\\"findByIds\\\" parameterType=\\\"list\\\" resultType=\\\"student\\\">\\n    <include refid=\\\"selectStudent\\\"></include>\\n    <where>\\n        <foreach collection=\\\"array\\\" open=\\\"id in(\\\" close=\\\")\\\" item=\\\"id\\\" separator=\\\",\\\">\\n            #{id}\\n        </foreach>\\n    </where>\\n</select>\\n```\\n\\n总结语法:\\n\\n我们可以将一些重复性的 SQL 语句进行抽取，以达到复用的效果。 \\n\\n```xml\\n-  <sql>：抽取 SQL 语句标签。 \\n-  <include>：引入 SQL 片段标签。 \\n   <sql id=“片段唯一标识”>抽取的 SQL 语句</sql> <include refid=“片段唯一标识”/>\\n \\n```\\n\\n#### 2.5 知识小结\\n\\nMyBatis映射文件配置：\\n\\n```xml\\n<select>：查询\\n\\n<insert>：插入\\n\\n<update>：修改\\n\\n<delete>：删除\\n\\n<where>：where条件\\n\\n<if>：if判断\\n\\n<foreach>：循环\\n\\n<sql>：sql片段抽取\\n\\n```\\n\\n\\n### 三. 分页插件\\n\\n#### 3.1 分页插件介绍\\n\\n![1590937779260.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/3a76d554d7cbbd61e8b8384f53138a76.png)\\n\\n- 分页可以将很多条结果进行分页显示。 \\n- 如果当前在第一页，则没有上一页。如果当前在最后一页，则没有下一页。 \\n- 需要明确当前是第几页，这一页中显示多少条结果。    \\n- MyBatis分页插件总结\\n  1. 在企业级开发中，分页也是一种常见的技术。而目前使用的 MyBatis 是不带分页功能的，如果想实现分页的 功能，需要我们手动编写 LIMIT 语句。但是不同的数据库实现分页的 SQL 语句也是不同的，所以手写分页 成本较高。这个时候就可以借助分页插件来帮助我们实现分页功能。 \\n  2. PageHelper：第三方分页助手。将复杂的分页操作进行封装，从而让分页功能变得非常简单。    \\n\\n#### 3.2 分页插件的使用\\n\\nMyBatis可以使用第三方的插件来对功能进行扩展，分页助手PageHelper是将分页的复杂操作进行封装，使用简单的方式即可获得分页的相关数据\\n\\n开发步骤：\\n\\n①导入与PageHelper的jar包\\n\\n②在mybatis核心配置文件中配置PageHelper插件\\n\\n```xml\\n<!-- 注意：分页助手的插件  配置在通用mapper之前 -->\\n<plugin interceptor=\\\"com.github.pagehelper.PageHelper\\\">\\n    <!-- 指定方言 -->\\n    <property name=\\\"dialect\\\" value=\\\"mysql\\\"/>\\n</plugin>\\n```\\n\\n③测试分页数据获取\\n\\n```java\\n@Test\\npublic void testPageHelper(){\\n    //设置分页参数\\n    PageHelper.startPage(1,2);\\n\\n    List<User> select = userMapper2.select(null);\\n    for(User user : select){\\n        System.out.println(user);\\n    }\\n}\\n```\\n\\n#### 3.3 分页插件的参数获取\\n\\n**获得分页相关的其他参数**：\\n\\n```java\\n//其他分页的数据\\nPageInfo<User> pageInfo = new PageInfo<User>(select);\\nSystem.out.println(\\\"总条数：\\\"+pageInfo.getTotal());\\nSystem.out.println(\\\"总页数：\\\"+pageInfo.getPages());\\nSystem.out.println(\\\"当前页：\\\"+pageInfo.getPageNum());\\nSystem.out.println(\\\"每页显示长度：\\\"+pageInfo.getPageSize());\\nSystem.out.println(\\\"是否第一页：\\\"+pageInfo.isIsFirstPage());\\nSystem.out.println(\\\"是否最后一页：\\\"+pageInfo.isIsLastPage());\\n\\n```\\n\\n#### 3.4  分页插件知识小结\\n\\n​    分页：可以将很多条结果进行分页显示。 \\n\\n- 分页插件 jar 包： pagehelper-5.1.10.jar jsqlparser-3.1.jar \\n\\n- <plugins>：集成插件标签。 \\n\\n- 分页助手相关 API \\n\\n  ​    1.PageHelper：分页助手功能类。\\n\\n  1. startPage()：设置分页参数 \\n  2. PageInfo：分页相关参数功能类。 \\n  3. getTotal()：获取总条数 \\n  4. getPages()：获取总页数\\n  5. getPageNum()：获取当前页\\n  6. getPageSize()：获取每页显示条数\\n  7. getPrePage()：获取上一页 \\n  8. getNextPage()：获取下一页 \\n  9. isIsFirstPage()：获取是否是第一页 \\n  10. isIsLastPage()：获取是否是最后一页    \\n\\n### 四.MyBatis的多表操作\\n\\n#### 4.1 多表模型介绍\\n\\n我们之前学习的都是基于单表操作的，而实际开发中，随着业务难度的加深，肯定需要多表操作的。 \\n\\n- 多表模型分类 一对一：在任意一方建立外键，关联对方的主键。\\n- 一对多：在多的一方建立外键，关联一的一方的主键。\\n- 多对多：借助中间表，中间表至少两个字段，分别关联两张表的主键。    \\n\\n\\n#### 4.2 多表模型一对一操作\\n\\n1. 一对一模型： 人和身份证，一个人只有一个身份证\\n\\n2. 代码实现\\n\\n   - 步骤一: sql语句准备\\n\\n     ```sql\\n     CREATE TABLE person(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tNAME VARCHAR(20),\\n     \\tage INT\\n     );\\n     INSERT INTO person VALUES (NULL,\'张三\',23);\\n     INSERT INTO person VALUES (NULL,\'李四\',24);\\n     INSERT INTO person VALUES (NULL,\'王五\',25);\\n\\n     CREATE TABLE card(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tnumber VARCHAR(30),\\n     \\tpid INT,\\n     \\tCONSTRAINT cp_fk FOREIGN KEY (pid) REFERENCES person(id)\\n     );\\n     INSERT INTO card VALUES (NULL,\'12345\',1);\\n     INSERT INTO card VALUES (NULL,\'23456\',2);\\n     INSERT INTO card VALUES (NULL,\'34567\',3);\\n     ```\\n\\n   - 步骤二:配置文件\\n\\n     ```xml\\n     <?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n     <!DOCTYPE mapper\\n             PUBLIC \\\"-//mybatis.org//DTD Mapper 3.0//EN\\\"\\n             \\\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\\\">\\n\\n     <mapper namespace=\\\"com.lyq.table01.OneToOneMapper\\\">\\n         <!--配置字段和实体对象属性的映射关系-->\\n         <resultMap id=\\\"oneToOne\\\" type=\\\"card\\\">\\n             <id column=\\\"cid\\\" property=\\\"id\\\" />\\n             <result column=\\\"number\\\" property=\\\"number\\\" />\\n             <!--\\n                 association：配置被包含对象的映射关系\\n                 property：被包含对象的变量名\\n                 javaType：被包含对象的数据类型\\n             -->\\n             <association property=\\\"p\\\" javaType=\\\"person\\\">\\n                 <id column=\\\"pid\\\" property=\\\"id\\\" />\\n                 <result column=\\\"name\\\" property=\\\"name\\\" />\\n                 <result column=\\\"age\\\" property=\\\"age\\\" />\\n             </association>\\n         </resultMap>\\n\\n         <select id=\\\"selectAll\\\" resultMap=\\\"oneToOne\\\">\\n             SELECT c.id cid,number,pid,NAME,age FROM card c,person p WHERE c.pid=p.id\\n         </select>\\n     </mapper>\\n     ```\\n\\n   - 步骤三：测试类\\n\\n     ```java\\n      @Test\\n         public void selectAll() throws Exception{\\n             //1.加载核心配置文件\\n             InputStream is = Resources.getResourceAsStream(\\\"MyBatisConfig.xml\\\");\\n\\n             //2.获取SqlSession工厂对象\\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\\n\\n             //3.通过工厂对象获取SqlSession对象\\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\\n\\n             //4.获取OneToOneMapper接口的实现类对象\\n             OneToOneMapper mapper = sqlSession.getMapper(OneToOneMapper.class);\\n\\n             //5.调用实现类的方法，接收结果\\n             List<Card> list = mapper.selectAll();\\n\\n             //6.处理结果\\n             for (Card c : list) {\\n                 System.out.println(c);\\n             }\\n\\n             //7.释放资源\\n             sqlSession.close();\\n             is.close();\\n         }\\n     ```\\n\\n   3.一对一配置总结:\\n\\n   ```xml-dtd\\n   <resultMap>：配置字段和对象属性的映射关系标签。\\n       id 属性：唯一标识\\n       type 属性：实体对象类型\\n   <id>：配置主键映射关系标签。\\n   <result>：配置非主键映射关系标签。\\n       column 属性：表中字段名称\\n       property 属性： 实体对象变量名称\\n   <association>：配置被包含对象的映射关系标签。\\n       property 属性：被包含对象的变量名\\n       javaType 属性：被包含对象的数据类型\\n   ```\\n\\n#### 4.3 多表模型一对多操作\\n1. 一对多模型： 一对多模型：班级和学生，一个班级可以有多个学生。    \\n\\n2. 代码实现\\n\\n   - 步骤一: sql语句准备\\n\\n     ```sql\\n     CREATE TABLE classes(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tNAME VARCHAR(20)\\n     );\\n     INSERT INTO classes VALUES (NULL,\'一班\');\\n     INSERT INTO classes VALUES (NULL,\'二班\');\\n\\n\\n     CREATE TABLE student(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tNAME VARCHAR(30),\\n     \\tage INT,\\n     \\tcid INT,\\n     \\tCONSTRAINT cs_fk FOREIGN KEY (cid) REFERENCES classes(id)\\n     );\\n     INSERT INTO student VALUES (NULL,\'张三\',23,1);\\n     INSERT INTO student VALUES (NULL,\'李四\',24,1);\\n     INSERT INTO student VALUES (NULL,\'王五\',25,2);\\n     INSERT INTO student VALUES (NULL,\'赵六\',26,2);\\n     ```\\n\\n   - 步骤二:配置文件\\n\\n     ```xml\\n     <mapper namespace=\\\"com.lyq.table02.OneToManyMapper\\\">\\n         <resultMap id=\\\"oneToMany\\\" type=\\\"classes\\\">\\n             <id column=\\\"cid\\\" property=\\\"id\\\"/>\\n             <result column=\\\"cname\\\" property=\\\"name\\\"/>\\n\\n             <!--\\n                 collection：配置被包含的集合对象映射关系\\n                 property：被包含对象的变量名\\n                 ofType：被包含对象的实际数据类型\\n             -->\\n             <collection property=\\\"students\\\" ofType=\\\"student\\\">\\n                 <id column=\\\"sid\\\" property=\\\"id\\\"/>\\n                 <result column=\\\"sname\\\" property=\\\"name\\\"/>\\n                 <result column=\\\"sage\\\" property=\\\"age\\\"/>\\n             </collection>\\n         </resultMap>\\n         <select id=\\\"selectAll\\\" resultMap=\\\"oneToMany\\\">\\n             SELECT c.id cid,c.name cname,s.id sid,s.name sname,s.age sage FROM classes c,student s WHERE c.id=s.cid\\n         </select>\\n     </mapper>\\n     ```\\n\\n   - 步骤三：测试类\\n\\n     ```java\\n         @Test\\n         public void selectAll() throws Exception{\\n             //1.加载核心配置文件\\n             InputStream is = Resources.getResourceAsStream(\\\"MyBatisConfig.xml\\\");\\n\\n             //2.获取SqlSession工厂对象\\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\\n\\n             //3.通过工厂对象获取SqlSession对象\\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\\n\\n             //4.获取OneToManyMapper接口的实现类对象\\n             OneToManyMapper mapper = sqlSession.getMapper(OneToManyMapper.class);\\n\\n             //5.调用实现类的方法，接收结果\\n             List<Classes> classes = mapper.selectAll();\\n\\n             //6.处理结果\\n             for (Classes cls : classes) {\\n                 System.out.println(cls.getId() + \\\",\\\" + cls.getName());\\n                 List<Student> students = cls.getStudents();\\n                 for (Student student : students) {\\n                     System.out.println(\\\"\\\\t\\\" + student);\\n                 }\\n             }\\n\\n             //7.释放资源\\n             sqlSession.close();\\n             is.close();\\n         }\\n     ```\\n\\n   3.一对多配置文件总结：\\n\\n   ```xml-dtd\\n   <resultMap>：配置字段和对象属性的映射关系标签。\\n       id 属性：唯一标识\\n       type 属性：实体对象类型\\n   <id>：配置主键映射关系标签。\\n   <result>：配置非主键映射关系标签。\\n       column 属性：表中字段名称\\n       property 属性： 实体对象变量名称\\n   <collection>：配置被包含集合对象的映射关系标签。\\n       property 属性：被包含集合对象的变量名\\n       ofType 属性：集合中保存的对象数据类型\\n   ```\\n\\n\\n#### 4.4 多表模型多对多操作\\n\\n1. 多对多模型：学生和课程，一个学生可以选择多门课程、一个课程也可以被多个学生所选择。       \\n\\n2. 代码实现\\n\\n   - 步骤一: sql语句准备\\n\\n     ```sql\\n     CREATE TABLE course(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tNAME VARCHAR(20)\\n     );\\n     INSERT INTO course VALUES (NULL,\'语文\');\\n     INSERT INTO course VALUES (NULL,\'数学\');\\n\\n\\n     CREATE TABLE stu_cr(\\n     \\tid INT PRIMARY KEY AUTO_INCREMENT,\\n     \\tsid INT,\\n     \\tcid INT,\\n     \\tCONSTRAINT sc_fk1 FOREIGN KEY (sid) REFERENCES student(id),\\n     \\tCONSTRAINT sc_fk2 FOREIGN KEY (cid) REFERENCES course(id)\\n     );\\n     INSERT INTO stu_cr VALUES (NULL,1,1);\\n     INSERT INTO stu_cr VALUES (NULL,1,2);\\n     INSERT INTO stu_cr VALUES (NULL,2,1);\\n     INSERT INTO stu_cr VALUES (NULL,2,2);\\n     ```\\n\\n   - 步骤二:配置文件\\n\\n     ```xml\\n     <?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n     <!DOCTYPE mapper\\n             PUBLIC \\\"-//mybatis.org//DTD Mapper 3.0//EN\\\"\\n             \\\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\\\">\\n\\n     <mapper namespace=\\\"com.lyq.table03.ManyToManyMapper\\\">\\n         <resultMap id=\\\"manyToMany\\\" type=\\\"student\\\">\\n             <id column=\\\"sid\\\" property=\\\"id\\\"/>\\n             <result column=\\\"sname\\\" property=\\\"name\\\"/>\\n             <result column=\\\"sage\\\" property=\\\"age\\\"/>\\n\\n             <collection property=\\\"courses\\\" ofType=\\\"course\\\">\\n                 <id column=\\\"cid\\\" property=\\\"id\\\"/>\\n                 <result column=\\\"cname\\\" property=\\\"name\\\"/>\\n             </collection>\\n         </resultMap>\\n         <select id=\\\"selectAll\\\" resultMap=\\\"manyToMany\\\">\\n             SELECT sc.sid,s.name sname,s.age sage,sc.cid,c.name cname FROM student s,course c,stu_cr sc WHERE sc.sid=s.id AND sc.cid=c.id\\n         </select>\\n     </mapper>\\n     ```\\n\\n   - 步骤三：测试类\\n\\n     ```java\\n      @Test\\n         public void selectAll() throws Exception{\\n             //1.加载核心配置文件\\n             InputStream is = Resources.getResourceAsStream(\\\"MyBatisConfig.xml\\\");\\n\\n             //2.获取SqlSession工厂对象\\n             SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);\\n\\n             //3.通过工厂对象获取SqlSession对象\\n             SqlSession sqlSession = sqlSessionFactory.openSession(true);\\n\\n             //4.获取ManyToManyMapper接口的实现类对象\\n             ManyToManyMapper mapper = sqlSession.getMapper(ManyToManyMapper.class);\\n\\n             //5.调用实现类的方法，接收结果\\n             List<Student> students = mapper.selectAll();\\n\\n             //6.处理结果\\n             for (Student student : students) {\\n                 System.out.println(student.getId() + \\\",\\\" + student.getName() + \\\",\\\" + student.getAge());\\n                 List<Course> courses = student.getCourses();\\n                 for (Course cours : courses) {\\n                     System.out.println(\\\"\\\\t\\\" + cours);\\n                 }\\n             }\\n\\n             //7.释放资源\\n             sqlSession.close();\\n             is.close();\\n         }\\n         \\n     ```\\n\\n   3.多对多配置文件总结：\\n\\n   ```xml-dtd\\n   <resultMap>：配置字段和对象属性的映射关系标签。\\n   \\tid 属性：唯一标识\\n   \\ttype 属性：实体对象类型\\n    <id>：配置主键映射关系标签。\\n    <result>：配置非主键映射关系标签。\\n   \\tcolumn 属性：表中字段名称\\n   \\tproperty 属性： 实体对象变量名称\\n   <collection>：配置被包含集合对象的映射关系标签。\\n   \\tproperty 属性：被包含集合对象的变量名\\n   \\tofType 属性：集合中保存的对象数据类型\\n   ```\\n\\n#### 4.5 多表模型操作总结\\n\\n```xml-dtd\\n <resultMap>：配置字段和对象属性的映射关系标签。\\n    id 属性：唯一标识\\n    type 属性：实体对象类型\\n<id>：配置主键映射关系标签。\\n<result>：配置非主键映射关系标签。\\n\\tcolumn 属性：表中字段名称\\n\\tproperty 属性： 实体对象变量名称\\n<association>：配置被包含对象的映射关系标签。\\n\\tproperty 属性：被包含对象的变量名\\n\\tjavaType 属性：被包含对象的数据类型\\n<collection>：配置被包含集合对象的映射关系标签。\\n\\tproperty 属性：被包含集合对象的变量名\\n\\tofType 属性：集合中保存的对象数据类型\\n```\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6519bfb2d15698120af5aa8e3ba50640.png\",\"articleTitle\":\"Mybatis复习2\",\"categoryName\":\"Mybatis\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:04:53', null);
INSERT INTO `tb_operation_log` VALUES ('714', '文章模块', '修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.updateArticleDelete', '恢复或删除文章', '[{\"idList\":[47],\"isDelete\":1}]', 'PUT', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:06:02', null);
INSERT INTO `tb_operation_log` VALUES ('715', '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"前端\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:09:14', null);
INSERT INTO `tb_operation_log` VALUES ('716', '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"tagName\":\"H5&C3\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:10:03', null);
INSERT INTO `tb_operation_log` VALUES ('717', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"### HTML5  第一天\\n\\n###### 一、什么是 `HTML5`\\n\\n1. `HTML5` 的概念与定义 \\n\\n- 定义：`HTML5` 定义了 `HTML` 标准的最新版本，是对 `HTML` 的第五次重大修改，号称下一代的 `HTML` \\n- 两个概念：\\n  - 是一个新版本的 `HTML` 语言，定义了新的标签、特性和属性\\n  - 拥有一个强大的技术集，这些技术集是指： `HTML5` 、`CSS3` 、`javascript`, 这也是广义上的 `HTML5`\\n\\n1. `HTML5` 拓展了哪些内容\\n\\n- 语义化标签\\n- 本地存储\\n- 兼容特性\\n- `2D`、`3D` \\n- 动画、过渡\\n- `CSS3` 特性\\n- 性能与集成\\n\\n1. `HTML5 ` 的现状\\n\\n     绝对多数新的属性，都已经被浏览器所支持，最新版本的浏览器已经开始陆续支持最新的特性，\\n\\n     总的来说：`HTML5` 已经是大势所趋\\n\\n###### 二、`HTML5 ` 新增标签\\n\\n1. 什么是语义化\\n2. 新增了那些语义化标签\\n   - `header`   ---  头部标签\\n   - `nav`        ---  导航标签\\n   - `article` ---   内容标签\\n   - `section` ---   块级标签\\n   - `aside`     ---   侧边栏标签\\n   - `footer`   ---   尾部标签\\n\\n\\n\\n\\n\\n\\n![yuyibq.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/84b0ef16eaa0c36bf5f8f87b29122205.png)\\n\\n1. 使用语义化标签的注意\\n\\n```\\n- 语义化标签主要针对搜索引擎\\n- 新标签可以使用一次或者多次\\n- 在 `IE9` 浏览器中，需要把语义化标签都转换为块级元素\\n- 语义化标签，在移动端支持比较友好，\\n- 另外，`HTML5` 新增的了很多的语义化标签，随着课程深入，还会学习到其他的\\n```\\n\\n###### 三、多媒体音频标签\\n\\n1. 多媒体标签有两个，分别是\\n\\n- 音频  -- `audio`\\n- 视频  -- `video`\\n\\n2. `audio` 标签说明\\n\\n- 可以在不使用标签的情况下，也能够原生的支持音频格式文件的播放，\\n- 但是：播放格式是有限的\\n\\n3. audio 支持的音频格式\\n   - audio 目前支持三种格式\\n![audio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/c58a0577e933e61712366b1f33f5de70.png)\\n\\n4.audio 的参数\\n\\n![audiocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/195ba1f3364fc4efdc793845239e5296.png)\\n\\n\\n5、audio 代码演示\\n\\n\\n\\n```css\\n<body>\\n  <!-- 注意：在 chrome 浏览器中已经禁用了 autoplay 属性 -->\\n  <!-- <audio src=\\\"./media/snow.mp3\\\" controls autoplay></audio> -->\\n\\n  <!-- \\n    因为不同浏览器支持不同的格式，所以我们采取的方案是这个音频准备多个文件\\n   -->\\n  <audio controls>\\n    <source src=\\\"./media/snow.mp3\\\" type=\\\"audio/mpeg\\\" />\\n  </audio>\\n</body>\\n```\\n\\n###### 四、多媒体视频标签\\n\\n1. video 视频标签\\n   - 目前支持三种格式![vedio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8fb7663d9a8bf0884f3c5a56cf585af9.png)\\n\\n1. 语法格式\\n\\n   ```html\\n   <video src=\\\"./media/video.mp4\\\" controls=\\\"controls\\\"></video>\\n   ```\\n\\n2. video 参数\\n![videocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6acea7a6e834704ece1f5c85cfc0f15a.png)\\n\\n\\n1. video 代码演示\\n\\n   ```html\\n   <body>\\n     <!-- <video src=\\\"./media/video.mp4\\\" controls=\\\"controls\\\"></video> -->\\n\\n     <!-- 谷歌浏览器禁用了自动播放功能，如果想自动播放，需要添加 muted 属性 -->\\n     <video controls=\\\"controls\\\" autoplay muted loop poster=\\\"./media/pig.jpg\\\">\\n       <source src=\\\"./media/video.mp4\\\" type=\\\"video/mp4\\\">\\n       <source src=\\\"./media/video.ogg\\\" type=\\\"video/ogg\\\">\\n     </video>\\n   </body>\\n   ```\\n\\n2. 多媒体标签总结\\n\\n- 音频标签与视频标签使用基本一致\\n- 多媒体标签在不同浏览器下情况不同，存在兼容性问题\\n- 谷歌浏览器把音频和视频标签的自动播放都禁止了\\n- 谷歌浏览器中视频添加 muted 标签可以自己播放\\n- 注意：重点记住使用方法以及自动播放即可，其他属性可以在使用时查找对应的手册\\n\\n###### 五、新增 input 标签\\n![h5input.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/da808c8c1972e9e99cac7ee6847aa050.png)\\n\\n六、新增表单属性\\n\\n![newinput.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/fa6e281cac8cb0a02699ec03b78ae288.png)\\n\\n\\n###### 七、`CSS3 ` 属性选择器(上)\\n\\n1. 什么是 `CSS3`\\n   - 在 `CSS2` 的基础上拓展、新增的样式\\n2. `CSS3` 发展现状\\n   - 移动端支持优于 `PC` 端\\n   - `CSS3` 目前还草案，在不断改进中\\n   - `CSS3` 相对 `H5`，应用非常广泛\\n\\n\\n3. 属性选择器列表\\n![attrcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a576b6c433fb12cf68e807fe906f8a3a.png)\\n\\n\\n1. 属性选择器代码演示\\n\\n   ```css\\n   button {\\n     cursor: pointer;\\n   }\\n   button[disabled] {\\n     cursor: default\\n   }\\n   ```\\n\\n###### 八、`CSS3 ` 属性选择器(下)\\n\\n1. 代码演示\\n\\n   ```css\\n   input[type=search] {\\n     color: skyblue;\\n   }\\n\\n   span[class^=black] {\\n     color: lightgreen;\\n   }\\n\\n   span[class$=black] {\\n     color: lightsalmon;\\n   }\\n\\n   span[class*=black] {\\n     color: lightseagreen;\\n   }\\n   ```\\n\\n###### 九、结构伪类选择器\\n\\n1. 属性列表\\n\\n\\n![jiegouweilei.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/db9f6b9c4f2dafcfb2dacc9134aaddf7.png)\\n\\n1. 代码演示\\n\\n   ```css\\n   ul li:first-child {\\n     background-color: lightseagreen;\\n   }\\n\\n   ul li:last-child {\\n     background-color: lightcoral;\\n   }\\n\\n   ul li:nth-child(3) {\\n     background-color: aqua;\\n   }\\n   ```\\n\\n###### 十、`nth-child` 参数详解\\n\\n1. nth-child 详解\\n   - 注意：本质上就是选中第几个子元素\\n   - n 可以是数字、关键字、公式\\n   - n 如果是数字，就是选中第几个\\n   - 常见的关键字有 `even` 偶数、`odd` 奇数\\n   - 常见的公式如下(如果 n 是公式，则从 0 开始计算)\\n   - 但是第 0 个元素或者超出了元素的个数会被忽略\\n  ![nthchildcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/145c319180a30513514e400bc77cac92.png)\\n\\n\\n1. 代码演示\\n\\n```css\\n   <style>\\n     /* 偶数 */\\n     ul li:nth-child(even) {\\n       background-color: aquamarine;\\n     }\\n   \\n     /* 奇数 */\\n     ul li:nth-child(odd) {\\n       background-color: blueviolet;\\n     }\\n   \\n     /*n 是公式，从 0 开始计算 */\\n     ul li:nth-child(n) {\\n       background-color: lightcoral;\\n     }\\n   \\n     /* 偶数 */\\n     ul li:nth-child(2n) {\\n       background-color: lightskyblue;\\n     }\\n   \\n     /* 奇数 */\\n     ul li:nth-child(2n + 1) {\\n       background-color: lightsalmon;\\n     }\\n   \\n     /* 选择第 0 5 10 15, 应该怎么选 */\\n     ul li:nth-child(5n) {\\n       background-color: orangered;\\n     }\\n   \\n     /* n + 5 就是从第5个开始往后选择 */\\n     ul li:nth-child(n + 5) {\\n       background-color: peru;\\n     }\\n   \\n     /* -n + 5 前五个 */\\n     ul li:nth-child(-n + 5) {\\n       background-color: tan;\\n     }\\n   </style>\\n```\\n\\n###### 十一、`nth-child` 和  `nt-of-type` 的区别\\n\\n1. 代码演示\\n\\n```css\\n   <style>\\n     div :nth-child(1) {\\n       background-color: lightblue;\\n     }\\n   \\n     div :nth-child(2) {\\n       background-color: lightpink;\\n     }\\n   \\n     div span:nth-of-type(2) {\\n       background-color: lightseagreen;\\n     }\\n   \\n     div span:nth-of-type(3) {\\n       background-color: #fff;\\n     }\\n   </style>\\n```\\n\\n1. 区别\\n   - `nth-child`  选择父元素里面的第几个子元素，不管是第几个类型\\n   - `nt-of-type`  选择指定类型的元素\\n\\n\\n###### 十二、伪元素选择器\\n\\n1. 伪类选择器\\n![weiyuansu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/132368915eb385bb8e9b4ee9a82b9833.png)\\n\\n\\n\\n\\n\\n1. 伪类选择器注意事项\\n\\n   - `before` 和 `after` 必须有 `content` 属性\\n   - `before` 在内容前面，after 在内容后面\\n   - `before` 和 `after` 创建的是一个元素，但是属于行内元素\\n   - 创建出来的元素在 `Dom` 中查找不到，所以称为伪元素\\n   - 伪元素和标签选择器一样，权重为 1\\n\\n2. 代码演示\\n\\n   ```css\\n   <style>\\n       div {\\n         width: 100px;\\n         height: 100px;\\n         border: 1px solid lightcoral;\\n       }\\n\\n       div::after,\\n       div::before {\\n         width: 20px;\\n         height: 50px;\\n         text-align: center;\\n         display: inline-block;\\n       }\\n       div::after {\\n         content: \'德\';\\n         background-color: lightskyblue;\\n       }\\n\\n       div::before {\\n         content: \'道\';\\n         background-color: mediumaquamarine;\\n       }\\n     </style>\\n   ```\\n\\n###### 十三、伪元素的案例\\n\\n1. 添加字体图标\\n\\n   ```css\\n   p {\\n      width: 220px;\\n      height: 22px;\\n      border: 1px solid lightseagreen;\\n      margin: 60px;\\n      position: relative;\\n   }\\n   p::after {\\n     content: \'\\\\ea50\';\\n     font-family: \'icomoon\';\\n     position: absolute;\\n     top: -1px;\\n     right: 10px;\\n   }\\n   ```\\n\\n###### 十四、`2D` 转换之 `translate`\\n\\n1. `2D` 转换\\n\\n- `2D` 转换是改变标签在二维平面上的位置和形状\\n- 移动： `translate`\\n- 旋转： `rotate`\\n- 缩放： `scale`\\n\\n1. `translate` 语法\\n\\n- x 就是 x 轴上水平移动\\n- y 就是 y 轴上水平移动\\n\\n```css\\n   transform: translate(x, y)\\n   transform: translateX(n)\\n   transfrom: translateY(n)\\n```\\n\\n1. 重点知识点\\n   - `2D` 的移动主要是指 水平、垂直方向上的移动\\n   - `translate` 最大的优点就是不影响其他元素的位置\\n   - `translate` 中的100%单位，是相对于本身的宽度和高度来进行计算的\\n   - 行内标签没有效果\\n2. 代码演示\\n\\n```css\\ndiv {\\n  background-color: lightseagreen;\\n  width: 200px;\\n  height: 100px;\\n  /* 平移 */\\n  /* 水平垂直移动 100px */\\n  /* transform: translate(100px, 100px); */\\n\\n  /* 水平移动 100px */\\n  /* transform: translate(100px, 0) */\\n\\n  /* 垂直移动 100px */\\n  /* transform: translate(0, 100px) */\\n\\n  /* 水平移动 100px */\\n  /* transform: translateX(100px); */\\n\\n  /* 垂直移动 100px */\\n  transform: translateY(100px)\\n}\\n```\\n\\n###### 十五、让一个盒子水平垂直居中\\n\\n- 看代码\\n\\n###### 十六、`2D 转换 rotate`\\n\\n1. rotate 旋转\\n   - `2D` 旋转指的是让元素在二维平面内顺时针或者逆时针旋转\\n2. `rotate` 语法\\n\\n```css\\n   /* 单位是：deg */\\n   transform: rotate(度数) \\n```\\n\\n1. 重点知识点\\n\\n- `rotate` 里面跟度数，单位是 `deg`\\n- 角度为正时，顺时针，角度为负时，逆时针\\n- 默认旋转的中心点是元素的中心点\\n\\n1. 代码演示\\n\\n```css\\n   img:hover {\\n     transform: rotate(360deg)\\n   }\\n```\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6df833bf4510e56b69c1e97793733803.png\",\"articleTitle\":\"H5&C3-1\",\"categoryName\":\"前端\",\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:18:21', null);
INSERT INTO `tb_operation_log` VALUES ('718', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n\\n### 一.Mybatis快速入门\\n\\n#### 1.1 框架介绍\\n\\n- 框架是一款半成品软件，我们可以基于这个半成品软件继续开发，来完成我们个性化的需求！\\n\\n\\n\\n​ \\n\\n#### 1.2 ORM介绍\\n\\n- ORM(Object Relational Mapping)： 对象关系映射\\n- 指的是持久化数据和实体对象的映射模式，为了解决面向对象与关系型数据库存在的互不匹配的现象的技术。\\n- 如图:\\n  ![1590919786415.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8ce998dd74db7b60d378287d18f0a328.png)\\n- 具体映射关系如下图:\\n\\n![1590919824416.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/233bb18c9a211f13a4d6610919f3cfed.png)\\n\\n\\n\\n#### 1.4 原始jdbc操作的分析\\n\\n- 原始 JDBC 的操作问题分析 \\n\\n  ​    1.频繁创建和销毁数据库的连接会造成系统资源浪费从而影响系统性能。\\n\\n  1. sql 语句在代码中硬编码，如果要修改 sql 语句，就需要修改 java 代码，造成代码不易维护。\\n  2. 查询操作时，需要手动将结果集中的数据封装到实体对象中。\\n  3. 增删改查操作需要参数时，需要手动将实体对象的数据设置到 sql 语句的占位符。 \\n\\n- 原始 JDBC 的操作问题解决方案 \\n\\n  ​    1.使用数据库连接池初始化连接资源。 \\n\\n  1. 将 sql 语句抽取到配置文件中。 \\n  2. 使用反射、内省等底层技术，将实体与表进行属性与字段的自动映射    \\n\\n#### 1.5 什么是Mybatis\\n\\nmybatis 是一个优秀的基于java的持久层框架，它内部封装了jdbc，使开发者只需要关注sql语句本身，而不需要花费精力去处理加载驱动、创建连接、创建statement等繁杂的过程。\\n\\nmybatis通过xml或注解的方式将要执行的各种 statement配置起来，并通过java对象和statement中sql的动态参数进行映射生成最终执行的sql语句。\\n\\n最后mybatis框架执行sql并将结果映射为java对象并返回。采用ORM思想解决了实体和数据库映射的问题，对jdbc 进行了封装，屏蔽了jdbc api 底层访问细节，使我们不用与jdbc api 打交道，就可以完成对数据库的持久化操作。\\n\\nMyBatis官网地址：<http://www.mybatis.org/mybatis-3/> \\n\\n#### 1.6  Mybatis的快速入门\\n\\n**MyBatis开发步骤：**\\n\\n①添加MyBatis的jar包\\n\\n②创建Student数据表\\n\\n③编写Studentr实体类 \\n\\n④编写映射文件StudentMapper.xml\\n\\n⑤编写核心文件MyBatisConfig.xml\\n\\n⑥编写测试类\\n\\n##### 1.7.1  环境搭建\\n\\n1)导入MyBatis的jar包\\n\\n- mysql-connector-java-5.1.37-bin.jar\\n- mybatis-3.5.3.jar\\n- log4j-1.2.17.jar\\n\\n2)  创建student数据表\\n\\n![1590916243454.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/09928c1e6fe5125ea2fe6ff158e5b53f.png)\\n3) 编写Student实体\\n\\n```java\\npublic class Student {\\n    private Integer id;\\n    private String name;\\n    private Integer age;\\n    //省略get个set方法\\n}\\n```\\n\\n4)编写StudentMapper.xml映射文件\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE mapper\\n        PUBLIC \\\"-//mybatis.org//DTD Mapper 3.0//EN\\\"\\n        \\\"http://mybatis.org/dtd/mybatis-3-mapper.dtd\\\">\\n\\n<!--\\n    mapper：核心根标签\\n    namespace属性：名称空间\\n-->\\n<mapper namespace=\\\"StudentMapper\\\">\\n    <!--\\n        select：查询功能的标签\\n        id属性：唯一标识\\n        resultType属性：指定结果映射对象类型\\n        parameterType属性：指定参数映射对象类型\\n    -->\\n    <select id=\\\"selectAll\\\" resultType=\\\"student\\\">\\n        SELECT * FROM student\\n    </select>\\n</mapper>\\n```\\n\\n5) 编写MyBatis核心文件\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE configuration PUBLIC \\\"-//mybatis.org//DTD Config 3.0//EN\\\" \\\"http://mybatis.org/dtd/mybatis-3-config.dtd\\\">\\n\\n<!--configuration 核心根标签-->\\n<configuration>\\n\\n    <!--引入数据库连接的配置文件-->\\n    <properties resource=\\\"jdbc.properties\\\"/>\\n\\n    <!--配置LOG4J-->\\n    <settings>\\n        <setting name=\\\"logImpl\\\" value=\\\"log4j\\\"/>\\n    </settings>\\n\\n    <!--起别名-->\\n    <typeAliases>\\n        <typeAlias type=\\\"com.lyq.bean.Student\\\" alias=\\\"student\\\"/>\\n        <!--<package name=\\\"com.lyq.bean\\\"/>-->\\n    </typeAliases>\\n\\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\\n    <environments default=\\\"mysql\\\">\\n        <!--environment配置数据库环境  id属性唯一标识-->\\n        <environment id=\\\"mysql\\\">\\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\\n            <transactionManager type=\\\"JDBC\\\"></transactionManager>\\n            <!-- dataSource数据源信息   type属性 连接池-->\\n            <dataSource type=\\\"POOLED\\\">\\n                <!-- property获取数据库连接的配置信息 -->\\n                <property name=\\\"driver\\\" value=\\\"${driver}\\\" />\\n                <property name=\\\"url\\\" value=\\\"${url}\\\" />\\n                <property name=\\\"username\\\" value=\\\"${username}\\\" />\\n                <property name=\\\"password\\\" value=\\\"${password}\\\" />\\n            </dataSource>\\n        </environment>\\n    </environments>\\n\\n    <!-- mappers引入映射配置文件 -->\\n    <mappers>\\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\\n        <mapper resource=\\\"StudentMapper.xml\\\"/>\\n    </mappers>\\n</configuration>\\n\\n```\\n\\n##### 1.7.2编写测试代码\\n\\n```java\\n/*\\n    控制层测试类\\n */\\npublic class StudentController {\\n    //创建业务层对象\\n    private StudentService service = new StudentServiceImpl();\\n\\n    //查询全部功能测试\\n    @Test\\n    public void selectAll() {\\n        List<Student> students = service.selectAll();\\n        for (Student stu : students) {\\n            System.out.println(stu);\\n        }\\n    }\\n}\\n```\\n\\n#### 1.8 知识小结\\n\\n- 框架       \\n\\n  框架是一款半成品软件，我们可以基于框架继续开发，从而完成一些个性化的需求。\\n\\n- ORM        \\n\\n  对象关系映射，数据和实体对象的映射。\\n\\n- MyBatis       \\n\\n  是一个优秀的基于 Java 的持久层框架，它内部封装了 JDBC。\\n\\n### 二. MyBatis的相关api\\n\\n#### 2.1 Resources\\n\\n- org.apache.ibatis.io.Resources：加载资源的工具类。\\n- 核心方法\\n\\n![1590917572321.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/afbb2dc902c798cba23eccbe1732d40a.png)\\n\\n#### 2.2 构建器SqlSessionFactoryBuilder\\n\\n- org.apache.ibatis.session.SqlSessionFactoryBuilder：获取 SqlSessionFactory 工厂对象的功能类\\n- 核心方法\\n\\n![1590916852504.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/1c35b367f9cce5175287391d8ba4b4b2.png)\\n\\n- 通过加载mybatis的核心文件的输入流的形式构建一个SqlSessionFactory对象\\n\\n```java\\nString resource = \\\"org/mybatis/builder/mybatis-config.xml\\\"; \\nInputStream inputStream = Resources.getResourceAsStream(resource); \\nSqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder(); \\nSqlSessionFactory factory = builder.build(inputStream);\\n```\\n\\n其中， Resources 工具类，这个类在 org.apache.ibatis.io 包中。Resources 类帮助你从类路径下、文件系统或一个 web URL 中加载资源文件。\\n\\n#### 2.3 工厂对象SqlSessionFactory\\n\\n- org.apache.ibatis.session.SqlSessionFactory：获取 SqlSession 构建者对象的工厂接口。\\n- 核心api\\n\\n![1590917006637.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/e35580b64672c4115d300bae9b6ca28e.png)\\n\\n#### 2.4 SqlSession会话对象\\n\\n- org.apache.ibatis.session.SqlSession：构建者对象接口。用于执行 SQL、管理事务、接口代理。\\n- 核心api\\n  ![1590917052849.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a88e0f3169cef143cbca4675e9f51754.png)\\n  SqlSession 实例在 MyBatis 中是非常强大的一个类。在这里你会看到所有执行语句、提交或回滚事务和获取映射器实例的方法。\\n\\n### 三.MyBatis 映射配置文件\\n\\n#### 3.1 映射配置文件介绍\\n\\n- 映射配置文件包含了数据和对象之间的映射关系以及要执行的 SQL 语句\\n\\n#### 3.2 查询功能\\n\\n- <select>：查询功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n####3.3 新增功能 \\n\\n- <insert>：新增功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n#### 3.4 修改功能\\n\\n- <update>：修改功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n\\n#### 3.5 删除功能\\n\\n- <delete>：查询功能标签。\\n\\n- 属性        \\n\\n  id：唯一标识， 配合名称空间使用。     \\n\\n  parameterType：指定参数映射的对象类型。       \\n\\n  resultType：指定结果映射的对象类型。\\n\\n- SQL 获取参数:        #{属性名}\\n\\n\\n- 总结： 大家可以发现crud操作，除了标签名称以及sql语句不一样之外，其他属性参数基本一致。\\n\\n#### 3.6 映射配置文件小结\\n\\n![1590918743943.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a074e7c53ea558ca61c0f7dbaa619ece.png)\\n\\n### 四.Mybatis核心配置文件介绍\\n\\n#### 4.1 核心配置文件介绍\\n\\n核心配置文件包含了 MyBatis 最核心的设置和属性信息。如数据库的连接、事务、连接池信息等。\\n\\n如下图:\\n\\n```xml\\n<?xml version=\\\"1.0\\\" encoding=\\\"UTF-8\\\" ?>\\n<!--MyBatis的DTD约束-->\\n<!DOCTYPE configuration PUBLIC \\\"-//mybatis.org//DTD Config 3.0//EN\\\" \\\"http://mybatis.org/dtd/mybatis-3-config.dtd\\\">\\n\\n<!--configuration 核心根标签-->\\n<configuration>\\n\\n    <!--environments配置数据库环境，环境可以有多个。default属性指定使用的是哪个-->\\n    <environments default=\\\"mysql\\\">\\n        <!--environment配置数据库环境  id属性唯一标识-->\\n        <environment id=\\\"mysql\\\">\\n            <!-- transactionManager事务管理。  type属性，采用JDBC默认的事务-->\\n            <transactionManager type=\\\"JDBC\\\"></transactionManager>\\n            <!-- dataSource数据源信息   type属性 连接池-->\\n            <dataSource type=\\\"POOLED\\\">\\n                <!-- property获取数据库连接的配置信息 -->\\n                <property name=\\\"driver\\\" value=\\\"com.mysql.jdbc.Driver\\\" />\\n                <property name=\\\"url\\\" value=\\\"jdbc:mysql:///db1\\\" />\\n                <property name=\\\"username\\\" value=\\\"root\\\" />\\n                <property name=\\\"password\\\" value=\\\"root\\\" />\\n            </dataSource>\\n        </environment>\\n    </environments>\\n\\n    <!-- mappers引入映射配置文件 -->\\n    <mappers>\\n        <!-- mapper 引入指定的映射配置文件   resource属性指定映射配置文件的名称 -->\\n        <mapper resource=\\\"StudentMapper.xml\\\"/>\\n    </mappers>\\n</configuration>\\n```\\n\\n#### 4.2 数据库连接配置文件引入\\n\\n- properties标签引入外部文件\\n\\n  ```xml\\n      <!--引入数据库连接的配置文件-->\\n      <properties resource=\\\"jdbc.properties\\\"/>\\n  ```\\n\\n- 具体使用，如下配置\\n\\n  ```xml\\n    <!-- property获取数据库连接的配置信息 -->\\n      <property name=\\\"driver\\\" value=\\\"${driver}\\\" />\\n      <property name=\\\"url\\\" value=\\\"${url}\\\" />\\n      <property name=\\\"username\\\" value=\\\"${username}\\\" />\\n      <property name=\\\"password\\\" value=\\\"${password}\\\" />\\n  ```\\n\\n#### 4.3 起别名\\n\\n- <typeAliases>：为全类名起别名的父标签。\\n\\n- <typeAlias>：为全类名起别名的子标签。\\n\\n- 属性      \\n\\n  type：指定全类名      \\n\\n  alias：指定别名\\n\\n- <package>：为指定包下所有类起别名的子标签。(别名就是类名)\\n\\n- 如下图：\\n\\n![1590919106324.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/5d4beb5d51aba65b50c8554454b2fef9.png)\\n\\n- 具体如下配置\\n\\n  ```xml\\n      <!--起别名-->\\n      <typeAliases>\\n          <typeAlias type=\\\"com.itheima.bean.Student\\\" alias=\\\"student\\\"/>\\n          <!--<package name=\\\"com.itheima.bean\\\"/>-->\\n      </typeAliase\\n  ```\\n\\n#### 4.4 总结\\n\\n![1590919367790.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/d47caea100afecaa5cbe73d10d013dbe.png)\\n\\n### 五.Mybatis传统方式开发\\n\\n#### 5.1 Dao 层传统实现方式\\n\\n- 分层思想：控制层(controller)、业务层(service)、持久层(dao)。\\n- 调用流程\\n  ![1590919558066.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/f1597c1ad9a283c1f3f91546b727e2e8.png)\\n\\n#### 5.2 LOG4J的配置和使用\\n\\n- 在日常开发过程中，排查问题时难免需要输出 MyBatis 真正执行的 SQL 语句、参数、结果等信息，我们就可以借助 LOG4J 的功能来实现执行信息的输出。\\n- 使用步骤：\\n\\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)\\n\\n\\n\\n\\n\\n![1590919638466.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8eb1074d7eb46094debf0ccd0d4c5daf.png)\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/aabc2a7d61ad9858993a5fdc41619b69.jpeg\",\"articleTitle\":\"Mybatis复习1\",\"categoryName\":\"Mybatis\",\"id\":53,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:21:22', null);
INSERT INTO `tb_operation_log` VALUES ('719', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"\\n###### 一、什么是 `HTML5`\\n\\n1. `HTML5` 的概念与定义 \\n\\n- 定义：`HTML5` 定义了 `HTML` 标准的最新版本，是对 `HTML` 的第五次重大修改，号称下一代的 `HTML` \\n- 两个概念：\\n  - 是一个新版本的 `HTML` 语言，定义了新的标签、特性和属性\\n  - 拥有一个强大的技术集，这些技术集是指： `HTML5` 、`CSS3` 、`javascript`, 这也是广义上的 `HTML5`\\n\\n1. `HTML5` 拓展了哪些内容\\n\\n- 语义化标签\\n- 本地存储\\n- 兼容特性\\n- `2D`、`3D` \\n- 动画、过渡\\n- `CSS3` 特性\\n- 性能与集成\\n\\n1. `HTML5 ` 的现状\\n\\n     绝对多数新的属性，都已经被浏览器所支持，最新版本的浏览器已经开始陆续支持最新的特性，\\n\\n     总的来说：`HTML5` 已经是大势所趋\\n\\n###### 二、`HTML5 ` 新增标签\\n\\n1. 什么是语义化\\n2. 新增了那些语义化标签\\n   - `header`   ---  头部标签\\n   - `nav`        ---  导航标签\\n   - `article` ---   内容标签\\n   - `section` ---   块级标签\\n   - `aside`     ---   侧边栏标签\\n   - `footer`   ---   尾部标签\\n\\n\\n\\n\\n\\n\\n![yuyibq.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/84b0ef16eaa0c36bf5f8f87b29122205.png)\\n\\n1. 使用语义化标签的注意\\n\\n```\\n- 语义化标签主要针对搜索引擎\\n- 新标签可以使用一次或者多次\\n- 在 `IE9` 浏览器中，需要把语义化标签都转换为块级元素\\n- 语义化标签，在移动端支持比较友好，\\n- 另外，`HTML5` 新增的了很多的语义化标签，随着课程深入，还会学习到其他的\\n```\\n\\n###### 三、多媒体音频标签\\n\\n1. 多媒体标签有两个，分别是\\n\\n- 音频  -- `audio`\\n- 视频  -- `video`\\n\\n2. `audio` 标签说明\\n\\n- 可以在不使用标签的情况下，也能够原生的支持音频格式文件的播放，\\n- 但是：播放格式是有限的\\n\\n3. audio 支持的音频格式\\n   - audio 目前支持三种格式\\n![audio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/c58a0577e933e61712366b1f33f5de70.png)\\n\\n4.audio 的参数\\n\\n![audiocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/195ba1f3364fc4efdc793845239e5296.png)\\n\\n\\n5、audio 代码演示\\n\\n\\n\\n```css\\n<body>\\n  <!-- 注意：在 chrome 浏览器中已经禁用了 autoplay 属性 -->\\n  <!-- <audio src=\\\"./media/snow.mp3\\\" controls autoplay></audio> -->\\n\\n  <!-- \\n    因为不同浏览器支持不同的格式，所以我们采取的方案是这个音频准备多个文件\\n   -->\\n  <audio controls>\\n    <source src=\\\"./media/snow.mp3\\\" type=\\\"audio/mpeg\\\" />\\n  </audio>\\n</body>\\n```\\n\\n###### 四、多媒体视频标签\\n\\n1. video 视频标签\\n   - 目前支持三种格式![vedio.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/8fb7663d9a8bf0884f3c5a56cf585af9.png)\\n\\n1. 语法格式\\n\\n   ```html\\n   <video src=\\\"./media/video.mp4\\\" controls=\\\"controls\\\"></video>\\n   ```\\n\\n2. video 参数\\n![videocanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6acea7a6e834704ece1f5c85cfc0f15a.png)\\n\\n\\n1. video 代码演示\\n\\n   ```html\\n   <body>\\n     <!-- <video src=\\\"./media/video.mp4\\\" controls=\\\"controls\\\"></video> -->\\n\\n     <!-- 谷歌浏览器禁用了自动播放功能，如果想自动播放，需要添加 muted 属性 -->\\n     <video controls=\\\"controls\\\" autoplay muted loop poster=\\\"./media/pig.jpg\\\">\\n       <source src=\\\"./media/video.mp4\\\" type=\\\"video/mp4\\\">\\n       <source src=\\\"./media/video.ogg\\\" type=\\\"video/ogg\\\">\\n     </video>\\n   </body>\\n   ```\\n\\n2. 多媒体标签总结\\n\\n- 音频标签与视频标签使用基本一致\\n- 多媒体标签在不同浏览器下情况不同，存在兼容性问题\\n- 谷歌浏览器把音频和视频标签的自动播放都禁止了\\n- 谷歌浏览器中视频添加 muted 标签可以自己播放\\n- 注意：重点记住使用方法以及自动播放即可，其他属性可以在使用时查找对应的手册\\n\\n###### 五、新增 input 标签\\n![h5input.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/da808c8c1972e9e99cac7ee6847aa050.png)\\n\\n六、新增表单属性\\n\\n![newinput.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/fa6e281cac8cb0a02699ec03b78ae288.png)\\n\\n\\n###### 七、`CSS3 ` 属性选择器(上)\\n\\n1. 什么是 `CSS3`\\n   - 在 `CSS2` 的基础上拓展、新增的样式\\n2. `CSS3` 发展现状\\n   - 移动端支持优于 `PC` 端\\n   - `CSS3` 目前还草案，在不断改进中\\n   - `CSS3` 相对 `H5`，应用非常广泛\\n\\n\\n3. 属性选择器列表\\n![attrcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/a576b6c433fb12cf68e807fe906f8a3a.png)\\n\\n\\n1. 属性选择器代码演示\\n\\n   ```css\\n   button {\\n     cursor: pointer;\\n   }\\n   button[disabled] {\\n     cursor: default\\n   }\\n   ```\\n\\n###### 八、`CSS3 ` 属性选择器(下)\\n\\n1. 代码演示\\n\\n   ```css\\n   input[type=search] {\\n     color: skyblue;\\n   }\\n\\n   span[class^=black] {\\n     color: lightgreen;\\n   }\\n\\n   span[class$=black] {\\n     color: lightsalmon;\\n   }\\n\\n   span[class*=black] {\\n     color: lightseagreen;\\n   }\\n   ```\\n\\n###### 九、结构伪类选择器\\n\\n1. 属性列表\\n\\n\\n![jiegouweilei.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/db9f6b9c4f2dafcfb2dacc9134aaddf7.png)\\n\\n1. 代码演示\\n\\n   ```css\\n   ul li:first-child {\\n     background-color: lightseagreen;\\n   }\\n\\n   ul li:last-child {\\n     background-color: lightcoral;\\n   }\\n\\n   ul li:nth-child(3) {\\n     background-color: aqua;\\n   }\\n   ```\\n\\n###### 十、`nth-child` 参数详解\\n\\n1. nth-child 详解\\n   - 注意：本质上就是选中第几个子元素\\n   - n 可以是数字、关键字、公式\\n   - n 如果是数字，就是选中第几个\\n   - 常见的关键字有 `even` 偶数、`odd` 奇数\\n   - 常见的公式如下(如果 n 是公式，则从 0 开始计算)\\n   - 但是第 0 个元素或者超出了元素的个数会被忽略\\n  ![nthchildcanshu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/145c319180a30513514e400bc77cac92.png)\\n\\n\\n1. 代码演示\\n\\n```css\\n   <style>\\n     /* 偶数 */\\n     ul li:nth-child(even) {\\n       background-color: aquamarine;\\n     }\\n   \\n     /* 奇数 */\\n     ul li:nth-child(odd) {\\n       background-color: blueviolet;\\n     }\\n   \\n     /*n 是公式，从 0 开始计算 */\\n     ul li:nth-child(n) {\\n       background-color: lightcoral;\\n     }\\n   \\n     /* 偶数 */\\n     ul li:nth-child(2n) {\\n       background-color: lightskyblue;\\n     }\\n   \\n     /* 奇数 */\\n     ul li:nth-child(2n + 1) {\\n       background-color: lightsalmon;\\n     }\\n   \\n     /* 选择第 0 5 10 15, 应该怎么选 */\\n     ul li:nth-child(5n) {\\n       background-color: orangered;\\n     }\\n   \\n     /* n + 5 就是从第5个开始往后选择 */\\n     ul li:nth-child(n + 5) {\\n       background-color: peru;\\n     }\\n   \\n     /* -n + 5 前五个 */\\n     ul li:nth-child(-n + 5) {\\n       background-color: tan;\\n     }\\n   </style>\\n```\\n\\n###### 十一、`nth-child` 和  `nt-of-type` 的区别\\n\\n1. 代码演示\\n\\n```css\\n   <style>\\n     div :nth-child(1) {\\n       background-color: lightblue;\\n     }\\n   \\n     div :nth-child(2) {\\n       background-color: lightpink;\\n     }\\n   \\n     div span:nth-of-type(2) {\\n       background-color: lightseagreen;\\n     }\\n   \\n     div span:nth-of-type(3) {\\n       background-color: #fff;\\n     }\\n   </style>\\n```\\n\\n1. 区别\\n   - `nth-child`  选择父元素里面的第几个子元素，不管是第几个类型\\n   - `nt-of-type`  选择指定类型的元素\\n\\n\\n###### 十二、伪元素选择器\\n\\n1. 伪类选择器\\n![weiyuansu.png](http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/132368915eb385bb8e9b4ee9a82b9833.png)\\n\\n\\n\\n\\n\\n1. 伪类选择器注意事项\\n\\n   - `before` 和 `after` 必须有 `content` 属性\\n   - `before` 在内容前面，after 在内容后面\\n   - `before` 和 `after` 创建的是一个元素，但是属于行内元素\\n   - 创建出来的元素在 `Dom` 中查找不到，所以称为伪元素\\n   - 伪元素和标签选择器一样，权重为 1\\n\\n2. 代码演示\\n\\n   ```css\\n   <style>\\n       div {\\n         width: 100px;\\n         height: 100px;\\n         border: 1px solid lightcoral;\\n       }\\n\\n       div::after,\\n       div::before {\\n         width: 20px;\\n         height: 50px;\\n         text-align: center;\\n         display: inline-block;\\n       }\\n       div::after {\\n         content: \'德\';\\n         background-color: lightskyblue;\\n       }\\n\\n       div::before {\\n         content: \'道\';\\n         background-color: mediumaquamarine;\\n       }\\n     </style>\\n   ```\\n\\n###### 十三、伪元素的案例\\n\\n1. 添加字体图标\\n\\n   ```css\\n   p {\\n      width: 220px;\\n      height: 22px;\\n      border: 1px solid lightseagreen;\\n      margin: 60px;\\n      position: relative;\\n   }\\n   p::after {\\n     content: \'\\\\ea50\';\\n     font-family: \'icomoon\';\\n     position: absolute;\\n     top: -1px;\\n     right: 10px;\\n   }\\n   ```\\n\\n###### 十四、`2D` 转换之 `translate`\\n\\n1. `2D` 转换\\n\\n- `2D` 转换是改变标签在二维平面上的位置和形状\\n- 移动： `translate`\\n- 旋转： `rotate`\\n- 缩放： `scale`\\n\\n1. `translate` 语法\\n\\n- x 就是 x 轴上水平移动\\n- y 就是 y 轴上水平移动\\n\\n```css\\n   transform: translate(x, y)\\n   transform: translateX(n)\\n   transfrom: translateY(n)\\n```\\n\\n1. 重点知识点\\n   - `2D` 的移动主要是指 水平、垂直方向上的移动\\n   - `translate` 最大的优点就是不影响其他元素的位置\\n   - `translate` 中的100%单位，是相对于本身的宽度和高度来进行计算的\\n   - 行内标签没有效果\\n2. 代码演示\\n\\n```css\\ndiv {\\n  background-color: lightseagreen;\\n  width: 200px;\\n  height: 100px;\\n  /* 平移 */\\n  /* 水平垂直移动 100px */\\n  /* transform: translate(100px, 100px); */\\n\\n  /* 水平移动 100px */\\n  /* transform: translate(100px, 0) */\\n\\n  /* 垂直移动 100px */\\n  /* transform: translate(0, 100px) */\\n\\n  /* 水平移动 100px */\\n  /* transform: translateX(100px); */\\n\\n  /* 垂直移动 100px */\\n  transform: translateY(100px)\\n}\\n```\\n\\n###### 十五、让一个盒子水平垂直居中\\n\\n- 看代码\\n\\n###### 十六、`2D 转换 rotate`\\n\\n1. rotate 旋转\\n   - `2D` 旋转指的是让元素在二维平面内顺时针或者逆时针旋转\\n2. `rotate` 语法\\n\\n```css\\n   /* 单位是：deg */\\n   transform: rotate(度数) \\n```\\n\\n1. 重点知识点\\n\\n- `rotate` 里面跟度数，单位是 `deg`\\n- 角度为正时，顺时针，角度为负时，逆时针\\n- 默认旋转的中心点是元素的中心点\\n\\n1. 代码演示\\n\\n```css\\n   img:hover {\\n     transform: rotate(360deg)\\n   }\\n```\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/6df833bf4510e56b69c1e97793733803.png\",\"articleTitle\":\"H5&C3-1\",\"categoryName\":\"前端\",\"id\":55,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 00:21:54', null);
INSERT INTO `tb_operation_log` VALUES ('720', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"menuIdList\":[1,2,3,202,213,4,205,19,5],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:21:01', null);
INSERT INTO `tb_operation_log` VALUES ('721', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:22:59', null);
INSERT INTO `tb_operation_log` VALUES ('722', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:23:17', null);
INSERT INTO `tb_operation_log` VALUES ('723', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:23:34', null);
INSERT INTO `tb_operation_log` VALUES ('724', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:24:13', null);
INSERT INTO `tb_operation_log` VALUES ('725', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:24:33', null);
INSERT INTO `tb_operation_log` VALUES ('726', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241,239,276,205,218,223],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:25:08', null);
INSERT INTO `tb_operation_log` VALUES ('727', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241,239,276,205,218,223,202,230,238,232,243],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:25:35', null);
INSERT INTO `tb_operation_log` VALUES ('728', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:26:16', null);
INSERT INTO `tb_operation_log` VALUES ('729', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:26:24', null);
INSERT INTO `tb_operation_log` VALUES ('730', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,195,183,246,199,185,191,254,234,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:26:30', null);
INSERT INTO `tb_operation_log` VALUES ('731', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,193,195,183,246,199,185,186,191,254,234,235,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:31:32', null);
INSERT INTO `tb_operation_log` VALUES ('732', '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"1\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:46:15', null);
INSERT INTO `tb_operation_log` VALUES ('733', '分类模块', '删除', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.deleteCategories', '删除分类', '[[334]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:46:19', null);
INSERT INTO `tb_operation_log` VALUES ('734', '标签模块', '新增或修改', '/admin/tags', 'com.minzheng.blog.controller.TagController.saveOrUpdateTag', '添加或修改标签', '[{\"tagName\":\"1\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:46:27', null);
INSERT INTO `tb_operation_log` VALUES ('735', '标签模块', '删除', '/admin/tags', 'com.minzheng.blog.controller.TagController.deleteTag', '删除标签', '[[30]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:46:30', null);
INSERT INTO `tb_operation_log` VALUES ('736', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,193,195,183,246,199,185,186,191,254,234,235,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:47:10', null);
INSERT INTO `tb_operation_log` VALUES ('737', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"menuIdList\":[1,2,3,202,213,4,205,5],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:47:55', null);
INSERT INTO `tb_operation_log` VALUES ('738', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"menuIdList\":[1,2,3,202,213,4,205,19,5],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:48:17', null);
INSERT INTO `tb_operation_log` VALUES ('739', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"menuIdList\":[1,2,6,7,8,9,10,3,11,12,202,13,201,213,14,15,16,4,214,209,17,18,205,206,208,210,19,5],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:50:58', null);
INSERT INTO `tb_operation_log` VALUES ('740', '分类模块', '新增或修改', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.saveOrUpdateCategory', '添加或修改分类', '[{\"categoryName\":\"1\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '6', 'zzk', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:51:07', null);
INSERT INTO `tb_operation_log` VALUES ('741', '分类模块', '删除', '/admin/categories', 'com.minzheng.blog.controller.CategoryController.deleteCategories', '删除分类', '[[335]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:51:27', null);
INSERT INTO `tb_operation_log` VALUES ('742', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"大家好我是wkc++!\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"22\",\"categoryName\":\"测试分类\",\"id\":48,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '6', 'zzk', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:51:41', null);
INSERT INTO `tb_operation_log` VALUES ('743', '文章模块', '新增或修改', '/admin/articles', 'com.minzheng.blog.controller.ArticleController.saveOrUpdateArticle', '添加或修改文章', '[{\"articleContent\":\"大家好我是wkc++!\",\"articleCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/articles/10c3eddb520e60786c6f9519477ed5d7.png\",\"articleTitle\":\"22\",\"categoryName\":\"测试分类\",\"id\":48,\"isTop\":0,\"originalUrl\":\"\",\"status\":1,\"tagNameList\":[],\"type\":1}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '6', 'zzk', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:51:45', null);
INSERT INTO `tb_operation_log` VALUES ('744', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,193,195,183,246,199,185,186,191,254,234,235,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:53:19', null);
INSERT INTO `tb_operation_log` VALUES ('745', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":4,\"resourceIdList\":[192,193,195,183,246,199,185,186,191,254,234,235,237,213,241,239,276,205,218,223,202,230,238,232,243,196,257,258,225,210],\"roleLabel\":\"author2\",\"roleName\":\"作者2\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:54:06', null);
INSERT INTO `tb_operation_log` VALUES ('746', '角色模块', '新增或修改', '/admin/role', 'com.minzheng.blog.controller.RoleController.saveOrUpdateRole', '保存或更新角色', '[{\"id\":3,\"menuIdList\":[1,2,6,7,8,9,10,3,11,12,202,13,201,213,14,15,16,4,214,209,17,18,205,206,208,210,19,5],\"roleLabel\":\"test\",\"roleName\":\"测试\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-17 23:58:04', null);
INSERT INTO `tb_operation_log` VALUES ('747', '评论模块', '删除', '/admin/comments', 'com.minzheng.blog.controller.CommentController.deleteComments', '删除评论', '[[426]]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-18 00:05:48', null);
INSERT INTO `tb_operation_log` VALUES ('748', '页面模块', '新增或修改', '/admin/pages', 'com.minzheng.blog.controller.PageController.saveOrUpdatePage', '保存或更新页面', '[{\"pageCover\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/6df833bf4510e56b69c1e97793733803.png\",\"pageLabel\":\"test\",\"pageName\":\"test\"}]', 'POST', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-19 01:14:01', null);
INSERT INTO `tb_operation_log` VALUES ('749', '页面模块', '删除', '/admin/pages/903', 'com.minzheng.blog.controller.PageController.deletePage', '删除页面', '[903]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-19 01:15:11', null);
INSERT INTO `tb_operation_log` VALUES ('750', '页面模块', '删除', '/admin/pages/903', 'com.minzheng.blog.controller.PageController.deletePage', '删除页面', '[903]', 'DELETE', '{\"code\":20000,\"flag\":true,\"message\":\"操作成功\"}', '1', 'wkc++', '36.105.57.49', '新疆维吾尔自治区博尔塔拉蒙古自治州 电信', '2022-01-19 01:15:11', null);

-- ----------------------------
-- Table structure for tb_page
-- ----------------------------
DROP TABLE IF EXISTS `tb_page`;
CREATE TABLE `tb_page` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '页面id',
  `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面名',
  `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '页面标签',
  `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '页面封面',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=904 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='页面';

-- ----------------------------
-- Records of tb_page
-- ----------------------------
INSERT INTO `tb_page` VALUES ('1', '首页', 'home', 'http://upload.lyqzzk.top/config/0bee7ba5ac70155766648e14ae2a821f.jpg', '2022-01-01 17:06:51', '2021-10-04 15:42:46');
INSERT INTO `tb_page` VALUES ('2', '归档', 'archive', 'http://upload.lyqzzk.top/config/643f28683e1c59a80ccfc9cb19735a9c.jpg', '2022-01-01 17:06:51', '2021-10-04 15:43:14');
INSERT INTO `tb_page` VALUES ('3', '分类', 'category', 'http://upload.lyqzzk.top/config/83be0017d7f1a29441e33083e7706936.jpg', '2022-01-01 17:06:51', '2021-10-04 15:43:31');
INSERT INTO `tb_page` VALUES ('4', '标签', 'tag', 'http://upload.lyqzzk.top/config/a6f141372509365891081d755da963a1.png', '2022-01-01 17:06:51', '2021-10-04 15:43:38');
INSERT INTO `tb_page` VALUES ('5', '相册', 'album', 'http://upload.lyqzzk.top/config/f8fb7e2de0780239048276e7840527e5.jpg', '2022-01-01 17:06:51', '2021-10-04 15:43:53');
INSERT INTO `tb_page` VALUES ('6', '友链', 'link', 'http://upload.lyqzzk.top/config/9034edddec5b8e8542c2e61b0da1c1da.jpg', '2022-01-01 17:06:51', '2021-10-04 15:44:02');
INSERT INTO `tb_page` VALUES ('7', '关于', 'about', 'http://upload.lyqzzk.top/config/2a56d15dd742ff8ac238a512d9a472a1.jpg', '2022-01-01 17:06:51', '2021-10-04 15:44:08');
INSERT INTO `tb_page` VALUES ('8', '留言', 'message', 'http://upload.lyqzzk.top/config/acfeab8379508233fa7e4febf90c2f2e.png', '2022-01-01 17:06:51', '2021-10-04 15:44:17');
INSERT INTO `tb_page` VALUES ('9', '个人中心', 'user', 'http://upload.lyqzzk.top/config/ebae4c93de1b286a8d50aa62612caa59.jpeg', '2022-01-01 17:06:51', '2021-10-04 15:45:17');
INSERT INTO `tb_page` VALUES ('10', '文章列表', 'articleList', 'http://upload.lyqzzk.top/config/924d65cc8312e6cdad2160eb8fce6831.jpg', '2022-01-01 17:06:51', '2021-10-04 15:45:45');

-- ----------------------------
-- Table structure for tb_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo`;
CREATE TABLE `tb_photo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int NOT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '照片描述',
  `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '照片地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='照片';

-- ----------------------------
-- Records of tb_photo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `tb_photo_album`;
CREATE TABLE `tb_photo_album` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册名',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册描述',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '相册封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='相册';

-- ----------------------------
-- Records of tb_photo_album
-- ----------------------------

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求方式',
  `parent_id` int DEFAULT NULL COMMENT '父权限id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('165', '分类模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('166', '博客信息模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('167', '友链模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('168', '文章模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('169', '日志模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('170', '标签模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('171', '照片模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('172', '用户信息模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('173', '用户账号模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('174', '留言模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('175', '相册模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('176', '菜单模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('177', '角色模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('178', '评论模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('179', '资源模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('180', '页面模块', null, null, null, '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('181', '查看博客信息', '/', 'GET', '166', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:29');
INSERT INTO `tb_resource` VALUES ('182', '查看关于我信息', '/about', 'GET', '166', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:29');
INSERT INTO `tb_resource` VALUES ('183', '查看后台信息', '/admin', 'GET', '166', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('184', '修改关于我信息', '/admin/about', 'PUT', '166', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('185', '查看后台文章', '/admin/articles', 'GET', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('186', '添加或修改文章', '/admin/articles', 'POST', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('187', '恢复或删除文章', '/admin/articles', 'PUT', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('188', '物理删除文章', '/admin/articles', 'DELETE', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('189', '上传文章图片', '/admin/articles/images', 'POST', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('190', '修改文章置顶', '/admin/articles/top', 'PUT', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('191', '根据id查看后台文章', '/admin/articles/*', 'GET', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('192', '查看后台分类列表', '/admin/categories', 'GET', '165', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('193', '添加或修改分类', '/admin/categories', 'POST', '165', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('194', '删除分类', '/admin/categories', 'DELETE', '165', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('195', '搜索文章分类', '/admin/categories/search', 'GET', '165', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('196', '查询后台评论', '/admin/comments', 'GET', '178', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('197', '删除评论', '/admin/comments', 'DELETE', '178', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('198', '审核评论', '/admin/comments/review', 'PUT', '178', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('199', '查看后台友链列表', '/admin/links', 'GET', '167', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('200', '保存或修改友链', '/admin/links', 'POST', '167', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('201', '删除友链', '/admin/links', 'DELETE', '167', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('202', '查看菜单列表', '/admin/menus', 'GET', '176', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('203', '新增或修改菜单', '/admin/menus', 'POST', '176', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('204', '删除菜单', '/admin/menus/*', 'DELETE', '176', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('205', '查看后台留言列表', '/admin/messages', 'GET', '174', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('206', '删除留言', '/admin/messages', 'DELETE', '174', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('207', '审核留言', '/admin/messages/review', 'PUT', '174', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('208', '查看操作日志', '/admin/operation/logs', 'GET', '169', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('209', '删除操作日志', '/admin/operation/logs', 'DELETE', '169', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('210', '获取页面列表', '/admin/pages', 'GET', '180', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('211', '保存或更新页面', '/admin/pages', 'POST', '180', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('212', '删除页面', '/admin/pages/*', 'DELETE', '180', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('213', '根据相册id获取照片列表', '/admin/photos', 'GET', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('214', '保存照片', '/admin/photos', 'POST', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('215', '更新照片信息', '/admin/photos', 'PUT', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('216', '删除照片', '/admin/photos', 'DELETE', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('217', '移动照片相册', '/admin/photos/album', 'PUT', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('218', '查看后台相册列表', '/admin/photos/albums', 'GET', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('219', '保存或更新相册', '/admin/photos/albums', 'POST', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('220', '上传相册封面', '/admin/photos/albums/cover', 'POST', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('221', '获取后台相册列表信息', '/admin/photos/albums/info', 'GET', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('222', '根据id删除相册', '/admin/photos/albums/*', 'DELETE', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('223', '根据id获取后台相册信息', '/admin/photos/albums/*/info', 'GET', '175', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('224', '更新照片删除状态', '/admin/photos/delete', 'PUT', '171', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('225', '查看资源列表', '/admin/resources', 'GET', '179', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('226', '新增或修改资源', '/admin/resources', 'POST', '179', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('227', '导入swagger接口', '/admin/resources/import/swagger', 'GET', '179', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('228', '删除资源', '/admin/resources/*', 'DELETE', '179', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('229', '保存或更新角色', '/admin/role', 'POST', '177', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('230', '查看角色菜单选项', '/admin/role/menus', 'GET', '176', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('231', '查看角色资源选项', '/admin/role/resources', 'GET', '179', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('232', '查询角色列表', '/admin/roles', 'GET', '177', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('233', '删除角色', '/admin/roles', 'DELETE', '177', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('234', '查询后台标签列表', '/admin/tags', 'GET', '170', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('235', '添加或修改标签', '/admin/tags', 'POST', '170', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('236', '删除标签', '/admin/tags', 'DELETE', '170', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('237', '搜索文章标签', '/admin/tags/search', 'GET', '170', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('238', '查看当前用户菜单', '/admin/user/menus', 'GET', '176', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('239', '查询后台用户列表', '/admin/users', 'GET', '173', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('240', '修改用户禁用状态', '/admin/users/disable', 'PUT', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('241', '查看在线用户', '/admin/users/online', 'GET', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('242', '修改管理员密码', '/admin/users/password', 'PUT', '173', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('243', '查询用户角色选项', '/admin/users/role', 'GET', '177', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('244', '修改用户角色', '/admin/users/role', 'PUT', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('245', '下线用户', '/admin/users/*/online', 'DELETE', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('246', '获取网站配置', '/admin/website/config', 'GET', '166', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('247', '更新网站配置', '/admin/website/config', 'PUT', '166', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('248', '根据相册id查看照片列表', '/albums/*/photos', 'GET', '171', '1', '2022-01-01 17:06:51', '2021-08-11 21:06:35');
INSERT INTO `tb_resource` VALUES ('249', '查看首页文章', '/articles', 'GET', '168', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:45');
INSERT INTO `tb_resource` VALUES ('250', '查看文章归档', '/articles/archives', 'GET', '168', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:47');
INSERT INTO `tb_resource` VALUES ('251', '根据条件查询文章', '/articles/condition', 'GET', '168', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:47');
INSERT INTO `tb_resource` VALUES ('252', '搜索文章', '/articles/search', 'GET', '168', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:48');
INSERT INTO `tb_resource` VALUES ('253', '根据id查看文章', '/articles/*', 'GET', '168', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:49');
INSERT INTO `tb_resource` VALUES ('254', '点赞文章', '/articles/*/like', 'POST', '168', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('255', '查看分类列表', '/categories', 'GET', '165', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:26');
INSERT INTO `tb_resource` VALUES ('256', '查询评论', '/comments', 'GET', '178', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:33');
INSERT INTO `tb_resource` VALUES ('257', '添加评论', '/comments', 'POST', '178', '0', '2022-01-01 17:06:51', '2021-08-11 21:10:05');
INSERT INTO `tb_resource` VALUES ('258', '评论点赞', '/comments/*/like', 'POST', '178', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('259', '查询评论下的回复', '/comments/*/replies', 'GET', '178', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:30');
INSERT INTO `tb_resource` VALUES ('260', '查看友链列表', '/links', 'GET', '167', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:41');
INSERT INTO `tb_resource` VALUES ('261', '查看留言列表', '/messages', 'GET', '174', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:14');
INSERT INTO `tb_resource` VALUES ('262', '添加留言', '/messages', 'POST', '174', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:15');
INSERT INTO `tb_resource` VALUES ('263', '获取相册列表', '/photos/albums', 'GET', '175', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:20');
INSERT INTO `tb_resource` VALUES ('264', '用户注册', '/register', 'POST', '173', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:01');
INSERT INTO `tb_resource` VALUES ('265', '查询标签列表', '/tags', 'GET', '170', '1', '2022-01-01 17:06:51', '2021-08-11 21:06:30');
INSERT INTO `tb_resource` VALUES ('267', '更新用户头像', '/users/avatar', 'POST', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('268', '发送邮箱验证码', '/users/code', 'GET', '173', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:02');
INSERT INTO `tb_resource` VALUES ('269', '绑定用户邮箱', '/users/email', 'POST', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('270', '更新用户信息', '/users/info', 'PUT', '172', '0', '2022-01-01 17:06:51', null);
INSERT INTO `tb_resource` VALUES ('271', 'qq登录', '/users/oauth/qq', 'POST', '173', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:06');
INSERT INTO `tb_resource` VALUES ('272', '微博登录', '/users/oauth/weibo', 'POST', '173', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:06');
INSERT INTO `tb_resource` VALUES ('273', '修改密码', '/users/password', 'PUT', '173', '1', '2022-01-01 17:06:51', '2021-08-11 21:07:09');
INSERT INTO `tb_resource` VALUES ('274', '上传语音', '/voice', 'POST', '166', '1', '2022-01-01 17:06:51', '2021-08-11 21:05:33');
INSERT INTO `tb_resource` VALUES ('275', '上传访客信息', '/report', 'POST', '166', '1', '2022-01-01 17:06:51', '2021-08-24 11:24:10');
INSERT INTO `tb_resource` VALUES ('276', '获取用户区域分布', '/admin/users/area', 'GET', '173', '0', '2022-01-01 17:06:51', null);

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名',
  `role_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '管理员', 'admin', '0', '2022-01-01 17:06:51', '2021-08-24 11:25:30');
INSERT INTO `tb_role` VALUES ('2', '用户', 'user', '0', '2022-01-01 17:06:51', '2021-08-11 21:12:21');
INSERT INTO `tb_role` VALUES ('3', '测试', 'test', '0', '2022-01-01 17:06:51', '2022-01-17 23:58:04');
INSERT INTO `tb_role` VALUES ('4', '作者2', 'author2', '0', '2022-01-17 23:21:01', '2022-01-17 23:54:06');

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2392 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role_menu
-- ----------------------------
INSERT INTO `tb_role_menu` VALUES ('1397', '8', '1');
INSERT INTO `tb_role_menu` VALUES ('1398', '8', '2');
INSERT INTO `tb_role_menu` VALUES ('1399', '8', '6');
INSERT INTO `tb_role_menu` VALUES ('1400', '8', '7');
INSERT INTO `tb_role_menu` VALUES ('1401', '8', '8');
INSERT INTO `tb_role_menu` VALUES ('1402', '8', '9');
INSERT INTO `tb_role_menu` VALUES ('1403', '8', '10');
INSERT INTO `tb_role_menu` VALUES ('1404', '8', '3');
INSERT INTO `tb_role_menu` VALUES ('1405', '8', '11');
INSERT INTO `tb_role_menu` VALUES ('1406', '8', '12');
INSERT INTO `tb_role_menu` VALUES ('1407', '8', '202');
INSERT INTO `tb_role_menu` VALUES ('1408', '8', '13');
INSERT INTO `tb_role_menu` VALUES ('1409', '8', '14');
INSERT INTO `tb_role_menu` VALUES ('1410', '8', '201');
INSERT INTO `tb_role_menu` VALUES ('1411', '8', '4');
INSERT INTO `tb_role_menu` VALUES ('1412', '8', '16');
INSERT INTO `tb_role_menu` VALUES ('1413', '8', '15');
INSERT INTO `tb_role_menu` VALUES ('1414', '8', '17');
INSERT INTO `tb_role_menu` VALUES ('1415', '8', '18');
INSERT INTO `tb_role_menu` VALUES ('1416', '8', '19');
INSERT INTO `tb_role_menu` VALUES ('1417', '8', '20');
INSERT INTO `tb_role_menu` VALUES ('1418', '8', '5');
INSERT INTO `tb_role_menu` VALUES ('1595', '9', '1');
INSERT INTO `tb_role_menu` VALUES ('1596', '9', '2');
INSERT INTO `tb_role_menu` VALUES ('1597', '9', '6');
INSERT INTO `tb_role_menu` VALUES ('1598', '9', '7');
INSERT INTO `tb_role_menu` VALUES ('1599', '9', '8');
INSERT INTO `tb_role_menu` VALUES ('1600', '9', '9');
INSERT INTO `tb_role_menu` VALUES ('1601', '9', '10');
INSERT INTO `tb_role_menu` VALUES ('1602', '9', '3');
INSERT INTO `tb_role_menu` VALUES ('1603', '9', '11');
INSERT INTO `tb_role_menu` VALUES ('1604', '9', '12');
INSERT INTO `tb_role_menu` VALUES ('1605', '9', '202');
INSERT INTO `tb_role_menu` VALUES ('1606', '9', '13');
INSERT INTO `tb_role_menu` VALUES ('1607', '9', '14');
INSERT INTO `tb_role_menu` VALUES ('1608', '9', '201');
INSERT INTO `tb_role_menu` VALUES ('1609', '9', '4');
INSERT INTO `tb_role_menu` VALUES ('1610', '9', '16');
INSERT INTO `tb_role_menu` VALUES ('1611', '9', '15');
INSERT INTO `tb_role_menu` VALUES ('1612', '9', '17');
INSERT INTO `tb_role_menu` VALUES ('1613', '9', '18');
INSERT INTO `tb_role_menu` VALUES ('1614', '9', '19');
INSERT INTO `tb_role_menu` VALUES ('1615', '9', '20');
INSERT INTO `tb_role_menu` VALUES ('1616', '9', '5');
INSERT INTO `tb_role_menu` VALUES ('1639', '13', '2');
INSERT INTO `tb_role_menu` VALUES ('1640', '13', '6');
INSERT INTO `tb_role_menu` VALUES ('1641', '13', '7');
INSERT INTO `tb_role_menu` VALUES ('1642', '13', '8');
INSERT INTO `tb_role_menu` VALUES ('1643', '13', '9');
INSERT INTO `tb_role_menu` VALUES ('1644', '13', '10');
INSERT INTO `tb_role_menu` VALUES ('1645', '13', '3');
INSERT INTO `tb_role_menu` VALUES ('1646', '13', '11');
INSERT INTO `tb_role_menu` VALUES ('1647', '13', '12');
INSERT INTO `tb_role_menu` VALUES ('2252', '1', '1');
INSERT INTO `tb_role_menu` VALUES ('2253', '1', '2');
INSERT INTO `tb_role_menu` VALUES ('2254', '1', '6');
INSERT INTO `tb_role_menu` VALUES ('2255', '1', '7');
INSERT INTO `tb_role_menu` VALUES ('2256', '1', '8');
INSERT INTO `tb_role_menu` VALUES ('2257', '1', '9');
INSERT INTO `tb_role_menu` VALUES ('2258', '1', '10');
INSERT INTO `tb_role_menu` VALUES ('2259', '1', '3');
INSERT INTO `tb_role_menu` VALUES ('2260', '1', '11');
INSERT INTO `tb_role_menu` VALUES ('2261', '1', '12');
INSERT INTO `tb_role_menu` VALUES ('2262', '1', '202');
INSERT INTO `tb_role_menu` VALUES ('2263', '1', '13');
INSERT INTO `tb_role_menu` VALUES ('2264', '1', '201');
INSERT INTO `tb_role_menu` VALUES ('2265', '1', '213');
INSERT INTO `tb_role_menu` VALUES ('2266', '1', '14');
INSERT INTO `tb_role_menu` VALUES ('2267', '1', '15');
INSERT INTO `tb_role_menu` VALUES ('2268', '1', '16');
INSERT INTO `tb_role_menu` VALUES ('2269', '1', '4');
INSERT INTO `tb_role_menu` VALUES ('2270', '1', '214');
INSERT INTO `tb_role_menu` VALUES ('2271', '1', '209');
INSERT INTO `tb_role_menu` VALUES ('2272', '1', '17');
INSERT INTO `tb_role_menu` VALUES ('2273', '1', '18');
INSERT INTO `tb_role_menu` VALUES ('2274', '1', '205');
INSERT INTO `tb_role_menu` VALUES ('2275', '1', '206');
INSERT INTO `tb_role_menu` VALUES ('2276', '1', '208');
INSERT INTO `tb_role_menu` VALUES ('2277', '1', '210');
INSERT INTO `tb_role_menu` VALUES ('2278', '1', '19');
INSERT INTO `tb_role_menu` VALUES ('2279', '1', '20');
INSERT INTO `tb_role_menu` VALUES ('2280', '1', '5');
INSERT INTO `tb_role_menu` VALUES ('2336', '4', '1');
INSERT INTO `tb_role_menu` VALUES ('2337', '4', '2');
INSERT INTO `tb_role_menu` VALUES ('2338', '4', '6');
INSERT INTO `tb_role_menu` VALUES ('2339', '4', '7');
INSERT INTO `tb_role_menu` VALUES ('2340', '4', '8');
INSERT INTO `tb_role_menu` VALUES ('2341', '4', '9');
INSERT INTO `tb_role_menu` VALUES ('2342', '4', '10');
INSERT INTO `tb_role_menu` VALUES ('2343', '4', '3');
INSERT INTO `tb_role_menu` VALUES ('2344', '4', '11');
INSERT INTO `tb_role_menu` VALUES ('2345', '4', '12');
INSERT INTO `tb_role_menu` VALUES ('2346', '4', '202');
INSERT INTO `tb_role_menu` VALUES ('2347', '4', '13');
INSERT INTO `tb_role_menu` VALUES ('2348', '4', '201');
INSERT INTO `tb_role_menu` VALUES ('2349', '4', '213');
INSERT INTO `tb_role_menu` VALUES ('2350', '4', '14');
INSERT INTO `tb_role_menu` VALUES ('2351', '4', '15');
INSERT INTO `tb_role_menu` VALUES ('2352', '4', '16');
INSERT INTO `tb_role_menu` VALUES ('2353', '4', '4');
INSERT INTO `tb_role_menu` VALUES ('2354', '4', '214');
INSERT INTO `tb_role_menu` VALUES ('2355', '4', '209');
INSERT INTO `tb_role_menu` VALUES ('2356', '4', '17');
INSERT INTO `tb_role_menu` VALUES ('2357', '4', '18');
INSERT INTO `tb_role_menu` VALUES ('2358', '4', '205');
INSERT INTO `tb_role_menu` VALUES ('2359', '4', '206');
INSERT INTO `tb_role_menu` VALUES ('2360', '4', '208');
INSERT INTO `tb_role_menu` VALUES ('2361', '4', '210');
INSERT INTO `tb_role_menu` VALUES ('2362', '4', '19');
INSERT INTO `tb_role_menu` VALUES ('2363', '4', '5');
INSERT INTO `tb_role_menu` VALUES ('2364', '3', '1');
INSERT INTO `tb_role_menu` VALUES ('2365', '3', '2');
INSERT INTO `tb_role_menu` VALUES ('2366', '3', '6');
INSERT INTO `tb_role_menu` VALUES ('2367', '3', '7');
INSERT INTO `tb_role_menu` VALUES ('2368', '3', '8');
INSERT INTO `tb_role_menu` VALUES ('2369', '3', '9');
INSERT INTO `tb_role_menu` VALUES ('2370', '3', '10');
INSERT INTO `tb_role_menu` VALUES ('2371', '3', '3');
INSERT INTO `tb_role_menu` VALUES ('2372', '3', '11');
INSERT INTO `tb_role_menu` VALUES ('2373', '3', '12');
INSERT INTO `tb_role_menu` VALUES ('2374', '3', '202');
INSERT INTO `tb_role_menu` VALUES ('2375', '3', '13');
INSERT INTO `tb_role_menu` VALUES ('2376', '3', '201');
INSERT INTO `tb_role_menu` VALUES ('2377', '3', '213');
INSERT INTO `tb_role_menu` VALUES ('2378', '3', '14');
INSERT INTO `tb_role_menu` VALUES ('2379', '3', '15');
INSERT INTO `tb_role_menu` VALUES ('2380', '3', '16');
INSERT INTO `tb_role_menu` VALUES ('2381', '3', '4');
INSERT INTO `tb_role_menu` VALUES ('2382', '3', '214');
INSERT INTO `tb_role_menu` VALUES ('2383', '3', '209');
INSERT INTO `tb_role_menu` VALUES ('2384', '3', '17');
INSERT INTO `tb_role_menu` VALUES ('2385', '3', '18');
INSERT INTO `tb_role_menu` VALUES ('2386', '3', '205');
INSERT INTO `tb_role_menu` VALUES ('2387', '3', '206');
INSERT INTO `tb_role_menu` VALUES ('2388', '3', '208');
INSERT INTO `tb_role_menu` VALUES ('2389', '3', '210');
INSERT INTO `tb_role_menu` VALUES ('2390', '3', '19');
INSERT INTO `tb_role_menu` VALUES ('2391', '3', '5');

-- ----------------------------
-- Table structure for tb_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_resource`;
CREATE TABLE `tb_role_resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `resource_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_role_resource
-- ----------------------------
INSERT INTO `tb_role_resource` VALUES ('4011', '2', '254');
INSERT INTO `tb_role_resource` VALUES ('4012', '2', '267');
INSERT INTO `tb_role_resource` VALUES ('4013', '2', '269');
INSERT INTO `tb_role_resource` VALUES ('4014', '2', '270');
INSERT INTO `tb_role_resource` VALUES ('4015', '2', '257');
INSERT INTO `tb_role_resource` VALUES ('4016', '2', '258');
INSERT INTO `tb_role_resource` VALUES ('4076', '1', '165');
INSERT INTO `tb_role_resource` VALUES ('4077', '1', '192');
INSERT INTO `tb_role_resource` VALUES ('4078', '1', '193');
INSERT INTO `tb_role_resource` VALUES ('4079', '1', '194');
INSERT INTO `tb_role_resource` VALUES ('4080', '1', '195');
INSERT INTO `tb_role_resource` VALUES ('4081', '1', '166');
INSERT INTO `tb_role_resource` VALUES ('4082', '1', '183');
INSERT INTO `tb_role_resource` VALUES ('4083', '1', '184');
INSERT INTO `tb_role_resource` VALUES ('4084', '1', '246');
INSERT INTO `tb_role_resource` VALUES ('4085', '1', '247');
INSERT INTO `tb_role_resource` VALUES ('4086', '1', '167');
INSERT INTO `tb_role_resource` VALUES ('4087', '1', '199');
INSERT INTO `tb_role_resource` VALUES ('4088', '1', '200');
INSERT INTO `tb_role_resource` VALUES ('4089', '1', '201');
INSERT INTO `tb_role_resource` VALUES ('4090', '1', '168');
INSERT INTO `tb_role_resource` VALUES ('4091', '1', '185');
INSERT INTO `tb_role_resource` VALUES ('4092', '1', '186');
INSERT INTO `tb_role_resource` VALUES ('4093', '1', '187');
INSERT INTO `tb_role_resource` VALUES ('4094', '1', '188');
INSERT INTO `tb_role_resource` VALUES ('4095', '1', '189');
INSERT INTO `tb_role_resource` VALUES ('4096', '1', '190');
INSERT INTO `tb_role_resource` VALUES ('4097', '1', '191');
INSERT INTO `tb_role_resource` VALUES ('4098', '1', '254');
INSERT INTO `tb_role_resource` VALUES ('4099', '1', '169');
INSERT INTO `tb_role_resource` VALUES ('4100', '1', '208');
INSERT INTO `tb_role_resource` VALUES ('4101', '1', '209');
INSERT INTO `tb_role_resource` VALUES ('4102', '1', '170');
INSERT INTO `tb_role_resource` VALUES ('4103', '1', '234');
INSERT INTO `tb_role_resource` VALUES ('4104', '1', '235');
INSERT INTO `tb_role_resource` VALUES ('4105', '1', '236');
INSERT INTO `tb_role_resource` VALUES ('4106', '1', '237');
INSERT INTO `tb_role_resource` VALUES ('4107', '1', '171');
INSERT INTO `tb_role_resource` VALUES ('4108', '1', '213');
INSERT INTO `tb_role_resource` VALUES ('4109', '1', '214');
INSERT INTO `tb_role_resource` VALUES ('4110', '1', '215');
INSERT INTO `tb_role_resource` VALUES ('4111', '1', '216');
INSERT INTO `tb_role_resource` VALUES ('4112', '1', '217');
INSERT INTO `tb_role_resource` VALUES ('4113', '1', '224');
INSERT INTO `tb_role_resource` VALUES ('4114', '1', '172');
INSERT INTO `tb_role_resource` VALUES ('4115', '1', '240');
INSERT INTO `tb_role_resource` VALUES ('4116', '1', '241');
INSERT INTO `tb_role_resource` VALUES ('4117', '1', '244');
INSERT INTO `tb_role_resource` VALUES ('4118', '1', '245');
INSERT INTO `tb_role_resource` VALUES ('4119', '1', '267');
INSERT INTO `tb_role_resource` VALUES ('4120', '1', '269');
INSERT INTO `tb_role_resource` VALUES ('4121', '1', '270');
INSERT INTO `tb_role_resource` VALUES ('4122', '1', '173');
INSERT INTO `tb_role_resource` VALUES ('4123', '1', '239');
INSERT INTO `tb_role_resource` VALUES ('4124', '1', '242');
INSERT INTO `tb_role_resource` VALUES ('4125', '1', '276');
INSERT INTO `tb_role_resource` VALUES ('4126', '1', '174');
INSERT INTO `tb_role_resource` VALUES ('4127', '1', '205');
INSERT INTO `tb_role_resource` VALUES ('4128', '1', '206');
INSERT INTO `tb_role_resource` VALUES ('4129', '1', '207');
INSERT INTO `tb_role_resource` VALUES ('4130', '1', '175');
INSERT INTO `tb_role_resource` VALUES ('4131', '1', '218');
INSERT INTO `tb_role_resource` VALUES ('4132', '1', '219');
INSERT INTO `tb_role_resource` VALUES ('4133', '1', '220');
INSERT INTO `tb_role_resource` VALUES ('4134', '1', '221');
INSERT INTO `tb_role_resource` VALUES ('4135', '1', '222');
INSERT INTO `tb_role_resource` VALUES ('4136', '1', '223');
INSERT INTO `tb_role_resource` VALUES ('4137', '1', '176');
INSERT INTO `tb_role_resource` VALUES ('4138', '1', '202');
INSERT INTO `tb_role_resource` VALUES ('4139', '1', '203');
INSERT INTO `tb_role_resource` VALUES ('4140', '1', '204');
INSERT INTO `tb_role_resource` VALUES ('4141', '1', '230');
INSERT INTO `tb_role_resource` VALUES ('4142', '1', '238');
INSERT INTO `tb_role_resource` VALUES ('4143', '1', '177');
INSERT INTO `tb_role_resource` VALUES ('4144', '1', '229');
INSERT INTO `tb_role_resource` VALUES ('4145', '1', '232');
INSERT INTO `tb_role_resource` VALUES ('4146', '1', '233');
INSERT INTO `tb_role_resource` VALUES ('4147', '1', '243');
INSERT INTO `tb_role_resource` VALUES ('4148', '1', '178');
INSERT INTO `tb_role_resource` VALUES ('4149', '1', '196');
INSERT INTO `tb_role_resource` VALUES ('4150', '1', '197');
INSERT INTO `tb_role_resource` VALUES ('4151', '1', '198');
INSERT INTO `tb_role_resource` VALUES ('4152', '1', '257');
INSERT INTO `tb_role_resource` VALUES ('4153', '1', '258');
INSERT INTO `tb_role_resource` VALUES ('4154', '1', '179');
INSERT INTO `tb_role_resource` VALUES ('4155', '1', '225');
INSERT INTO `tb_role_resource` VALUES ('4156', '1', '226');
INSERT INTO `tb_role_resource` VALUES ('4157', '1', '227');
INSERT INTO `tb_role_resource` VALUES ('4158', '1', '228');
INSERT INTO `tb_role_resource` VALUES ('4159', '1', '231');
INSERT INTO `tb_role_resource` VALUES ('4160', '1', '180');
INSERT INTO `tb_role_resource` VALUES ('4161', '1', '210');
INSERT INTO `tb_role_resource` VALUES ('4162', '1', '211');
INSERT INTO `tb_role_resource` VALUES ('4163', '1', '212');
INSERT INTO `tb_role_resource` VALUES ('4164', '3', '192');
INSERT INTO `tb_role_resource` VALUES ('4165', '3', '195');
INSERT INTO `tb_role_resource` VALUES ('4166', '3', '183');
INSERT INTO `tb_role_resource` VALUES ('4167', '3', '246');
INSERT INTO `tb_role_resource` VALUES ('4168', '3', '199');
INSERT INTO `tb_role_resource` VALUES ('4169', '3', '185');
INSERT INTO `tb_role_resource` VALUES ('4170', '3', '191');
INSERT INTO `tb_role_resource` VALUES ('4171', '3', '254');
INSERT INTO `tb_role_resource` VALUES ('4172', '3', '208');
INSERT INTO `tb_role_resource` VALUES ('4173', '3', '234');
INSERT INTO `tb_role_resource` VALUES ('4174', '3', '237');
INSERT INTO `tb_role_resource` VALUES ('4175', '3', '213');
INSERT INTO `tb_role_resource` VALUES ('4176', '3', '241');
INSERT INTO `tb_role_resource` VALUES ('4177', '3', '239');
INSERT INTO `tb_role_resource` VALUES ('4178', '3', '276');
INSERT INTO `tb_role_resource` VALUES ('4179', '3', '205');
INSERT INTO `tb_role_resource` VALUES ('4180', '3', '218');
INSERT INTO `tb_role_resource` VALUES ('4181', '3', '223');
INSERT INTO `tb_role_resource` VALUES ('4182', '3', '202');
INSERT INTO `tb_role_resource` VALUES ('4183', '3', '230');
INSERT INTO `tb_role_resource` VALUES ('4184', '3', '238');
INSERT INTO `tb_role_resource` VALUES ('4185', '3', '232');
INSERT INTO `tb_role_resource` VALUES ('4186', '3', '243');
INSERT INTO `tb_role_resource` VALUES ('4187', '3', '196');
INSERT INTO `tb_role_resource` VALUES ('4188', '3', '257');
INSERT INTO `tb_role_resource` VALUES ('4189', '3', '258');
INSERT INTO `tb_role_resource` VALUES ('4190', '3', '225');
INSERT INTO `tb_role_resource` VALUES ('4191', '3', '231');
INSERT INTO `tb_role_resource` VALUES ('4192', '3', '210');
INSERT INTO `tb_role_resource` VALUES ('4437', '4', '192');
INSERT INTO `tb_role_resource` VALUES ('4438', '4', '193');
INSERT INTO `tb_role_resource` VALUES ('4439', '4', '195');
INSERT INTO `tb_role_resource` VALUES ('4440', '4', '183');
INSERT INTO `tb_role_resource` VALUES ('4441', '4', '246');
INSERT INTO `tb_role_resource` VALUES ('4442', '4', '199');
INSERT INTO `tb_role_resource` VALUES ('4443', '4', '185');
INSERT INTO `tb_role_resource` VALUES ('4444', '4', '186');
INSERT INTO `tb_role_resource` VALUES ('4445', '4', '191');
INSERT INTO `tb_role_resource` VALUES ('4446', '4', '254');
INSERT INTO `tb_role_resource` VALUES ('4447', '4', '234');
INSERT INTO `tb_role_resource` VALUES ('4448', '4', '235');
INSERT INTO `tb_role_resource` VALUES ('4449', '4', '237');
INSERT INTO `tb_role_resource` VALUES ('4450', '4', '213');
INSERT INTO `tb_role_resource` VALUES ('4451', '4', '241');
INSERT INTO `tb_role_resource` VALUES ('4452', '4', '239');
INSERT INTO `tb_role_resource` VALUES ('4453', '4', '276');
INSERT INTO `tb_role_resource` VALUES ('4454', '4', '205');
INSERT INTO `tb_role_resource` VALUES ('4455', '4', '218');
INSERT INTO `tb_role_resource` VALUES ('4456', '4', '223');
INSERT INTO `tb_role_resource` VALUES ('4457', '4', '202');
INSERT INTO `tb_role_resource` VALUES ('4458', '4', '230');
INSERT INTO `tb_role_resource` VALUES ('4459', '4', '238');
INSERT INTO `tb_role_resource` VALUES ('4460', '4', '232');
INSERT INTO `tb_role_resource` VALUES ('4461', '4', '243');
INSERT INTO `tb_role_resource` VALUES ('4462', '4', '196');
INSERT INTO `tb_role_resource` VALUES ('4463', '4', '257');
INSERT INTO `tb_role_resource` VALUES ('4464', '4', '258');
INSERT INTO `tb_role_resource` VALUES ('4465', '4', '225');
INSERT INTO `tb_role_resource` VALUES ('4466', '4', '210');

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES ('27', '测试标签', '2021-12-22 15:50:57', null);
INSERT INTO `tb_tag` VALUES ('28', 'Mybatis', '2022-01-15 23:39:58', null);
INSERT INTO `tb_tag` VALUES ('29', 'H5&C3', '2022-01-17 00:10:03', null);

-- ----------------------------
-- Table structure for tb_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_unique_view`;
CREATE TABLE `tb_unique_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '时间',
  `views_count` int NOT NULL COMMENT '访问量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_unique_view
-- ----------------------------
INSERT INTO `tb_unique_view` VALUES ('1', '2021-12-22 00:00:00', '2');
INSERT INTO `tb_unique_view` VALUES ('2', '2021-12-24 00:00:00', '3');
INSERT INTO `tb_unique_view` VALUES ('3', '2021-12-25 00:00:00', '0');
INSERT INTO `tb_unique_view` VALUES ('4', '2021-12-26 00:00:00', '0');
INSERT INTO `tb_unique_view` VALUES ('5', '2022-01-08 00:00:00', '8');
INSERT INTO `tb_unique_view` VALUES ('6', '2022-01-09 00:00:00', '26');
INSERT INTO `tb_unique_view` VALUES ('7', '2022-01-10 00:00:00', '27');
INSERT INTO `tb_unique_view` VALUES ('8', '2022-01-11 00:00:00', '28');
INSERT INTO `tb_unique_view` VALUES ('9', '2022-01-12 00:00:00', '42');
INSERT INTO `tb_unique_view` VALUES ('10', '2022-01-13 00:00:00', '12');
INSERT INTO `tb_unique_view` VALUES ('11', '2022-01-14 00:00:00', '11');
INSERT INTO `tb_unique_view` VALUES ('12', '2022-01-15 00:00:00', '1');
INSERT INTO `tb_unique_view` VALUES ('13', '2022-01-16 00:00:00', '1');
INSERT INTO `tb_unique_view` VALUES ('14', '2022-01-17 00:00:00', '1');
INSERT INTO `tb_unique_view` VALUES ('15', '2022-01-18 00:00:00', '2');

-- ----------------------------
-- Table structure for tb_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_auth`;
CREATE TABLE `tb_user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user_auth
-- ----------------------------
INSERT INTO `tb_user_auth` VALUES ('1', '1', 'admin@qq.com', '$2a$10$d6hz3/CRjGDUzzVOHEnl3.JC5xEWl0fTXCAcuHjwb5fWioyfx0WHq', '1', '36.105.57.49', '湖北武汉 电信', '2021-08-12 15:43:18', '2022-01-19 01:02:01', '2022-01-19 01:02:01');
INSERT INTO `tb_user_auth` VALUES ('3', '3', 'test@qq.com', '$2a$10$d6hz3/CRjGDUzzVOHEnl3.JC5xEWl0fTXCAcuHjwb5fWioyfx0WHq', '1', '36.105.57.49', '湖南株洲 电信', '2022-01-08 18:40:55', '2022-01-17 23:44:36', '2022-01-17 23:44:36');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '个人网站',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES ('1', 'admin@qq.com', 'wkc++', 'http://lyqblog.oss-cn-beijing.aliyuncs.com/avatar/5614e54d18faf4fa2a5f17417eef25df.jpg', '李某', 'lyqzzk.top', '0', '2021-08-12 15:43:17', '2022-01-08 18:36:05');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('577', '1', '1');
INSERT INTO `tb_user_role` VALUES ('578', '2', '2');
INSERT INTO `tb_user_role` VALUES ('582', '3', '3');
INSERT INTO `tb_user_role` VALUES ('583', '4', '2');
INSERT INTO `tb_user_role` VALUES ('584', '5', '2');
INSERT INTO `tb_user_role` VALUES ('585', '6', '2');
INSERT INTO `tb_user_role` VALUES ('586', '6', '4');

-- ----------------------------
-- Table structure for tb_website_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_website_config`;
CREATE TABLE `tb_website_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_website_config
-- ----------------------------
INSERT INTO `tb_website_config` VALUES ('1', '{\"alipayQRCode\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/524c792455ff1da416e0619feb7c0d89.png\",\"gitee\":\"https://gitee.com/li_lyq\",\"github\":\"https://github.com/\",\"isChatRoom\":1,\"isCommentReview\":0,\"isEmailNotice\":1,\"isMessageReview\":0,\"isMusicPlayer\":1,\"isReward\":1,\"qq\":\"550798972\",\"socialLoginList\":[\"qq\"],\"socialUrlList\":[\"qq\",\"github\",\"gitee\"],\"touristAvatar\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/92ecad86626e5bf5214a2bc514dddc8c.jpeg\",\"userAvatar\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/15ab8acc1317da6b3382d6196e93ec05.jpeg\",\"websiteAuthor\":\"wkc++\",\"websiteAvatar\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/5614e54d18faf4fa2a5f17417eef25df.jpg\",\"websiteCreateTime\":\"2021-12-22\",\"websiteIntro\":\"知行合一\",\"websiteName\":\"wkc++的个人博客\",\"websiteNotice\":\"陆续更新博客文章\",\"websiteRecordNo\":\"豫ICP备2022000074号-1\",\"websocketUrl\":\"ws://websocket.lyqzzk.top\",\"weiXinQRCode\":\"http://lyqblog.oss-cn-beijing.aliyuncs.com/config/eed7272f3776c8e8ac56779c74c8dcb7.png\"}', '2022-01-01 19:37:30', '2022-01-17 23:12:20');
