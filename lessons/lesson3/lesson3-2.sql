1�����д�����������

2����ѯ������γ̱ȡ������γ̳ɼ��ߵ�����ѧ����ѧ�ţ�

3����ѯƽ���ɼ�����60�ֵ�ͬѧ��ѧ�ź�ƽ���ɼ��� 

4����ѯ����ͬѧ��ѧ�š�������ѡ�������ܳɼ���

5����ѯ�ա������ʦ�ĸ�����

6����ѯûѧ����Ҷƽ����ʦ�ε�ͬѧ��ѧ�š�������

7����ѯѧ����001������Ҳѧ����š�002���γ̵�ͬѧ��ѧ�š�������

8����ѯѧ����Ҷƽ����ʦ���̵����пε�ͬѧ��ѧ�š�������

9����ѯ�γ̱�š�002���ĳɼ��ȿγ̱�š�001���γ̵͵�����ͬѧ��ѧ�š�������

10����ѯ�пγ̳ɼ�С��60�ֵ�ͬѧ��ѧ�š�������

11����ѯû��ѧȫ���пε�ͬѧ��ѧ�š�������

12����ѯ������һ�ſ���ѧ��Ϊ��001����ͬѧ��ѧ��ͬ��ͬѧ��ѧ�ź�������

13����ѯ����ѧ��ѧ��Ϊ��001��ͬѧ��ѡ�γ�������һ�ſε�����ͬѧѧ�ź�������

14����ѯ�͡�002���ŵ�ͬѧѧϰ�Ŀγ���ȫ��ͬ������ͬѧѧ�ź�������

15��ɾ��ѧϰ��Ҷƽ����ʦ�ε�SC���¼��

16����SC���в���һЩ��¼����Щ��¼Ҫ�����������������û���Ϲ���š�002���γ̵�ͬѧѧ�ţ��ڲ��롰002���ſγ̵�ƽ���ɼ��� 

17����ƽ���ɼ��ӵ͵�����ʾ����ѧ���ġ����ġ�������ѧ������Ӣ����ŵĿγ̳ɼ�����������ʽ��ʾ�� ѧ��ID,����,��ѧ,Ӣ��,��Ч�γ���,��Чƽ���֣�

18����ѯ���Ƴɼ���ߺ���͵ķ֣���������ʽ��ʾ���γ�ID����߷֣���ͷ֣�

19��������ƽ���ɼ��ӵ͵��ߺͼ����ʵİٷ����Ӹߵ���˳��

20���γ�ƽ���ִӸߵ�����ʾ����ʵ�ο���ʦ����

21����ѯ���Ƴɼ�ǰ�����ļ�¼:(�����ǳɼ��������) 

22����ѯÿ�ſγ̱�ѡ�޵�ѧ������

23����ѯ��ֻѡ����һ�ſγ̵�ȫ��ѧ����ѧ�ź�������

24����ѯ������Ů����������

25����ѯ�ա��š���ѧ��������

26����ѯͬ��ͬ��ѧ����������ͳ��ͬ��������

27����ѯÿ�ſγ̵�ƽ���ɼ��������ƽ���ɼ��������У�ƽ���ɼ���ͬʱ�����γ̺Ž������У�

28����ѯƽ���ɼ�����85������ѧ����ѧ�š�������ƽ���ɼ���

29����ѯ�γ�����Ϊ����ѧ�����ҷ�������60��ѧ�������ͷ�����

30����ѯ�γ̱��Ϊ003�ҿγ̳ɼ���80�����ϵ�ѧ����ѧ�ź������� 

31����ѡ�˿γ̵�ѧ������

32����ѯѡ�ޡ����ޡ���ʦ���ڿγ̵�ѧ���У��ɼ���ߵ�ѧ����������ɼ���

33����ѯ�����γ̼���Ӧ��ѡ��������

34����ѯ��ͬ�γ̵��ɼ���ͬ��ѧ����ѧ�š��γ̺š�ѧ���ɼ���

35����ѯÿ�ſγ̳ɼ���õ�ǰ������

36����������ѡ�����ſγ̵�ѧ��ѧ�ţ�

