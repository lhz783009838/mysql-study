-- INSERT ����
-- ȫ���Բ���
INSERT INTO user(uid,name,age) VALUES(1,'xiaoming',21);
INSERT INTO user(uid,name,age) VALUES(2,'xiaohuang',22);
-- ȫ����ļ���д��������Ҫָ������
INSERT INTO user VALUES(3,'xianghong',22);
-- �������Բ���
-- ������������Ҫ����ID
INSERT INTO user(name,age) VALUES('xiaolv',20);
-- �ַ������Ա�������ַ���,���������쳣
INSERT INTO user(name,age) VALUES(xiaohei,21); -- ִ�б���
INSERT INTO user(name,age) VALUES('xiaohei',21); -- ִ����ȷ
-- ������������ʹ���ַ�������Ӱ��
INSERT INTO user(name,age) VALUES('xiaoqing','20');
-- һ�β�����м�¼,ʹ��','����
INSERT INTO user(name,age) VALUES('xiaolan',20),('xiaozi',20),('xiaozong',20);

-- ע�⣺
-- ����ֵ, �ϸ��Ӧ (id ������Ҳ�����Ӧ)
-- ���ֺ��ַ�����ע���
-- ���ֲ��ؼӵ�����,�ַ�������ӵ�����.
-- 1����Ӷ�������,�ö��Ÿ���