ERD RELATIONSHIPS -

Employee to Office personnel: Employee may have min 0 (other employees act as office) and max many Office personnel
Office personnel to Employee: If there are Office personnel, must have min 1 and may have max many Employee(s)

Employee to Salesperson: Employees can have min 1 and max many Salesperson(s)
Salesperson to Employee: Salesperson can have min 1 Employee and max many employees

Employee to Mechanic: Employees can have min 1 and max many Mechanic(s)
Mechanic to Employee: Mechanic can have min 1 Employee and max many employees

-- I see that Employee relationships with Salespersons and Mechanics are many to many both ways, but I cannot see how to create nor the need for an in-between table.

Salesperson to Sales Receipt: Salesperson must have min 1 and max many Sales Receipt(s)
Sales Receipt to Salesperson: Sales Receipt must have min 1 and max only 1 Salesperson

Mechanic to Service Receipt: Mechanic must have min 1 and may have max many Service Receipt(s)
Service Receipt to Mechanic: Service Receipt must have min 1 and max only 1 Mechanic

Customer to Sales Receipt: Customer must have min 1 and may have max many Sales Receipt(s)
Sales Receipt to Customer: Sales Receipt must have min 1 and max 1 Customer per receipt

Customer to Service Receipt: Customer may have min 0 and max many Service Receipt(s)
Service Receipt to Customer: Service Receipt must have min 1 and max 1 Customer per receipt

Vehicle to Sales Receipt: Vehicle may have min 0 and max 1 Sales Receipt(s)
Sales Receipt to Vehicle: Sales Receipt must have min 1 and max 1 Vehicle per receipt

Vehicle to Service Receipt: Vehicle may have min 0 and max many Service Receipt(s)
Service Receipt to Customer: Service Receipt must have min 1 and max 1 Vehicle per receipt

Services to Service Receipt: Services may have min 0 and max many Service Receipt(s)
Service Receipt to Services: Service Receipt must have min 1 and may have max many Services per receipt

*******************************************

Multiple sql files were used and specifically named to separate sections.

Start with "Coding Nannah's Elite Dealership" for the setup.

*******************************************

TABLE setup -
-- fixed errors INTEGER(5): INTEGER cannot take in a number 

-- fixed error: changed level to position; address to "address"; state to "state"

-- fixed Table title error: Office Personnel to Office_personnel

-- fixed missing FOREIGN KEYS! 

-- tried moving FOREIGN KEY inside the FOREIGN KEY instead of at the end;

-- moving FOREIGN KEY does not work - moved them back to the end

-- renamed total_sales_price to total_sale

-- SQL did not accept service_name, changed to services_name and rest of service to services

-- changed total_service_price to total_services

*******************************************

Adding Data -

-- created one file, then split them into: Insert Customers, Insert Employees, Insert Services, Insert Vehicles

-- figured out & fixed: why I had to double send data; I thought .sql was in correct folder AND connected to the PostgreSQL file, but one or the other was not connected correctly.

--fixed error: forgot that data additions do not require VARCHAR, etc. info

-- date error: does not work as October 11, 1976 nor 1976-10-11

-- must wrap the date in quotes (https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-date/)

-- verified unique phone & email for employees

-- verified unique phone & email for customers

-- corrected emails for customer_id 5 and customer_id 8

-- verifying unique phone numbers for employees AND customers - convoluted mess! Joins returning No data

-- need people info (emails, phone numbers, etc.): creating BRIDGE TABLE! People

-- learning to navigate requests for info from a bridge table

-- help from https://www.postgresql.org/docs/8.3/tutorial-join.html

-- This one worked:
SELECT employee.employee_id, customer.customer_id, employee.phone AS e_phone, customer.phone AS c_phone
FROM employee, customer
WHERE employee.phone = customer.phone
GROUP BY employee.employee_id, customer.customer_id;

-- found & corrected one duplicate phone number (555-435-1985) held by employee_id 15 & customer_id 10 by creating customer id 10 new phone (555-515-1985)

-- help with car colors: https://www.automotivetouchup.com/touch-up-paint/

-- DeLorean color: https://duckduckgo.com/?q=1982+DeLorean+DMC-12+official+colors&ia=extensionpromo

-- decided to add columns current_employee and note to employee

-- decided to add column note to customer

-- forgot to set defaults for new columns; did that 

*******************************************

Adding Functions & Procedures -

-- started with one file, then separated Functions from Procedures

*******************************************
Procedures:

Reminders to self:
-- do not name parameters same as columns!
-- for procedures:
    UPDATE is the table of the data that's changing; 
    SET is the column of data in the table that's changing

I could not get the following to work. I suspect I need a function for this task or to understand better how to make Procedures work for a variety of scenarios. Perhaps Procedures only work with INTEGERS and other numerics?

Scenario I attempted:
-- fix sold situation for a customer's car that was never part of our inventory:
parameters needed: vehicle id, vehicle sold fix to YES, customer id

-- researched SQL IF statement for possible help: 
    https://www.postgresqltutorial.com/postgresql-plpgsql/plpgsql-if-else-statements/

    https://blog.udemy.com/sql-if-then/

*******************************************

Functions:
-- create add_employee and add_customer

Add employee created mismatching issues when I used only a few parameters. I deleted the created employee, added the remaining parameters, and reran the Function.

-- add customer, especially with ability to add one who did not purchase a vehicle from us, but wants to use our services department

Decided to create a remove_employee/ nolonger_employed, etc. for Zig and Chewie. Received a "function not unique error". Research states that's due to creating more than one function with the same name. Not sure how that's possible with the Create or Replace starter.
    -- stackoverflow recommends:
    SELECT oid:: regprocedure
    FROM pg_proc
    WHERE proname = 'former employee';

    that was supposed to find the copies to be able to remove them; result: no data

-- decided to use the search and replace substring instead of a built-in callable function for this purpose:

Up





