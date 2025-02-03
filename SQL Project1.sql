show databases;
use db_oct;

# SELECT STATEMENT-
select * from listoforders;

# WHERE CLAUSE
   # Using AND OR NOT -
select * from listoforders;
select * from listoforders where OrderID > 'B-25601';
select * from listoforders where OrderID <= 'B-25601' and State = 'Rajastan';
select * from listoforders where OrderDate = '03-04-2018' or CustomerName = 'Jahan';
select * from listoforders where not CustomerName = 'Bharat' ;

   # Using IN and NOT IN -
select * from listoforders;
select * from listoforders where State IN ( 'Gujarat','West Bengal');
select * from listoforders where OrderID  NOt IN ('B-25667','B-25673') ;

    # Using BETWEEN and NOT BETWEEN -
select * from listoforders where OrderID between 'B-25699' and 'Goa' ;  
select * from listoforders where State  Not between 'Haryana' and  '23-04-2018';
    
	# Using LIKE -
select * from listoforders where CustomerName like '_a%';  
select * from listoforders where State like '%n';
select * from listoforders where City not like  '%n';

	# IS NULL and IS NOT NULL-
select * from listoforders where OrderID IS Null; 
select * from listoforders where OrderDate IS NOT Null; 


# COUNT-
select count(*) from  listoforders;
select count(8) from  listoforders;
select count(CustomerName) from listoforders;


# DISTINCT Keyword -
select distinct  State from listoforders;
select count(distinct OrderId) from listoforders;


# DELETE, TRUNCATE, DROP -
select * from listoforders;
delete from listoforders;
truncate table emp_ai;


# ALTER TABLE-
select * from listoforders;
alter table listoforders add column pincode int;
alter table listoforders drop column pincode;
alter table listoforders MODIFY column City varchar(25) ;
alter table listoforders rename column CustomerName to CName;


 
# UPDATE STATEMENT-
set SQL_SAFE_UPDATES=0;
#update listoforders set city= "sangavi"; 


# LIMIT CLAUSE-
select * from listoforders limit 6 ;
select * from listoforders limit 12,26;


# ORDERBY CLAUSE-
select * from listoforders order by OrderId ;
select * from listoforders order by OrderId DESC ;



# ARITHEMATC OPERATIONS -
select * from orderdetails;
select min(Profit) from orderdetails;
select max(Quantity) from orderdetails;
select count(Profit) from orderdetails;
select avg(Quantity) from orderdetails;
select sum(Profit) from orderdetails;



#JOIN CLAUSE-
select * from salestarget;
select * from orderdetails;

   # 1. Inner Join-
		select * from salestarget inner join orderdetails
        on salestarget.did = orderdetails.Category;
        
        select MonthofOrderdate,Target from salestarget inner join orderdetails
        on salestarget.did = orderdetails.Category;
        
        
	# 2. Left Join-
		 select * from salestarget left join orderdetails
         on salestarget.did = orderdetails.Category;
         
     # 3. Right Join-
		 select * from salestarget right join orderdetails
         on salestarget.Category = orderdetails.Category;    
        
	 # 4. Full Outer Join/ Full Join-
		  select Category from salestarget full outer join orderdetails
          on salestarget.Category = orderdetails.Category;
         
	 # 5. Cross Join-
		  select * from salestarget cross join orderdetails
            
		  select count(*) from salestarget cross join orderdetails
            
        
	   # 6. Self join
		    select * from emp_data;

		    select * from emp_data e INNER JOIN emp_data f
			on e.empid = f.mgr_id;

        

# UNION -
select Category from salestarget
union
select Category from orderdetails;

# UNION ALL -
select Category from salestarget
union all
select Category from orderdetails;





