# spring-mp

#### 介绍

**spring-mp**是一个`springboot + mybatis plus` 集成的一个基础demo。已实现代码生成器，在`CodeGenerator`中。

搭建的目的是供测试学习使用，可是为了新项目提供快速的基础框架搭建。后面将不定期维护和扩展集成更多的常用框架。

1. [x] 已集成定时任务框架`quartz`

#### 软件架构

该demo基于`springboot 2.6.0`，使用`mysql5.7`数据库

```
<properties>
        <java.version>1.8</java.version>
        <mysql.version>8.0.28</mysql.version>
        <mybatis-plus.version>3.4.2</mybatis-plus.version>
        <mybatis-plus-generator.version>3.4.1</mybatis-plus-generator.version>
        <freemarker.version>2.3.31</freemarker.version>
        <fast-json.version>1.2.83</fast-json.version>
        <lombok.version>1.18.22</lombok.version>
        <druid.version>1.1.16</druid.version>
    </properties>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.6.9</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
```

#### 使用说明

1. 先初始化`/src/main/resources/static/spring_mp_db.sql` sql脚本，创建数据库环境
2. 直接运行测试方法 `/src/test/java/com/example/spring_mp/OrderTest`
3. 关于mybatisd的DB操作的使用方法可参考`module-order`模块下的测试用例
4. 关于`quartz`的使用方法
   1. 在数据库`t_job`表中添加任务记录
   2. 在`module-task`模块的job包中参照`TestTask`即可。




