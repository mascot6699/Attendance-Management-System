insert into login values ('admin','admin','Administrator');
insert into login values ('user1','12345','Teacher');
insert into login values ('user2','12345','Teacher');
insert into login values ('user3','12345','Teacher');
insert into login values ('umang','umang','Teacher');

insert into teacher values (1,'Ashish','user1');
insert into teacher values (2,'Pranay','user2');
insert into teacher values (3,'Krishnan','user3');
insert into teacher values (4,'Umang','umang');


insert into subject values(101,'Data Structures');
insert into subject values(102,'Operating Systems');
insert into subject values(103,'Database Management');
insert into subject values(104,'Unix Programming');
insert into subject values(105,'System Softwares');
insert into subject values(106,'Environment & Health');
insert into subject values(107,'Wireless Networks');



insert into teaches values(1,101);
insert into teaches values(1,103);
insert into teaches values(2,102);
insert into teaches values(2,103);
insert into teaches values(3,101);
insert into teaches values(4,102);



insert into student values(1,'Arvind Kejriwal','Computer','Third',101);
insert into student values(1,'Arvind Kejriwal','Computer','Third',102);
insert into student values(2,'Vikas Singh','Computer','Fourth',102);
insert into student values(2,'Vikas Singh','Computer','Fourth',103);
insert into student values(4,'asavsv ','Computer','Fourth',103);


insert into attendence values(TO_DATE('2014-01-01', 'yyyy-mm-dd'),'Present',1,101);
insert into attendence values(TO_DATE('2014-01-02', 'yyyy-mm-dd'),'Present',1,101);
insert into attendence values(TO_DATE('2014-01-03', 'yyyy-mm-dd'),'Present',1,101);
insert into attendence values(TO_DATE('2014-01-04', 'yyyy-mm-dd'),'Present',1,101);
insert into attendence values(TO_DATE('2014-01-05', 'yyyy-mm-dd'),'Present',1,101);
insert into attendence values(TO_DATE('2014-01-01', 'yyyy-mm-dd'),'Present',1,102);
insert into attendence values(TO_DATE('2014-01-02', 'yyyy-mm-dd'),'Present',1,102);
insert into attendence values(TO_DATE('2014-01-03', 'yyyy-mm-dd'),'Absent',1,102);
insert into attendence values(TO_DATE('2014-01-04', 'yyyy-mm-dd'),'Absent',1,102);
insert into attendence values(TO_DATE('2014-01-05', 'yyyy-mm-dd'),'Absent',1,102);
insert into attendence values(TO_DATE('2014-01-01', 'yyyy-mm-dd'),'Present',2,102);
insert into attendence values(TO_DATE('2014-01-02', 'yyyy-mm-dd'),'Present',2,102);
insert into attendence values(TO_DATE('2014-01-03', 'yyyy-mm-dd'),'Present',2,102);
insert into attendence values(TO_DATE('2014-01-04', 'yyyy-mm-dd'),'Present',2,102);
insert into attendence values(TO_DATE('2014-01-05', 'yyyy-mm-dd'),'Present',2,102);