create table Client_Category ( 
Client_ID	   int NOT NULL  ,    
Cat_ID	       Varchar(25) NOT NULL ,
Brokerage_Rate  int NOT NULL);

select * from user_constraints where table_name like 'STOCK%' OR 
table_name like 'CLIENT%' OR 
table_name like 'PROPOSAL%' OR
table_name like 'TRANS%' OR
table_name like '%CATEGORY%' OR
table_name like '%PROFIT%' OR
table_name like '%EVALUATION%' 
order by table_name ; 

select * from CLIENT_STRAT;

select * from STRATEGY_CATEGORY;

desc STOCK;
select * from user_constraints where table_name = 'PROPOSAL_STATUS';
desc PROFIT

insert into Client_Category values (01,'CI01', 1000) ;
insert into Client_Category values (01,'CI03', 1000) ;
insert into Client_Category values (02,'CI01', 1000) ;
insert into Client_Category values (02,'CI02', 1000) ;
insert into Client_Category values (03,'CI03', 1000) ;
insert into Client_Category values (03,'CI01', 1000) ;
insert into Client_Category values (04,'CI02', 1000) ;
insert into Client_Category values (04,'CI03', 1000) ;

select * from Client_Category;

Create table Client_(
Client_Id int PRIMARY KEY,
First_Name varchar(255) NOT NULL,
Last_Name varchar(255) NOT NULL,
Street varchar(255) NOT NULL,
Contact_Number varchar(10) NOT NULL,
SSN varchar(10) NOT NULL,
Email varchar(255) NOT NULL,
City varchar(50) NOT NULL,
State varchar(50) NOT NULL,
Zip_code varchar(25) NOT NULL);

create table STOCK (
Stock_Name varchar(20),
Ticker_symbol varchar(10) NOT NULL PRIMARY KEY,
Cat_Id varchar(15) NOT NULL,
Risk varchar(10),
Brand_value varchar(10),
Investment  varchar(10),
current_value int NOT NULL);

insert into STOCK values ('ICICI', 'ICI', 'CI01', 'High', 'Moderate', 'Low' , 2000);
insert into STOCK values ('BPL', 'BPL', 'CI01', 'Moderate', 'Low', 'Low' , 3000);
insert into STOCK values ('AGF', 'AGF', 'CI02', 'Low', 'High', 'Low' , 4000);
insert into STOCK values ('CVB', 'CVB', 'CI03', 'Moderate', 'Low', 'Low' , 5000);
insert into STOCK values ('AJH', 'AJH', 'CI03', 'low', 'Moderate', 'Low' , 1200);

select * from  STOCK;


create table STOCK_DECISION as SELECT * FROM STOCK inner join evaluation;

show user;

create table Stock_Parameter(
Ticker_Symbol varchar(10) PRIMARY KEY,
Cat_ID varchar(10) NOT NULL,
News int NOT NULL,
Dividends_Announced int NOT NULL,
Product_Release int NOT NULL,
New_Contract int NOT NULL,
Employee_Layoff int NOT NULL,
Takeover int NOT NULL,
Mgmt_Changes int NOT NULL,
Scandals int NOT NULL,
EPS int NOT NULL,
PE_ratio int NOT NULL,
Exchange_rate int NOT NULL);

insert into Stock_Parameter
values('ICI','CI01',4,6,6,12,10,14,17,15,5,7,4);

insert into Stock_Parameter
values('BPL','CI02',6,4,6,10,12,16,15,10,10,4,7);
insert into Stock_Parameter
values('AGF','CI02',4,6,6,12,10,14,17,15,5,7,4);
insert into Stock_Parameter
values('CVB','CI03',4,6,12,6,14,10,7,4,5,15,5);
insert into Stock_Parameter
values('AJH','CI03',6,4,6,5,7,4,17,15,12,10,14);

select * from Stock_Parameter;

select * from evaluation;

