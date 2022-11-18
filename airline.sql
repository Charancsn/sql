create table Aircrafts( 

AcID int Primary Key, 

AcNumber varchar(32) NOT NULL,Capacity int NOT NULL,MfdBy varchar(128) NOT NULL, 

MfdOn Datetime NOT NULL); 

2.insert data into Aircraft 

insert into Aircrafts values(1,"as345",120,"air india","23 april 1998"); 

insert into Aircrafts values(2,"af375",130,"air india","26 july 1998"); 

insert into Aircrafts values(3,"ah675",140,"air india","2 may 1998"); 

2.Create Route Table 

create table Route( RtID int ,Airport varchar(32) NOT NULL,Destination varchar(16) NOT NULL, Rtcode varchar(16) NOT NULL UNIQUE, primary Key (RtID)); 

2.1 insert values into route 

insert into Route values(1,"vijayawada","chennai","VIJ-CHI"); 

3.Flight Schedule.  

create table flight_schedule(FiID int,flightdate DATETIME, 

                             Departure DATETIME, 

                             Arrival DATETIME, 

                             AirCraft int, 

                             NetFare int,PRIMARY KEY(FiID), 

                            CONSTRAINT fk_Aircraft FOREIGN KEY(Aircraft)REFERENCES Aircrafts(AcID)); 

3.1 inserting values 

insert into Flight_schedule values(1,"january 23,2013","23:20","1:20",1,1); 

4.Create discount table. 

create table Discount(DiID int PRIMARY KEY,Title varchar(32),Amount int,Description varchar(250)); 

4.1 inserting values. 

insert into Discount values(1,"children",10,"Discount is provide all children under age of 10"); 

5.charges table. 

create table charges(ChID int PRIMARY KEY,Title varchar(32),Amount int,Description varchar(260) ); 

5.1 inserting values. 

insert into Charges values(1,"urgent cancellation",33.33,"33.3% will be charged for cancellation for booking within 11 hours for Flight time"); 

6.state table. 

create table state(StID int, 

                   statename varchar(32), 

                   Primary Key(StID)); 

6.1  inserting values.. 

insert into State values(1,"tamilnadu"); 

7.Contact_details table.. 

create table Contact_Details(CnID int PRIMARY KEY, 

                            Email varchar(16) NOT NULL, 

                            Cell varchar(16) NOT NULL, 

                            Tel varchar(16),Street varchar(64), 

                            State int NOT NULL, 

                            CONSTRAINT fk_State FOREIGN KEY(State) REFERENCES State(StID)); 

7.1  inserting values.. 

insert into Contact_Details values(1,"v1@gmail.com","9737285","01-9823562","nagar road",1); 

8. Passengers table.. 

create table Passengers(PsID int PRIMARY KEY, 

                       Name varchar(32) NOT NULL, 

                       Address varchar(64) NOT NULL, 

                       Age int NOT NULL, 

                       Nationality varchar(16) NOT NULL, 

                       Contacts int NOT NULL, 

                       CONSTRAINT fk_Contacts FOREIGN KEY(Contacts)REFERENCES Contact_Details(CnID)); 

8.1   inserting values.... 

insert into Passengers values(1,"Tharak","nijamvoly colony",35,"indain",1); 

9..Transactions table.... 

create table Transactions(TsID int PRIMARY KEY, 

                         Booking_Date DATE, 

                         DepartureDate DATE, 

                         Passengers int, 

                         Flight int, 

                         charges int NULL, 

                         Discount int NULL, 

                         CONSTRAINT fk_Passengers FOREIGN KEY(Passengers)REFERENCES Passengers(PsID), 

                         CONSTRAINT fk_Flight FOREIGN KEY(Flight)REFERENCES Flight_Schedule(FiID), 

                         CONSTRAINT fk_charges FOREIGN KEY(charges)REFERENCES charges(ChID), 

                         CONSTRAINT fk_Discount FOREIGN KEY(Discount)REFERENCES Discount(DiID)); 

9.1  inserting values..... 

insert into Transactions values(1,"2022-05-04 01:02:00","2022-08-04 01:02:02",1,1,NULL,NULL); 