37����ѯȫ��ѧ����ѡ�޵Ŀγ̵Ŀγ̺źͿγ�����

38����ѯûѧ����Ҷƽ����ʦ���ڵ���һ�ſγ̵�ѧ��������

39����ѯ�������ϲ�����γ̵�ͬѧ��ѧ�ż���ƽ���ɼ���

40��������004���γ̷���С��60���������������е�ͬѧѧ�ţ�

41��ɾ����002��ͬѧ�ġ�001���γ̵ĳɼ���































1�����д�����������
2����ѯ������γ̱ȡ������γ̳ɼ��ߵ�����ѧ����ѧ�ţ�
select A.student_id,sw,ty from (select student_id,number as sw from score left join course on score.corse_id = course.cid where course.cname = '����') as A left join (select student_id,number as ty from score left join course on score.corse_id = course.cid where course.cname = '����') as B on A.student_id = B.student_id where sw > if(isnull(ty),0,ty);

3����ѯƽ���ɼ�����60�ֵ�ͬѧ��ѧ�ź�ƽ���ɼ���

˼·��
��Ѱѧ����id���ͳɼ���Ȼ����avg���������ͬһid�ŵ�ѧ��ƽ���ɼ�������having���гɼ���ɸѡ
select student_id,avg(number) from score group by student_id having avg(number)>60;

������ʾѧ����
select student_id,student.sname,avg(number) from score left join student on score.student_id=student.sid group by student_id having avg(number)>60;

�ڶ���ʵ�ַ�ʽ
���˾������ַ�ʽ�����һЩ���﷨�ṹ��
��ͨ��select student_id,avg(number) as stu_num from score group by student_id�����齫����ȡ��������ʱ�����ΪSCORE��Ȼ���ں�student���������
select SCORE.student_id,SCORE.stu_num from (select student_id,avg(number) as stu_num from score group by student_id) as SCORE left join student on SCORE.student_id=student.sid;

4����ѯ����ͬѧ��ѧ�š�������ѡ�������ܳɼ���
���������̣�
��1���Ƚ�student���������������������student_id
select * from score left join student on score.student_id = student.sid;
��2����ͨ������ɸѡ�Լ���Ҫ��ʾ�����ݣ���limit����ҳ��ʾ
select score.student_id,student.sname,score.corse_id,score.number from score left join student on score.student_id = student.sid limit 5;
��3���þۺϺ���count��ͳ�ƿγ�������sum����ɼ��ĺϡ�
select score.student_id,student.sname,count(score.corse_id),sum(score.number) from score left join student on score.student_id = student.sid group by score.student_id limit 5; 
�ռ���
select score.student_id,student.sname,count(score.corse_id),sum(score.number) from score left join student on score.student_id = student.sid group by score.student_id;

5����ѯ�ա������ʦ�ĸ�����
select count(tname) from teacher where tname like "��%";

6����ѯûѧ����Ҷƽ����ʦ�ε�ͬѧ��ѧ�š�������
��1�������ƽ��ʦ���ܵĿ�
select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="��ƽ��ʦ";
��2�����ѡ����ƽ��ʦ���ε�ѧ��
select * from score where score.corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="��ƽ��ʦ")
��3���ų�ѡ����ƽ��ʦ���ε�ѧ��
select sid,sname from student where student.sid not in (select student_id from score where score.corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname="��ƽ��ʦ"));


7����ѯѧ����001������Ҳѧ����š�002���γ̵�ͬѧ��ѧ�š�������
��1��ȡ���γ�id��1��2�Ŀγ�
select * from score where corse_id=1 or corse_id=2;
��2��ͨ��student_id�����з������having������ѡ�����ŵ�ѧ��
select NEW_C.student_id,count(NEW_C.corse_id) as NUM from (select student_id,corse_id from score where corse_id=1 or corse_id=2) as NEW_C group by NEW_C.student_id having NUM=2;
��3������
select A.id,student.sname from (select NEW_C.student_id as ID,count(NEW_C.corse_id) as NUM from (select student_id,corse_id from score where corse_id=1 or corse_id=2) as NEW_C group by NEW_C.student_id having NUM=2) as A left join student on A.ID=student.sid;

