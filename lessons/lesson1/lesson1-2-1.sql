SELECT * FROM user;
UPDATE user set age = 55 WHERE uid=2

-- 不加where条件时，整个列的数据都会被更新
-- user表的引擎不支持事务
begin;
UPDATE user set age = 56;
rollback;
COMMIT;