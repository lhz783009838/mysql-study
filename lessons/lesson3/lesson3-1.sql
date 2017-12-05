-- 统计函数

-- 查询出最贵的的商品价格
SELECT MAX(gs.shop_price) FROM goods gs;

-- 查询最新的商品
SELECT *,MAX(gs.goods_id) FROM goods gs;

-- 查询最便宜的商品
SELECT MIN(gs.shop_price) FROM goods gs;

-- 查询最旧的商品
SELECT *, MIN(gs.goods_id) FROM goods gs;

-- 查询所有商品的库存总量
SELECT SUM(gs.goods_number) FROM goods gs;

-- 查询商品的均价
SELECT AVG(gs.shop_price) FROM goods gs;

-- 查询一共有多少中商品
SELECT COUNT(*) FROM goods gs
