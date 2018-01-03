--1.ѧ����
Student(S,Sname,Sage,Ssex) --S ѧ�����,Sname ѧ������,Sage ��������,Ssex ѧ���Ա�
--2.�γ̱� 
Course(C,Cname,T) --C --�γ̱��,Cname �γ�����,T ��ʦ���
--3.��ʦ�� 
Teacher(T,Tname) --T ��ʦ���,Tname ��ʦ����
--4.�ɼ��� 
SC(S,C,score) --S ѧ�����,C �γ̱��,score ����
*/
--������������
create table Student(Svarchar(10),Sname varchar(10),Sage datetime,Ssex nvarchar(10))
insert into Student values('01' , '����' , '1990-01-01' , '��')
insert into Student values('02' , 'Ǯ��' , '1990-12-21' , '��')
insert into Student values('03' , '���' , '1990-05-20' , '��')
insert into Student values('04' , '����' , '1990-08-06' , '��')
insert into Student values('05' , '��÷' , '1991-12-01' , 'Ů')
insert into Student values('06' , '����' , '1992-03-01' , 'Ů')
insert into Student values('07' , '֣��' , '1989-07-01' , 'Ů')
insert into Student values('08' , '����' , '1990-01-20' , 'Ů')
create table Course(Cvarchar(10),Cname,varchar(10),T varchar(10))
insert into Course values('01' , '����' , '02')
insert into Course values('02' , '��ѧ' , '01')
insert into Course values('03' , 'Ӣ��' , '03')
create table Teacher(T varchar(10),Tname,varchar(10))
insert into Teacher values('01' , '����')
insert into Teacher values('02' , '����')
insert into Teacher values('03' , '����')
create table SC(S varchar(10),Cvarchar(10),score decimal(18,1))
insert into SC values('01' , '01' , 80)
insert into SC values('01' , '02' , 90)
insert into SC values('01' , '03' , 99)
insert into SC values('02' , '01' , 70)
insert into SC values('02' , '02' , 60)
insert into SC values('02' , '03' , 80)
insert into SC values('03' , '01' , 80)
insert into SC values('03' , '02' , 80)
insert into SC values('03' , '03' , 80)
insert into SC values('04' , '01' , 50)
insert into SC values('04' , '02' , 30)
insert into SC values('04' , '03' , 20)
insert into SC values('05' , '01' , 76)
insert into SC values('05' , '02' , 87)
insert into SC values('06' , '01' , 31)
insert into SC values('06' , '03' , 34)
insert into SC values('07' , '02' , 89)
insert into SC values('07' , '03' , 98)


mysql...
--1����ѯ"01"�γ̱�"02"�γ̳ɼ��ߵ�ѧ������Ϣ���γ̷���

SELECT a.*,b.score AS'01����',c.scoreAS '02����'

FROM student a

INNER JOIN sc b

ON a.s=b.s AND b.c='01'

INNER JOIN sc c

ON a.s=c.s AND c.c='02'

WHERE b.score>c.score
--2����ѯ"01"�γ̱�"02"�γ̳ɼ��͵�ѧ������Ϣ���γ̷���
--3����ѯƽ���ɼ����ڵ���60�ֵ�ͬѧ��ѧ����ź�ѧ��������ƽ���ɼ�

SELECT a.s

       ,a.sname

       ,AVG(b.score) AS avgnum

FROM student a

INNER JOIN sc b

ON a.s=b.s

GROUP BY a.s

       ,a.sname

HAVING AVG(b.score)>60
--4����ѯƽ���ɼ�С��60�ֵ�ͬѧ��ѧ����ź�ѧ��������ƽ���ɼ�
--5����ѯ����ͬѧ��ѧ����š�ѧ��������ѡ�����������пγ̵��ܳɼ�

SELECT a.s

       ,a.sname

       ,COUNT(b.c)

       ,SUM(b.score)

FROM student a

LEFT JOIN sc b

ON a.s=b.s

GROUP BY 1,2
--6����ѯ"��"����ʦ������ 

SELECT COUNT(1) FROM teacherWHERE tname LIKE '��%'
--7����ѯѧ��"����"��ʦ�ڿε�ͬѧ����Ϣ 

SELECT a.*

FROM student a

INNER JOIN sc b

ON a.s=b.s

INNER JOIN course c

