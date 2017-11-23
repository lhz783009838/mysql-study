-- INSERT 插入
-- 全属性插入
INSERT INTO user(uid,name,age) VALUES(1,'xiaoming',21);
INSERT INTO user(uid,name,age) VALUES(2,'xiaohuang',22);
-- 全插入的简略写法，不需要指定属性
INSERT INTO user VALUES(3,'xianghong',22);
-- 部分属性插入
-- 自增主键不需要插入ID
INSERT INTO user(name,age) VALUES('xiaolv',20);
-- 字符串属性必须插入字符串,否则会出现异常
INSERT INTO user(name,age) VALUES(xiaohei,21); -- 执行报错
INSERT INTO user(name,age) VALUES('xiaohei',21); -- 执行正确
-- 基本数据类型使用字符串则不受影响
INSERT INTO user(name,age) VALUES('xiaoqing','20');
-- 一次插入多行记录,使用','隔开
INSERT INTO user(name,age) VALUES('xiaolan',20),('xiaozi',20),('xiaozong',20);

-- 注意：
-- 列与值, 严格对应 (id 自增列也必须对应)
-- 数字和字符串的注意点
-- 数字不必加单引号,字符串必须加单引号.
-- 1次添加多行数据,用逗号隔开