create table evaluation as
(select Ticker_Symbol,
case
when (News+Dividends_Announced+Product_Release+New_Contract+Employee_Layoff+Takeover+Mgmt_Changes+Scandals+EPS+PE_Ratio+Exchange_Rate) between 90 and 100  Then 'Extremely High'
when (News+Dividends_Announced+Product_Release+New_Contract+Employee_Layoff+Takeover+Mgmt_Changes+Scandals+EPS+PE_Ratio+Exchange_Rate) between 60 and 90  Then 'High'
when (News+Dividends_Announced+Product_Release+New_Contract+Employee_Layoff+Takeover+Mgmt_Changes+Scandals+EPS+PE_Ratio+Exchange_Rate) between 50 and 60 Then 'Moderate'
when (News+Dividends_Announced+Product_Release+New_Contract+Employee_Layoff+Takeover+Mgmt_Changes+Scandals+EPS+PE_Ratio+Exchange_Rate) between 10 and 50  Then 'Low'
Else 'Extremely Low'
end as Parameter_Value
from Stock_Parameter);

drop table evaluation;

create table evaluation as
(select Ticker_Symbol, (News+Dividends_Announced+Product_Release+New_Contract+Employee_Layoff+Takeover+Mgmt_Changes+Scandals+EPS+PE_Ratio+Exchange_Rate)as Parameter_Value
from Stock_Parameter);

create table Strategy_Category  (
Client_ID	   VARCHAR(10) NOT NULL  ,    
Cat_ID	       Varchar(10) NOT NULL ,    
Strategy_ID	   Varchar(10) NOT NULL ,     
Brand_Value	   Varchar(25) NOT NULL ,    
Investment	   Varchar(25) NOT NULL ,    
Parameter_Value int NOT NULL );

insert into Strategy_Category  values ('ID01','CI01', 'S01', 'Moderate', 'Low' ,30);
insert into Strategy_Category  values ('ID01','CI03', 'S02', 'High', 'Low',30);
insert into Strategy_Category  values ('ID02','CI01', 'S03', 'Low', 'Low' ,30);
insert into Strategy_Category  values ('ID02','CI02', 'S04', 'High', 'Low',50);
insert into Strategy_Category  values ('ID03','CI03', 'S05', 'Moderate', 'Low',60);
insert into Strategy_Category  values ('ID03','CI01', 'S06', 'Moderate', 'Low' ,40);
insert into Strategy_Category  values ('ID04','CI02', 'S07', 'High', 'Low',40);
insert into Strategy_Category  values ('ID04','CI03', 'S08', 'Low', 'Low' ,50);

create table Client_strat(
Strategy_ID varchar(5) NOT NULL,
Cat_ID	varchar(25) NOT NULL,
Brand_value varchar(25) NOT NULL,
Investment varchar(25) NOT NULL,
Parameter_Value int NOT NULL,
PRIMARY KEY (Strategy_ID)
);

insert into Client_strat values ('S01','CI01','Moderate','Low',30);
insert into Client_strat values ('S02','CI03','HIGH','Low',30);
insert into Client_strat values ('S03','CI01','Moderate','Low',30);
insert into Client_strat values ('S04','CI02','HIGH','Low',50);
insert into Client_strat values ('S05','CI03','Moderate','Low',60);

select * from Client_strat;

create table Category(
Cat_ID varchar(25) NOT NULL PRIMARY KEY,
Category_Name varchar(25) NOT NULL,
Brokerage_Rate  int NOT NULL);

insert into Category values ('CI01','Banking',1000);
insert into Category values ('CI02','Oil_and_Gas',1000);
insert into Category values ('CI03','Banking',1000);
insert into Category values ('CI04','Construction',1000);
insert into Category values ('CI05','Media',1000);

select * from category;

set @cnt = 0;

create table client_stock_match AS
(select 
--(@cnt := @cnt +1) Match_id, concat('M0', @cnt) AS MATCHID , 
C.CLient_ID, S.Cat_ID, St.Strategy_ID, S.* 
from STOCK_DECISION S 
inner join Client_Category C 
inner join Strategy_Category St
on S.Cat_ID = C.Cat_ID 
And C.CLient_ID = St.CLient_ID
and C.Cat_ID = St.Cat_ID
and S.Brand_Value = St.Brand_Value
and S.Investment = St.Investment
and S.Parameter_Value >= St.Parameter_Value
order by C.Cat_ID);