ON b.c=c.c

INNER JOIN teacher d

ON c.t=d.t

WHERE d.tname='����'

GROUP BY 1,2,3,4

--����2

SELECT a.*

FROM student a

LEFT JOIN (

       SELECT a.*

       FROM student a

       INNER JOIN sc b

       ON a.s=b.s

       INNER JOIN course c

       ON b.c=c.c

       INNER JOIN teacher d

       ON c.t=d.t

       WHERE d.tname='����'

       GROUP BY 1,2,3,4

)b

ON a.s=b.s

WHERE b.s IS NULL


--8����ѯûѧ��"����"��ʦ�ڿε�ͬѧ����Ϣ 

SELECT a.*

FROM student a

LEFT JOIN sc b

ON a.s=b.s

WHERE NOT EXISTS(

              SELECT *

              FROM course aa

              INNER JOIN teacher b

              ON aa.t=b.t

              INNER JOIN sc c

              ON aa.c=c.c

              WHERE b.tname='����'

              AND c.s=a.s

       )

GROUP BY 1,2,3,4
--9����ѯѧ�����Ϊ"01"����Ҳѧ�����Ϊ"02"�Ŀγ̵�ͬѧ����Ϣ

SELECT a.*

FROM student a

INNER JOIN sc b

ON a.s=b.s AND b.c='01'

INNER JOIN sc c

ON a.s=c.s AND c.c='02'
--10����ѯѧ�����Ϊ"01"����û��ѧ�����Ϊ"02"�Ŀγ̵�ͬѧ����Ϣ

select *

from student a

left join sc b

on a.s=b.s and b.c='01'

left join sc c

on a.s=c.s and c.c='02'

where b.c='01' and c.c is null
--11����ѯû��ѧȫ���пγ̵�ͬѧ����Ϣ 

SELECT a.*

FROM student a

LEFT JOIN sc b

ON a.s=b.s

LEFT JOIN (SELECT COUNT(1) anumFROM course) c

ON 1=1

GROUP BY 1,2,3,4

HAVING MAX(c.anum)>COUNT(b.c)
--12����ѯ������һ�ſ���ѧ��Ϊ"01"��ͬѧ��ѧ��ͬ��ͬѧ����Ϣ 

SELECT a.*

FROM student a

INNER JOIN sc b

ON a.s=b.s

WHERE EXISTS(

    SELECT 1 FROM sc WHERE s='01' AND c=b.c

)

GROUP BY 1,2,3,4
--13����ѯ��"01"�ŵ�ͬѧѧϰ�Ŀγ���ȫ��ͬ������ͬѧ����Ϣ 

SELECTa.s,a.sname,a.sage,a.ssex

FROM (SELECT a.*,COUNT(b.c) ASsnum

       FROM student a

       INNER JOIN sc b

       ON a.s=b.s

       WHERE EXISTS(

           SELECT 1 FROM scWHERE s='01' AND c=b.c

       )

       GROUP BY 1,2,3,4)a

INNER JOIN (SELECTa.*,COUNT(b.c) AS anum

       FROM student a

       INNER JOIN sc b

       ON a.s=b.s

       GROUP BY 1,2,3,4)b

ON a.s=b.s

INNER JOIN (SELECT COUNT(1) ASnum1 FROM sc WHERE s='01')c

ON 1=1

WHERE a.snum=b.anum ANDa.snum=c.num1

--������

 

 

SELECT a.*

       ,COUNT(b.c) AS anum

       ,SUM(CASE WHEN EXISTS(SELECT 1 FROM sc WHERE s='01' AND c=b.c)THEN 1 ELSE 0 END) AS snum

       ,MAX(c.num1) AS num1

FROM student a

INNER JOIN sc b

ON a.s=b.s

INNER JOIN (SELECT COUNT(1) ASnum1 FROM sc WHERE s='01')c

ON 1=1

GROUP BY 1,2,3,4

HAVING anum=snum AND anum=num1
--14����ѯûѧ��"����"��ʦ���ڵ���һ�ſγ̵�ѧ������ 

SELECT a.*

FROM student a

LEFT JOIN(

       SELECT a.s

       FROM student a

       LEFT JOIN sc b

       ON a.s=b.s

       LEFT JOIN course c

       ON b.c=c.c

       LEFT JOIN teacher d

       ON c.t=d.t AND d.tname='����'

       WHERE d.t IS NOT NULL

       )b

