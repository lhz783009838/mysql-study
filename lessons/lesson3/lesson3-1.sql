-- ͳ�ƺ���

-- ��ѯ�����ĵ���Ʒ�۸�
SELECT MAX(gs.shop_price) FROM goods gs;

-- ��ѯ���µ���Ʒ
SELECT *,MAX(gs.goods_id) FROM goods gs;

-- ��ѯ����˵���Ʒ
SELECT MIN(gs.shop_price) FROM goods gs;

-- ��ѯ��ɵ���Ʒ
SELECT *, MIN(gs.goods_id) FROM goods gs;

-- ��ѯ������Ʒ�Ŀ������
SELECT SUM(gs.goods_number) FROM goods gs;

-- ��ѯ��Ʒ�ľ���
SELECT AVG(gs.shop_price) FROM goods gs;

-- ��ѯһ���ж�������Ʒ
SELECT COUNT(*) FROM goods gs
