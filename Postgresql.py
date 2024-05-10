(JUST IN case : / => frontslash, \ => backslash)

Check postgres version:
psql --version 

Connect to postgres: 
psql -U postgres 
(the postgres user is default superuser for the postgresSQL)

# or the above error showed any socket / Peer Authentication error; then use this;
sudo -u postgres psql

Create new user : 
psql -U postgres
CREATE USER <user_name> WITH SUPERUSER PASSWORD '<password>';

(Login with created user : psql -U <user_name> -d <database_name> )
Delete created user : DROP USER <user_name>

i.e. if your created user name is root; then you should log in by selecting any database if you don't specify any, the default database is the username itself (which should be created if not created).
Ex: psql -U root (will connect to root database) , but if root database is not created; then psql -U root won't log in.
OR, we can connect to other database already available in the system using -d flag.
Ex: psql -U root -d <already_made_db_name>

List all users in Database : 
\du
for more info use : \du+

List all databases : 
\l

Choose (Connect to) Database : 
\c database_name

Create Database : 
CREATE DATABASE database_name;

List Tables in the Current Database
\dt

Create a Table : 
CREATE TABLE table_name (
    column1 datatype1,
    column2 datatype2,
    ...
);
Ex: 
CREATE TABLE COMPANY(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
[Here, instead of char, varchar also is same;)

Describe a table: 
\d


Insert into Table : 
INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);


Select from Table : 
SELECT * FROM <table_name>

Drop the table : 
DROP TABLE <table_name>


Quit the application
\q
