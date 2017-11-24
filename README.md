# mysql-study
study mysql logs

#mysql优化学习
什么是事务
 事务的隔离性(ISOLATION)
  SQL标准中定义的四中隔离级别
   未提交读(READ UNCOMMITED)
   已提交读(READ COMMITED)
   课重复读(REPEATABLE READ)
   可串行化(SERIALIZABLE)
 隔离性 从上到下 由高到低
 并发性 从上到下 从低到高、
 
 事务的持久性
  定义：
   一旦事务提交，所做的修改就会永久的保存到数据库中，不会丢失；
 大事务

什么是大事务