ON a.s=b.s

WHERE b.s IS NULL
--15����ѯ���ż������ϲ�����γ̵�ͬѧ��ѧ�ţ���������ƽ���ɼ� 

SELECT a.s

       ,a.sname

       ,AVG(b.score)

FROM student a

INNER JOIN sc b

ON a.s=b.s

GROUP BY 1,2

HAVING SUM(CASE WHENb.score>=60 THEN 0 ELSE 1 END)>=2
--16������"01"�γ̷���С��60���������������е�ѧ����Ϣ

SELECT a.*

       ,b.score

FROM student a

INNER JOIN sc b

ON a.s=b.s

WHERE

  b.c='01'

  AND b.score<60

ORDER BY b.score DESC
--17����ƽ���ɼ��Ӹߵ�����ʾ����ѧ�������пγ̵ĳɼ��Լ�ƽ���ɼ�

SELECT a.*

       ,SUM(CASE WHEN b.c='01' THEN b.scoreELSE 0 END) AS s01

       ,SUM(CASE WHEN b.c='02' THEN b.scoreELSE 0 END) AS s02

       ,SUM(CASE WHEN b.c='03' THEN b.score ELSE0 END) AS s03

       ,AVG(CASE WHEN b.score IS NULL THEN 0ELSE b.score END) avs

FROM student a

LEFT JOIN sc b

ON a.s=b.s

GROUP BY 1,2,3,4

ORDER BY avs DESC
--18����ѯ���Ƴɼ���߷֡���ͷֺ�ƽ���֣���������ʽ��ʾ���γ�ID���γ�name����߷֣���ͷ֣�ƽ���֣������ʣ��е��ʣ������ʣ�������
--����Ϊ>=60���е�Ϊ��70-80������Ϊ��80-90������Ϊ��>=90

SELECT a.c

       ,a.cname

       ,MAX(b.score)

       ,MIN(b.score)

       ,AVG(b.score)

       ,SUM(CASE WHEN b.score>=60 THEN 1ELSE 0 END)/COUNT(1)

       ,SUM(CASE WHEN b.score>=70 ANDb.score<80 THEN 1 ELSE 0 END)/COUNT(1)

       ,SUM(CASE WHEN b.score>=80 ANDb.score<90 THEN 1 ELSE 0 END)/COUNT(1)

       ,SUM(CASE WHEN b.score>=90 THEN 1ELSE 0 END)/COUNT(1)

FROM course a

INNER JOIN sc b

ON a.c=b.c

GROUP BY 1,2
--19�������Ƴɼ��������򣬲���ʾ����

SET @rn:=0;

SELECT a.*,@rn:=@rn+1

FROM(

    SELECT a.*,b.score

    FROM course a

    INNER JOIN sc b

    ON a.c=b.c

    WHERE a.c='01'

    ORDER BY b.c,score DESC

)a
--20����ѯѧ�����ܳɼ�����������

SELECT a.*

       ,COUNT(b.c)+1 asall

FROM sc a

LEFT JOIN sc b

ON a.c=b.c ANDa.score<b.score

GROUP BY 1,2,3

ORDER BY a.c,asall
--21����ѯ��ͬ��ʦ���̲�ͬ�γ�ƽ���ִӸߵ�����ʾ 

SELECT a.*

       ,b.cname

       ,AVG(c.score) ascore

FROM teacher a

INNER JOIN course b

ON a.t=b.t

INNER JOIN sc c

ON b.c=c.c

GROUP BY 1,2,3

ORDER BY ascore DESC
--22����ѯ���пγ̵ĳɼ���2������3����ѧ����Ϣ���ÿγ̳ɼ�

SELECT a.*,b.cname,b.score

FROM student a

INNER JOIN (

       SELECT a.*

              ,c.cname

              ,COUNT(b.c)+1 AStp

       FROM sc a

       LEFT JOIN sc b

       ON a.c=b.c AND a.score<b.score

       LEFT JOIN course c

       ON a.c=c.c

       GROUP BY 1,2,3,4

       HAVING COUNT(b.c)+1 IN(2,3)

       ORDER BY a.c,tp)b