8����ѯѧ����Ҷƽ����ʦ���̵����пε�ͬѧ��ѧ�š�������
��1�������ѯ�γ̺���ʦ�������˳���ƽ��ʦ
select cid,cname,teacher.tname from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='��ƽ��ʦ';
��2�����ѡ����ƽ��ʦ�γ̵�ѧ��id
select * from score where corse_id in (select cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='��ƽ��ʦ') group by student_id;
��3������ѧ������ʾ����
select A.student_id,student.sname from (select score.student_id from score where score.corse_id in (select course.cid from course left join teacher on course.teacher_id=teacher.tid where teacher.tname='��ƽ��ʦ') group by student_id) as A left join student on A.student_id=student.sid;

9����ѯ�γ̱�š�002���ĳɼ��ȿγ̱�š�001���γ̵͵�����ͬѧ��ѧ�š�������
select A.student_id,num_id1,num_id2 from (select student_id,number as num_id1 from score where corse_id=1) as A left join (select student_id,number as num_id2 from score where corse_id=2) as B on A.student_id = B.student_id where num_id1 > if(isnull(num_id2),0,num_id2);

10����ѯ�пγ̳ɼ�С��60�ֵ�ͬѧ��ѧ�š�������
select student.sid,student.sname from (select score.student_id from score where score.number <60 group by score.student_id) as A left join student on student.sid= A.student_id;

11����ѯû��ѧȫ���пε�ͬѧ��ѧ�š�������
select student.sid,student.sname from (select student_id,count(corse_id) as S_NUM from score group by student_id having S_NUM < (select count(cname) as C_NUM from course)) as A left join student on student.sid=A.student_id;

12����ѯ������һ�ſ���ѧ��Ϊ��001����ͬѧ��ѧ��ͬ��ͬѧ��ѧ�ź�������
��1����ѯѧ����ѡ�γ��Ƿ���ѧ��idΪ1��ѧ���Ŀγ�����
select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id;
��2����ѧ�������ȡ����ص�ID������
select student.sid,student.sname from (select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id) as A left join student on A.student_id=student.sid;

13����ѯ����ѧ��ѧ��Ϊ��001��ͬѧ��ѡ�γ�������һ�ſε�����ͬѧѧ�ź�������
select student.sid,student.sname from (select student_id from score where student_id !=1 and score.corse_id in(select corse_id from score where student_id = 1) group by student_id having count(corse_id)=(select count(corse_id) from score where student_id=1)) as A left join student on A.student_id=student.sid;

14����ѯ�͡�002���ŵ�ͬѧѧϰ�Ŀγ���ȫ��ͬ������ͬѧѧ�ź�������
(1)��002��ͬѧѡ��ĸ�����ͬ��ѧ��id
select student_id,count(student_id) from score group by student_id having count(student_id) = (select count(1) as a from score where student_id=2)
��2����ɸѡ��002��ͬѧѡ��γ�����ͬ��ѧ��id
select student_id,sname from score left join student on score.student_id = student.sid where student_id in (select student_id from score group by student_id having count(student_id) = (select count(1) as a from score where student_id=2)) and corse_id in (select corse_id from score where student_id =2) group by student_id having count(corse_id) = (select count(1) as a from score where student_id=2);


15��ɾ��ѧϰ��Ҷƽ����ʦ�ε�SC���¼��
delete from score where corse_id in (select cid from course left join teacher on course.teacher_id = teacher.tid where teacher.tname = "��ƽ��ʦ");

16����SC���в���һЩ��¼����Щ��¼Ҫ�����������������û���Ϲ���š�002���γ̵�ͬѧѧ�ţ��ڲ��롰002���ſγ̵�ƽ���ɼ���?
select student_id,2,(select avg(number) from score where corse_id =2) as a from score where student_id not in (select student_id from score where corse_id=2) group by student_id;

insert into score (student_id,corse_id,number) select student_id,2,(select avg(number) from score where corse_id =2) as a from score where student_id not in (select student_id from score where corse_id=2) group by student_id;

