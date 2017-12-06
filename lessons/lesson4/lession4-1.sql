-- having 查询练习  where 子查询

ELECT * FROM result;
-- 1 查询每个人的平均成绩
SELECT AVG(score),name FROM result GROUP BY name;
-- 查询每个人的挂科情况
SELECT *,count(score < 60) as gk FROM result GROUP BY name;
-- 合并语句
SELECT *,AVG(score),count(score <60) as gk FROM result GROUP BY name;
-- 筛选挂科数大于等于2的学生平均成绩
SELECT *,AVG(score),sum(score <60) as gk FROM result GROUP BY name HAVING gk >=2;

-- INSERT into result value('赵六','地理',80),('赵六','八股',90);

-- 查询每个栏目下最新的产品(goods_id 最大即为最新)
SELECT * FROM goods;
-- 查询每个栏目goods_id最新
SELECT max(goods_id) FROM goods GROUP BY cat_id;
-- 查询商品信息
SELECT * FROM goods;
-- 合并
SELECT * FROM goods WHERE goods_id in(SELECT MAX(goods_id) FROM goods GROUP BY cat_id);