ON a.s=b.s
--23��ͳ�Ƹ��Ƴɼ����������������γ̱��,�γ�����,[100-85],[85-70],[70-60],[0-60]����ռ�ٷֱ� 

SELECT a.c

       ,a.cname

       ,SUM(CASE WHEN b.score<=100 ANDb.score>85 THEN 1 ELSE 0 END) AS '[100-85]'

       ,SUM(CASE WHEN b.score<=85 ANDb.score>70 THEN 1 ELSE 0 END) AS '[85-70]'

       ,SUM(CASE WHEN b.score<=70 ANDb.score>60 THEN 1 ELSE 0 END) AS '[70-60]'

       ,SUM(CASE WHEN b.score<=60 ANDb.score>0 THEN 1 ELSE 0 END) AS '[60-0]'

      

       ,SUM(CASE WHEN b.score<=100 ANDb.score>85 THEN 1 ELSE 0 END)/COUNT(1) AS '[100-85]%'

       ,SUM(CASE WHEN b.score<=85 ANDb.score>70 THEN 1 ELSE 0 END)/COUNT(1) AS '[85-70]%'

       ,SUM(CASE WHEN b.score<=70 ANDb.score>60 THEN 1 ELSE 0 END)/COUNT(1) AS '[70-60]%'

       ,SUM(CASE WHEN b.score<=60 ANDb.score>0 THEN 1 ELSE 0 END)/COUNT(1) AS '[60-0]%'

FROM course a

INNER JOIN sc b

ON a.c=b.c

GROUP BY 1,2
--24����ѯѧ��ƽ���ɼ��������� 

SELECT a.*

       ,COUNT(b.s)+1

FROM (

       SELECT a.*,AVG(CASE WHEN b.score IS NULL THEN 0 ELSE b.scoreEND) AS ascore

       FROM student a

       LEFT JOIN sc b

       ON a.s=b.s

       GROUP BY 1,2,3,4

      )a

LEFT JOIN(

       SELECT a.*,AVG(CASE WHEN b.score IS NULL THEN 0 ELSE b.scoreEND) AS ascore

       FROM student a

       LEFT JOIN sc b

       ON a.s=b.s

       GROUP BY 1,2,3,4

      )b

ON a.ascore<b.ascore

GROUP BY 1,2,3,4,5
--25����ѯ���Ƴɼ�ǰ�����ļ�¼

SELECT a.*,COUNT(b.c)+1 ASascore

FROM sc a

LEFT JOIN sc b

ON a.c=b.c ANDa.score<b.score

GROUP BY 1,2,3

HAVING ascore<=3

ORDER BY a.c,ascore
--26����ѯÿ�ſγ̱�ѡ�޵�ѧ���� 

SELECT a.*

       ,COUNT(b.s)

FROM course a

LEFT JOIN sc b

ON a.c=b.c

GROUP BY 1,2,3
--27����ѯ��ֻ�����ſγ̵�ȫ��ѧ����ѧ�ź�����  

SELECT a.*

       ,COUNT(b.c)

FROM student a

LEFT JOIN sc b

ON a.s=b.s

GROUP BY 1,2,3,4

HAVING COUNT(b.c)=2
--28����ѯ������Ů������ 
--29����ѯ�����к���"��"�ֵ�ѧ����Ϣ
--30����ѯͬ��ͬ��ѧ����������ͳ��ͬ������

 SELECT sname

       ,ssex

       ,COUNT(1)

FROM student

GROUP BY 1,2

HAVING COUNT(1)>1
--31����ѯ1990�������ѧ������(ע��Student����Sage�е�������datetime) 

SELECT * FROM student WHEREYEAR(sage)=1990
--32����ѯÿ�ſγ̵�ƽ���ɼ��������ƽ���ɼ��������У�ƽ���ɼ���ͬʱ�����γ̱��

SELECT a.*

       ,AVG(b.score) ascore

FROM course a

LEFT JOIN sc b

ON a.c=b.c

GROUP BY 1,2,3

ORDER BYascore DESC,a.c

--33����ѯƽ���ɼ����ڵ���85������ѧ����ѧ�š�������ƽ���ɼ� 

SELECT a.*

       ,AVG(b.score) ascore

FROM student a

LEFT JOIN sc b

ON a.s=b.s

GROUP BY 1,2,3,4

