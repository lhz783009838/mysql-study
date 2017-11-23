DESC user;
select * from user;

-- UPDATE 更新

-- update 表名 set
-- 列1 = 新值1, 
-- 列2 = 新值2 where expr

UPDATE user set age = 51 WHERE uid = 2;

-- 不加WHERE条件时将更新该列的全部数据
UPDATE user set age = 50