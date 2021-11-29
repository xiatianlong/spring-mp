# spring-mp

#### 介绍
spring-mp是一个springboot + mybatis plus 集成的一个基础demo。包含代码生成器、MP的Lambda方式和xml写sql的形式执行数据库的增删改查。

#### 软件架构
该demo基于`springboot 2.6.0`，使用mysql数据库
```
<properties>
    <java.version>1.8</java.version>
    <mysql.version>5.1.47</mysql.version>
    <mybatis-plus.version>3.4.2</mybatis-plus.version>
    <mybatis-plus-generator.version>3.4.1</mybatis-plus-generator.version>
    <freemarker.version>2.3.31</freemarker.version>
    <fast-json.version>1.2.73</fast-json.version>
    <lombok.version>1.18.22</lombok.version>
</properties>
```


#### 使用说明

1.  先初始化`/src/main/resources/static/spring_mp_db.sql` sql脚本，创建数据库环境
2.  直接运行测试方法 `/src/test/java/com/example/spring_mp/OrderTest`



#### 测试方法预览

```
/******************************************** ↓ ↓ ↓ 增 ↓ ↓ ↓ ***********************************************/

    /**
     * 插入order数据
     */
    @Test
    void saveOrder(){
       for (int i = 1; i < 10; i++){
           TOrder order = new TOrder();
           order.setOrderNo("NO00000" + i);
           order.setPayAmount(BigDecimal.valueOf(100));
           orderService.save(order);

           // 批量插入orderItem
           List<TOrderItem> tOrderItems = new ArrayList<>();
           for (int j = 1; j < 3; j++){
               TOrderItem orderItem = new TOrderItem();
               orderItem.setOrderId(order.getId());
               orderItem.setProductCount(j);
               orderItem.setProductName("测试商品");
               tOrderItems.add(orderItem);
           }
           orderItemService.saveBatch(tOrderItems);
       }

    }

    /******************************************** ↓ ↓ ↓ 改 ↓ ↓ ↓ ***********************************************/

    /**
     * 更新order数据
     */
    @Test
    void updateOrder(){
        TOrder order = orderService.getById(1);
        order.setUpdatedDate(LocalDateTime.now());
        order.setPayAmount(BigDecimal.valueOf(102));
        orderService.saveOrUpdate(order);
    }

    /**
     * 更新order数据
     * 更新部分字段，待条件更新
     */
    @Test
    void updateOrderOfSomeColumn(){
        LambdaUpdateWrapper<TOrder> updateWrapper = new LambdaUpdateWrapper<>();
        TOrder order = new TOrder();
        order.setUpdatedDate(LocalDateTime.now());
        // 只更新金额为100的，设置更新时间
        updateWrapper.eq(TOrder::getPayAmount, BigDecimal.valueOf(100));
        orderService.update(order, updateWrapper);
    }

    /******************************************** ↓ ↓ ↓ 删 ↓ ↓ ↓ ***********************************************/

    /**
     * 删除order数据
     * # 已在application.yml配置逻辑删除；所有的删除会变成update，更新dataStatus字段
     * # 逻辑删除后的数据查询也无法查出
     * # 逻辑见：https://mp.baomidou.com/guide/logic-delete.html#%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95
     */
    @Test
    void deleteOrder(){
        orderService.removeById(1);
    }

    /**
     * 带条件删除
     */
    @Test
    void deleteByQueryWrapper(){
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TOrder::getPayAmount, 100);
        orderService.remove(lambdaQueryWrapper);
    }



    /******************************************** ↓ ↓ ↓ 查 ↓ ↓ ↓ ***********************************************/

    /**
     * 根据ID查询Order
     */
    @Test
    void getById() {
        TOrder order = orderService.getById(2);
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 根据ID查询Order
     */
    @Test
    void getByQueryWrapper() {
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(TOrder::getId, 1);
        TOrder order = orderService.getOne(lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 查询全部order
     */
    @Test
    void list() {
        List<TOrder> orderList = orderService.list();
        System.err.println(JSONObject.toJSON(orderList).toString());
    }

    /**
     * 根据ID查询Order
     */
    @Test
    void listByQueryWrapper() {
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        // 查询ID大于1的数据
        lambdaQueryWrapper.gt(TOrder::getId, 1);
        List<TOrder> orderList = orderService.list(lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(orderList).toString());
    }

    /**
     * 分页查询Order
     */
    @Test
    void listByPage() {
        int pageNo = 1; // 从1开始
        int pageSize = 2;
        Page<TOrder> page = new Page<>(pageNo, pageSize);
        Page<TOrder> orderPage = orderService.page(page);
        System.err.println(JSONObject.toJSON(orderPage).toString());
    }

    /**
     * 分页查询Order
     * 带条件
     */
    @Test
    void listByPageWithQueryWrapper() {
        int pageNo = 1; // 从1开始
        int pageSize = 2;
        Page<TOrder> page = new Page<>(pageNo, pageSize);
        LambdaQueryWrapper<TOrder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.gt(TOrder::getPayAmount, 100);
        Page<TOrder> orderPage = orderService.page(page, lambdaQueryWrapper);
        System.err.println(JSONObject.toJSON(orderPage).toString());
    }

    /**
     * 通过xml查询订单
     */
    @Test
    void getOrderByXml(){
        ParamsBuilder paramsBuilder = ParamsBuilder.newBuild().addParam("id", 1);
        TOrder order = orderService.getOrderByXml(paramsBuilder.build());
        System.err.println(JSONObject.toJSON(order).toString());
    }

    /**
     * 通过xml查询订单
     */
    @Test
    void getOrderWithOrderItemByXml(){
        ParamsBuilder paramsBuilder = ParamsBuilder.newBuild().addParam("id", 1).addParam("loadItem", true);
        TOrder order = orderService.getOrderByXml(paramsBuilder.build());
        System.err.println(JSONObject.toJSON(order).toString());
    }
```

