*** Settings ***
#Library     SeleniumLibrary
Library     DatabaseLibrary
Library     OperatingSystem

Suite Setup     Connect To Database     pymysql     ${DBName}       ${DBUser}       ${DBPass}       ${DBHost}       ${DBPort}
Suite Teardown      Disconnect From Database


*** Variables ***
${DBName}       robotframework      #sakila
${DBUser}       root
${DBPass}       root
${DBHost}       localhost       #BSS-PC110
${DBPort}       3306


*** Test Cases ***
#Insert Data in person table

#        ${output} = Execute SQL String    Create table person(id integer,first_name varchar(20),last_name varchar(20));
#        Log To Console    ${output}
#        Should Be Equal As Strings    ${output}    None

#Creating a Table in Database
        #Execute Sql String    Create table person(id integer,first_name varchar(20),last_name varchar(20));

#Single record Entry in table
        #Execute Sql String    Insert into person values(101,"John","Bravo");

#Multiple records entry in table
        #Execute Sql Script    ..\\All_DD_Testing\\database_person.sql

Check David record present in Person Table
        Check If Exists In Database    select id from robotframework.person where first_name="David";

Check Abdullah record Not present in Person Table
        Check If Not Exists In Database    select id from robotframework.person where first_name="Abdullah";

Check Person table exists in my Database
        Table Must Exist    person

Verify Row Count is Zero
        Row Count Is 0    select * from robotframework.person where first_name = "Ali";

Verify Row Count is equal to some value
        Row Count Is Equal To X    select * from robotframework.person where first_name = "David";    1

Verify Row Count is Greater than some value
        Row Count Is Greater Than X    select * from robotframework.person where first_name = "David";    0

Verify Row Count is Less than some value
        Row Count Is Less Than X    select * from robotframework.person where first_name = "David";    2

Update record in Person table
        Execute Sql String    Update robotframework.person set first_name="Amir" where id=104;

Delete records from person table


Retrieve record from Person table
        #Query    select * from robotframework.person;
        @{queryResults}=        Query    select * from robotframework.person;
        Log To Console    many  @{queryResults}