(select (@cnt := @cnt +1) Match_id, concat('M0', @cnt)as MATCHID,S.*, C.CLient_ID 
from STOCK_DE S 
inner join Client_Category C 
inner join Strategy_Category St
on S.Cat_ID = C.Cat_ID 
And C.CLient_ID = St.CLient_ID
and C.Cat_ID = St.Cat_ID
and S.Brand_Value = St.Brand_Value
and S.Investment = St.Investment
and S.Parameter_Value >= St.Parameter_Value
order by C.Cat_ID);


set @cnt = 0;
create table client_stock_match AS 
select concat('M0',rownum) as Match_ID,S.*,C.Client_ID, St.Strategy_ID from STOCK_DECISION S 
inner join Client_Category C 
on S.Cat_ID = C.Cat_ID 
inner join Strategy_Category St
on C.Client_ID = St.Client_ID
and C.Cat_ID = St.Cat_ID
and S.Brand_Value = St.Brand_Value
and S.Investment = St.Investment
and S.Parameter_Value >= St.Parameter_Value
order by Match_ID,C.Cat_ID;

select * from Client_Stock_Proposal;

Create table Client_Stock_Proposal as
select CC.Brokerage_Rate, CS.MATCH_ID, CS.Stock_Name, CS.Ticker_symbol, CS.Cat_Id, CS.Current_value, CS.Client_Id 
from client_stock_match CS inner join Client_Category CC 
on CC.Client_Id = CS.Client_Id and CS.Cat_Id = CC.Cat_Id;

select concat('T0',Rownum),;


create view KLPD as select C.match_id, C.ticker_symbol from Client_Stock_Proposal C;

alter view KLPD add column STATUS, NO_STOCKS values ();

drop table PROPOSAL_STATUS;

select * from USER_CONS_COLUMNS 
inner join 
where table_name like 'PROPOSAL%';

select * from Client_Stock_Proposal where table_name like 'PROPOSAL%';

create table PROPOSAL_STATUS (
TRANS_ID VARCHAR(10) PRIMARY KEY,
MATCH_ID VARCHAR(3),
client_id VARCHAR(5),
Ticker_symbol VARCHAR(3),
NOOFSTOCKS NUMBER(4) default 0 ,
STATUS VARCHAR(6),
TRANS_DATE DATE DEFAULT SYSDATE,
CONSTRAINT CHECK_STATUS CHECK (STATUS IN ('ACCEPT','REJECT') AND ((STATUS = 'ACCEPT' and NOOFSTOCKS > 0) OR (STATUS = 'REJECT' and NOOFSTOCKS = 0)))
);

insert into proposal_status values('T01','M01','CI01','ICI',5,'ACCEPT',SYSDATE);
insert into proposal_status values('T02','M02','CI02','BPL',0,'REJECT',SYSDATE);
insert into proposal_status values('T03','M03','CI03','AGF',4,'ACCEPT',SYSDATE);
insert into proposal_status values('T04','M04','CI04','AJH',6,'ACCEPT',SYSDATE);
insert into proposal_status values('T05','M05','CI05','ICI',0,'REJECT',SYSDATE);
insert into proposal_status values('T06','M06','CI06','AGF',0,'REJECT',SYSDATE);
insert into proposal_status values('T07','M07','CI07','CVB',1,'ACCEPT',SYSDATE);

update proposal_status SET TRANS_DATE =
CASE WHEN mod(TO_NUMBER(SUBSTR(TRANS_ID,2)),2)=0 Then SYSDATE
     ELSE TO_DATE('01-mar-19','dd-mon-yy')
END;

select * from proposal_status;

select mod(TO_NUMBER(SUBSTR(TRANS_ID,2)))
--mod(TO_NUMBER(SUBSTR(TRANS_ID,1,2)),2)
from proposal_status
alter table proposal_status add constraint ;

select * from proposal_status where NUMBER(SUBSTR(TRANS_ID,1,2)) %2 ==0;

create table test(id number);

insert into test values(10);

update test set id = &test_id where id in  &id ;

select * from test;

select * from client_stock_match;


