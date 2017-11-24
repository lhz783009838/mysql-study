desc user;
select * FROM user;
INSERT INTO user(uid,name,age) VALUES(1,'张三',20);
INSERT INTO user(name,age) VALUES('李四',21);
INSERT INTO user(name,age) VALUES(王五,20); -- 无法执行
INSERT INTO user(name,age) VALUES('王五','20');
-- 一次添加多行数据
INSERT INTO user(name,age) VALUES('赵⑥',21),('刘⑦',21);