# CONSTRAINTS- 
select * from listoforders1;
      # 1. Not null-
                     create table listoforders_Notnull1 (Orderno int not null , Name varchar(10));
                     select * from listoforders_Notnull ;
                     desc listoforders_Notnull ; 
                      
					 insert into listoforders_Notnull1  values( '1001','Saurabh');
                     insert into listoforders_Notnull1  values( '1002','Sakshi');
                     desc listoforders_Notnull ; 
                     
                     select * from listoforders1;
                     desc listoforders1;
                     alter table listoforders1 modify OrderId int not null ;
                     
		# 2. Unique - 
                      create table emp_uniq(empid int UNIQUE,fname varchar(10));
                      select * from emp_uniq;
                      desc emp_uniq;
                      insert into emp_uniq values(1001,'Rakesh');
					  insert into emp_uniq values(1002,'Rakesh');
                      insert into emp_uniq values(1001,'Suraj'); # Not added
                     
                     
                     select * from emp_2;
                     desc emp_2;
					 alter table emp_2 add constraint my_uniq UNIQUE(Sal);
                     alter table emp_2 add constraint my_uniq UNIQUE(emid);
                     alter table emp_2 add constraint my_uniq1 UNIQUE(fn);
                     
                     
		 # 3. CHECK- 
                    create table emp_chk(empid int,fname varchar(10), CHECK(empid<1010));
					insert into emp_chk values(1001,'Rakesh');
					select * from emp_chk;
                    insert into emp_chk values(1009,'Rakesh');
                    insert into emp_chk values(1011,'Rakesh');  # not added

					select * from emp_2;
					desc emp_2;
                    alter table emp_2 add constraint my_chk CHECK(empid>105);
                    alter table emp_2 add constraint my_chk CHECK(empid>100);


          # 4. Primary key constraint-
                     create table emp_pri(empid int PRIMARY KEY,fname varchar(10));
                     select * from emp_pri;
                     desc emp_pri;
                     insert into emp_pri values(1001,'Rakesh');
                     insert into emp_pri values(1001,'Rakesh'); # not inserted
					 insert into emp_pri values(1002,'Rakesh');
                     insert into emp_pri (fname) values('Rohit'); # not inserted
					 insert into emp_pri (empid) values(1003);
            
                     select * from emp_2;
					 desc emp_2;
                     alter table emp_2 add constraint my_pk primary key(fn);
                     alter table emp_2 add constraint my_pk primary key(ln); # primary key
                     alter table emp_2 add constraint my_pk primary key(did);
                     
                     
			# 5.Default constraint-
                     create table emp_def (empid int DEFAULT 1005,fname varchar(10));
					 select * from emp_def;
                     desc emp_def;
                     insert into emp_def values(1001,'Rakesh');
                     insert into emp_def (fname) value('Rohit');

                     alter table emp_def alter empid set default 1001;
					 insert into emp_def (fname) values('Rohit');
					 insert into emp_def values(1002,'Rakesh');
                     desc emp_def;
                     
                     
			# 6.Drop constraint-
                     alter table emp_2 DROP CONSTRAINT my_chk;


			# 7.Auto increment-
                    create table emp_AI (empid int AUTO_INCREMENT PRIMARY KEY,fname varchar(10));
                    select * from emp_AI;
                    insert into emp_AI values(1001,'Rakesh');
                    insert into emp_AI (fname) values ('Rohit');

                    alter table emp_AI AUTO_INCREMENT=1005;
                    insert into emp_AI (fname) values ('Rohit'); # 1005, Rohit
                    insert into emp_AI (fname) values ('Rohit'); # 1006, Rohit

					create table emp_AI1 (empid int AUTO_INCREMENT PRIMARY KEY,fname varchar(10));
                    select * from emp_AI1;
					insert into emp_AI1 (fname) values ('Rohit');
                    insert into emp_AI1 (fname) values ('Rohit');


			# 8.Foreign key-
					create table student (Rollno int PRIMARY KEY, name varchar(10));    # parent/referenced table
                      
					create table course  (crs_id int PRIMARY KEY,crs_name varchar(15),Rollno int,foreign key(Rollno) references student(Rollno));
                     # # child table/referencing table  


                     select * from student;  # Parent
					 select * from course;   # Child
                     desc student;
                     desc course;

                     insert into course values (10,'DS',1001);
                     insert into student values(1001,'Sachin');
                     insert into course values (10,'DS',1001);
                     insert into course values (11,'Python',1002);
					 insert into student values(1002,'Rajesh');
                     insert into course values (11,'Python',1002);
                     insert into course values (12,'Python',1003);