17����ƽ���ɼ��ӵ͵�����ʾ����ѧ���ġ����ġ�������ѧ������Ӣ����ŵĿγ̳ɼ�����������ʽ��ʾ�� ѧ��ID,����,��ѧ,Ӣ��,��Ч�γ���,��Чƽ���֣�

��һ��ʵ�ַ�ʽ
select SC.student_id,(select number from score where score.student_id = SC.student_id and corse_id = 1) as sw,(select number from score where score.student_id = SC.student_id and corse_id = 2) as wl,(select number from score where score.student_id = SC.student_id and corse_id = 3) as ty,(select number from score where score.student_id = SC.student_id and corse_id = 4) as ms,count(SC.corse_id),avg(SC.number) from score as SC group by SC.student_id order by avg(SC.number) desc;

�ڶ���ʵ�ַ�ʽ
select SC.student_id,(select number from score left join course on score.corse_id = course.cid where course.cname = "����" and score.student_id = SC.student_id) as sw,(select number from score left join course on score.corse_id = course.cid where course.cname = "����" and score.student_id = SC.student_id) as wl,(select number from score left join course on score.corse_id = course.cid where course.cname = "����" and score.student_id = SC.student_id) as ty,(select number from score left join course on score.corse_id = course.cid where course.cname = "����" and score.student_id = SC.student_id) as ms,count(SC.corse_id),avg(SC.number) from score as SC group by SC.student_id order by avg(SC.number) desc;


18����ѯ���Ƴɼ���ߺ���͵ķ֣���������ʽ��ʾ���γ�ID����߷֣���ͷ֣�
˼·��ͨ���γ�id�����з��飬���ʱ�����ʾ���У�Ȼ���þۺϺ���max��min���ҳ����ֵ����Сֵ��
select corse_id,max(number) as max_num,min(number) as min_num from score group by corse_id;

19��������ƽ���ɼ��ӵ͵��ߺͼ����ʵİٷ����Ӹߵ���˳��
��֪ʶ�㣺case when then�൱��if�ж�
select corse_id,avg(number),sum(case when score.number>60 then 1 else 0 end)/count(1)*100 as jgl from score group by corse_id;

20���γ�ƽ���ִӸߵ�����ʾ����ʵ�ο���ʦ����
select A.avg_num,course.cname,teacher.tname from (select avg(number) as avg_num,corse_id from score group by corse_id) as A left join course on course.cid = A.corse_id left join teacher on teacher.tid = course.teacher_id order by A.avg_num desc;

21����ѯ���Ƴɼ�ǰ�����ļ�¼:(�����ǳɼ��������)?
select score.sid,score.corse_id,score.number,T.first_num,T.second_num from score left join (select sid,(select number from score as s2 where s2.corse_id = s1.corse_id order by number desc limit 0,1) as first_num, (select number from score as s2 where s2.corse_id = s1.corse_id order by number desc limit 3,1) as second_num from score as s1) as T on score.sid =T.sid where score.number <= T.first_num and score.number >= T.second_num;

22����ѯÿ�ſγ̱�ѡ�޵�ѧ������
select corse_id,count(score.student_id) from score group by score.corse_id;

23����ѯ��ֻѡ����һ�ſγ̵�ȫ��ѧ����ѧ�ź�������
 select A.c_id,student.sname from (select count(corse_id) as c_id,student_id from score group by student_id) as A left join student on student.sid=A.student_id having A.c_id =1;

24����ѯ������Ů����������
select * from (select count(1) as M from student where gender="��") as A,(select count(1) as W from student where gender="Ů") as B;

25����ѯ�ա��š���ѧ��������
select sname from student where sname like "��%";

26����ѯͬ��ͬ��ѧ����������ͳ��ͬ��������
select count(sname) from student group by sname;

27����ѯÿ�ſγ̵�ƽ���ɼ��������ƽ���ɼ��������У�ƽ���ɼ���ͬʱ�����γ̺Ž������У�
 select corse_id,avg(number) from score group by corse_id order by avg(number) asc,corse_id desc;

