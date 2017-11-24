-- DELETE 插入
-- DELETE FROM table WHERE expr;
SELECT * FROM user;

DELETE FROM user WHERE uid = 2;

-- DELETE不加 WHERE 条件 则删除整张表
DELETE FROM user;