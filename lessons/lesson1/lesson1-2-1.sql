SELECT * FROM user;
UPDATE user set age = 55 WHERE uid=2

-- ����where����ʱ�������е����ݶ��ᱻ����
-- user������治֧������
begin;
UPDATE user set age = 56;
rollback;
COMMIT;