28����ѯƽ���ɼ�����85������ѧ����ѧ�š�������ƽ���ɼ���
select A.student_id,student.sname,A.avg_num from (select avg(number) as avg_num,student_id from score group by student_id having avg_num > 80) as A left join student on student.sid = A.student_id;

29����ѯ�γ�����Ϊ����ѧ�����ҷ�������60��ѧ�������ͷ�����
select A.student_id,student.sname,A.number from (select student_id,number from score where corse_id=(select cid from course where cname="����") having number < 60) as A left join student on student.sid = A.student_id;

30����ѯ�γ̱��Ϊ003�ҿγ̳ɼ���80�����ϵ�ѧ����ѧ�ź�������
��һ��
select A.student_id,student.sname from (select student_id,number from score where corse_id=3 group by student_id having number > 80) as A left join student on student.sid=A.student_id;
�ڶ���
select * from score where score.student_id = 3 and score.num > 80

31����ѡ�˿γ̵�ѧ������
select count(A.student_id) from (select student_id from score group by student_id) as A;

32����ѯѡ�ޡ����ޡ���ʦ���ڿγ̵�ѧ���У��ɼ���ߵ�ѧ����������ɼ���
select score.corse_id,student.sname,score.number from score left join student on score.student_id=student.sid where score.corse_id in (select course.cid from course left join teacher on course.teacher_id=teacher.tid where tname = "��������ʦ") order by score.number desc limit 3;

33����ѯ�����γ̼���Ӧ��ѡ��������
��һ��
select A.c_num,course.cname from (select count(student_id) as c_num,corse_id from score where corse_id in (select cid from course) group by corse_id) as A left join course on course.cid =A.corse_id ;
�ڶ���
select course.cname,count(1) from score left join course on score.corse_id = course.cid group by corse_id;

34����ѯ��ͬ�γ̵��ɼ���ͬ��ѧ����ѧ�š��γ̺š�ѧ���ɼ���
select DISTINCT s1.corse_id,s2.corse_id,s1.number,s2.number from score as s1, score as s2 where s1.number = s2.number and s1.corse_id != s2.corse_id;

35����ѯÿ�ſγ̳ɼ���õ�ǰ������
select score.sid,score.corse_id,score.number,T.first_num,T.second_num from score left join (select sid,(select number from score as s2 where s2.corse_id=s1.corse_id order by number desc limit 0,1)as first_num, (select number from score as s2 where s2.corse_id=s1.corse_id order by number desc limit 1,1) as second_num from score as s1) as T on score.sid = T.sid where score.number <= T.first_num and score.number >= T.second_num;


36����������ѡ�����ſγ̵�ѧ��ѧ�ţ�
select student_id,count(corse_id) from score group by student_id having count(corse_id)>1

37����ѯȫ��ѧ����ѡ�޵Ŀγ̵Ŀγ̺źͿγ�����
select count(student_id) from score group by corse_id having count(student_id) = (select count(sid) from student);

38����ѯûѧ����Ҷƽ����ʦ���ڵ���һ�ſγ̵�ѧ��������
��һ��
select sname from(select A.student_id as n_s_id from (select student_id,corse_id from score) as A left join course on course.cid=A.corse_id where course.teacher_id not in (select tid from teacher where tname="��ƽ��ʦ") group by A.student_id ) as B left join student on student.sid=B.n_s_id;

�ڶ���
select student_id,student.sname from score left join student on score.student_id = student.sid where score.corse_id not in (select cid from course left join teacher on course.teacher_id = teacher.tid where tname = "��ƽ��ʦ") group by student_id;

39����ѯ�������ϲ�����γ̵�ͬѧ��ѧ�ż���ƽ���ɼ���
select avg(number) from score where student_id in (select student_id from score where number < 60 group by student_id having count(corse_id) >1);

40��������004���γ̷���С��60���������������е�ͬѧѧ�ţ�
select A.number,student.sname,student.sid from (select score.number,score.student_id from score where score.corse_id = 4 and score.number<60) as A left join student on student.sid = A.student_id order by A.number desc;

41��ɾ����002��ͬѧ�ġ�001���γ̵ĳɼ���
delete from score where corse_id = 1 and student_id = 2