create table STOCK_DE (
Parameter_Value int NOT NULL,
Stock_Name varchar(20),
Ticker_symbol varchar(10) NOT NULL PRIMARY KEY,
Cat_Id varchar(15) NOT NULL,
Risk varchar(10),
Brand_value varchar(10),
Investment  varchar(10),
current_value int NOT NULL);

insert into STOCK_DE values (30, 'ICICI', 'ICI', 'CI01', 'High', 'Moderate', 'Low' , 2000);

create table Strategy_Category (
Client_ID	   int NOT NULL  ,    
Cat_ID	       Varchar(25) NOT NULL ,    
Strategy_ID	   Varchar(25) NOT NULL ,     
Brand_Value	   Varchar(25) NOT NULL ,    
Investment	   Varchar(25) NOT NULL ,    
Parameter_Value Varchar(25) NOT NULL );

create table Client_Category ( 
Client_ID	   int NOT NULL  ,    
Cat_ID	       Varchar(25) NOT NULL ,
Brokerage_Rate  int NOT NULL);

drop table Strategy_Category;

create table Strategy_Category (
Client_ID	   int NOT NULL  ,    
Cat_ID	       Varchar(25) NOT NULL ,    
Strategy_ID	   Varchar(25) NOT NULL ,     
Brand_Value	   Varchar(25) NOT NULL ,    
Investment	   Varchar(25) NOT NULL ,    
Parameter_Value int NOT NULL );

commit;

insert into STOCK_DE values (30, 'ICICI', 'ICI', 'CI01', 'High', 'Moderate', 'Low' , 2000);
insert into STOCK_DE values (40, 'BPL', 'BPL', 'CI01', 'Moderate', 'Low', 'Low' , 3000);
insert into STOCK_DE values (50, 'AGF', 'AGF', 'CI02', 'Low', 'High', 'Low' , 4000);
insert into STOCK_DE values (60, 'CVB', 'CVB', 'CI03', 'Moderate', 'Low', 'Low' , 5000);
insert into STOCK_DE values (70, 'AJH', 'AJH', 'CI03', 'low', 'Moderate', 'Low' , 1200);

insert into Strategy_Category values (01,'CI01', 'S01', 'Moderate', 'Low' ,30);
insert into Strategy_Category values (01,'CI03', 'S02', 'High', 'Low',30);
insert into Strategy_Category values (02,'CI01', 'S03', 'Low', 'Low' ,30);
insert into Strategy_Category values (02,'CI02', 'S04', 'High', 'Low',50);
insert into Strategy_Category values (03,'CI03', 'S05', 'Moderate', 'Low',60);
insert into Strategy_Category values (03,'CI01', 'S06', 'Moderate', 'Low' ,40);
insert into Strategy_Category values (04,'CI02', 'S07', 'High', 'Low',40);
insert into Strategy_Category values (04,'CI03', 'S08', 'Low', 'Low' ,50);

insert into Client_Category values (01,'CI01', 1000) ;
insert into Client_Category values (01,'CI03', 1000) ;
insert into Client_Category values (02,'CI01', 1000) ;
insert into Client_Category values (02,'CI02', 1000) ;
insert into Client_Category values (03,'CI03', 1000) ;
insert into Client_Category values (03,'CI01', 1000) ;
insert into Client_Category values (04,'CI02', 1000) ;
insert into Client_Category values (04,'CI03', 1000) ;

commit;

set @cnt = 0;
select (@cnt := @cnt +1) Match_id, concat('M0', @cnt) AS MATCHID , C.CLient_ID, S.Cat_ID, St.Strategy_ID, S.* 
from STOCK_DE S 
inner join Client_Category C 
inner join Strategy_Category St
on S.Cat_ID = C.Cat_ID 
And C.CLient_ID = St.CLient_ID
and C.Cat_ID = St.Cat_ID
and S.Brand_Value = St.Brand_Value
and S.Investment = St.Investment
and S.Parameter_Value >= St.Parameter_Value
order by C.Cat_ID;

select * from STOCK_DE S 
inner join Client_Category C
on S.Cat_ID = C.Cat_ID 
order by C.Cat_ID;