HAVING ascore>=85
--34����ѯ�γ�����Ϊ"��ѧ"���ҷ�������60��ѧ�������ͷ��� 

SELECT c.*

FROM course a

LEFT JOIN sc b

ON a.c=b.c

LEFT JOIN student c

ON b.s=c.s

WHERE a.cname='��ѧ'

AND b.score<60
--35����ѯ����ѧ���Ŀγ̼���������� 

SELECT *

FROM sc a

INNER JOIN student b

ON a.s=b.s

INNER JOIN course c

ON a.c=c.c
--36����ѯ�κ�һ�ſγ̳ɼ���70�����ϵ��������γ����ƺͷ����� 

SELECT b.sname

       ,c.cname

       ,a.score

FROM sc a

INNER JOIN student b

ON a.s=b.s

INNER JOIN course c

ON a.c=c.c

WHERE a.score>70
--37����ѯ������Ŀγ�
--38����ѯ�γ̱��Ϊ01�ҿγ̳ɼ���80�����ϵ�ѧ����ѧ�ź������� 

SELECT a.*

FROM student a

INNER JOIN sc b

ON a.s=b.s

WHERE b.c='01' AND b.score>80
--39����ÿ�ſγ̵�ѧ������ 
--40����ѯѡ��"����"��ʦ���ڿγ̵�ѧ���У��ɼ���ߵ�ѧ����Ϣ����ɼ�

SELECT a.*,b.score

FROM student a

INNER JOIN sc b

ON a.s=b.s

INNER JOIN(

       SELECT c.c

              ,MAX(c.score) ASmaxscore

       FROM teacher a

       INNER JOIN course b

       ON a.t=b.t

       INNER JOIN sc c

       ON b.c=c.c

       WHERE a.tname='����'

       GROUP BY c)c

ON b.c=c.c ANDb.score=c.maxscore
--41����ѯ��ͬ�γ̳ɼ���ͬ��ѧ����ѧ����š��γ̱�š�ѧ���ɼ� 

SELECT a.s

       ,a.c

       ,a.score

FROM sc a

INNER JOIN (

       SELECT a.score

              ,b.s

              ,COUNT(1)

       FROM sc a

       INNER JOIN student b

       ON a.s=b.s

       GROUP BY a.score,b.s

       HAVING COUNT(1)>1

)b

ON a.s=b.s AND a.score=b.score

 

������

SELECT a.*

FROM sc a

LEFT JOIN sc b

ON a.s=b.s AND a.score=b.scoreAND a.c<>b.c

GROUP BY 1,2,3

HAVING COUNT(b.s)>0
--42����ѯÿ�Ź��ɼ���õ�ǰ���� 
--43��ͳ��ÿ�ſγ̵�ѧ��ѡ������������5�˵Ŀγ̲�ͳ�ƣ���Ҫ������γ̺ź�ѡ����������ѯ����������������У���������ͬ�����γ̺���������  

SELECT a.c

       ,COUNT(1) AS pnum

FROM sc a

GROUP BY 1

HAVING pnum>5

ORDER BY pnum DESC,a.c
--44����������ѡ�����ſγ̵�ѧ��ѧ�� 
--45����ѯѡ����ȫ���γ̵�ѧ����Ϣ 

--46����ѯ��ѧ��������

SELECT a.*,YEAR(CURDATE())-YEAR(a.sage)

FROM student a
--47����ѯ���ܹ����յ�ѧ��

SELECT a.*

FROM student a

WHERECONCAT(MONTH(a.sage),DAY(a.sage))>=CONCAT(MONTH(SUBDATE(CURDATE(),WEEKDAY(CURDATE()))),DAY(SUBDATE(CURDATE(),WEEKDAY(CURDATE()))))

AND CONCAT(MONTH(a.sage),DAY(a.sage))<=CONCAT(MONTH(SUBDATE(CURDATE(),WEEKDAY(CURDATE())-6)),DAY(SUBDATE(CURDATE(),WEEKDAY(CURDATE())-6)))


--48����ѯ���ܹ����յ�ѧ��


--49����ѯ���¹����յ�ѧ��

SELECT a.* FROM student a WHEREMONTH(a.sage)=MONTH(CURDATE())
--50����ѯ���¹����յ�ѧ��

SELECT a.*FROM student a WHERE MONTH(a.sage)=MONTH(CURDATE())+1