create table TRANS_HEADER AS(
select p.TRANS_ID,c.client_id,c.Ticker_Symbol,c.Stock_Name,c.Cat_ID
from Client_Stock_Proposal c
inner join PROPOSAL_STATUS p
on p.MATCH_ID=c.MATCH_ID 
and p.STATUS='ACCEPT');

select * from TRANS_HEADER;

create table TRANS_DETAIL AS
select p.TRANS_ID,c.Ticker_Symbol,c.Stock_Name,c.Cat_ID,p.NOOFSTOCKS,c.current_value,c.brokerage_rate,p.TRANS_DATE
from Client_Stock_Proposal c
inner join PROPOSAL_STATUS p
on p.MATCH_ID=c.MATCH_ID 
inner join TRANS_HEADER t
on t.client_id = c.client_id
and p.STATUS='ACCEPT';


create table TRANS_DELETION AS
select p.TRANS_ID,p.MATCH_ID,c.client_id,c.Ticker_Symbol,c.Stock_Name,p.TRANS_DATE
from Client_Stock_Proposal c
inner join PROPOSAL_STATUS p
on p.MATCH_ID = c.MATCH_ID 
and p.STATUS='REJECT';


create table PROFIT as
select concat('P0',rownum) as Profit_ID,c.client_id,c.Ticker_Symbol,c.Stock_Name,p.TRANS_ID,c.Brokerage_rate,p.noofstocks,c.Brokerage_rate*p.noofstocks as Profit_Amount
from Client_Stock_Proposal c
inner join PROPOSAL_STATUS p
on p.MATCH_ID = c.MATCH_ID ;

select * from PROFIT;

commit;

desc PROPOSAL_STATUS;

select * from user_constraints;
select US.CONSTRAINT_TYPE,C.* from USER_CONS_COLUMNS C
inner join user_constraints US
on US.TABLE_NAME = C.TABLE_NAME
where C.table_name like 'TRANS_HEADER' and 
US.CONSTRAINT_TYPE = 'P';

select * from dba_segments;

select * from ALL_CONSTRAINTS where ;

Find out the database size, memory size, location of files and version of your database.
select * from dba_data_files;

select sum(bytes)/1024/1024 as Size_MB from dba_segments;
group  by owner;

select dd.TABLESPACE_NAME "Tablspace",  
 dd.FILE_NAME "Filename",  
 dd.BYTES/1024/1024 "Size MB", 
 dd.MAXBYTES/1024/1024 "Maximum Size MB", 
 dd.AUTOEXTENSIBLE "Autoextensible" 
from SYS.DBA_DATA_FILES dd;

select * from v$sga;

select FILE_NAME "Filename" from SYS.DBA_DATA_FILES ;

select sum(BYTES/1024/1024) "Size MB" from SYS.DBA_DATA_FILES;

SELECT * FROM PROPOSAL_STATUS;




select max(value)/1024/1024 as c1
from dba_hist_osstat
where stat_name='PHYSICAL_MEMORY_BYTES';









select * from user_tables;

select * from V$VERSION ;

select sum(bytes)/1024/1024 size_in_mb from dba_data_files;

merge into student a 
  using 
  (select id, name, score 
  from New_student) b 
  on (a.id = b.id) 
  when matched then 
  update set a.name = b.name 
  , a.score = b.score 
  delete where a.score < 640 
  when not matched then 
  insert (a.id, a.name, a.score) 
  values (b.id, b.name, b.score);
  
  
  
  select * from Category;

select * from Client_Category;

select * from stock_b;

create table stock_b as select * from stock where Ticker_symbol = 'ICI';

delete from stock_b where Ticker_symbol = 'ICI';

select * from stock_decision;

insert into stock_b values ('ISI', 'ICI', 'CI01', 'High', 'Moderate', 'Low' , 1800);
insert into stock_b values ('CPL', 'BPL', 'CI01', 'Moderate', 'Low', 'Low' , 3000);
insert into stock_b values ('BGF', 'BGF', 'CI02', 'Low', 'High', 'Low' , 4000);
insert into stock_b values ('CUB', 'CUB', 'CI03', 'Moderate', 'Low', 'Low' , 5000);
insert into stock_b values ('ATH', 'ATH', 'CI03', 'low', 'Moderate', 'Low' , 1200);
