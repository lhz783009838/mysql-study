desc user;
select * FROM user;
INSERT INTO user(uid,name,age) VALUES(1,'����',20);
INSERT INTO user(name,age) VALUES('����',21);
INSERT INTO user(name,age) VALUES(����,20); -- �޷�ִ��
INSERT INTO user(name,age) VALUES('����','20');
-- һ����Ӷ�������
INSERT INTO user(name,age) VALUES('�Ԣ�',21),('����',21);
