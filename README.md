-- Elephant SQL Original Code for 'homework' folder: postgres://mwrfuqvg:kF3LGUi9i6b43uf3DWL7tc0nh3SxP2PM@heffalump.db.elephantsql.com/mwrfuqvg
-- Elephant SQL Current Code for 'Coding Nannah Dealership Folder': postgres://pdtwndag:J5pm510LWq9KZkmqIRtNewc7Ndsk92uf@heffalump.db.elephantsql.com/pdtwndag 

++++++++++++++++++++++++++++++++++++++++++++++++++++
This is the README file for the Coding Nannah Dealership folder.
++++++++++++++++++++++++++++++++++++++++++++++++++++

ERD:
My submitted ERD reflects the more detailed project that spent two days creating before irreperably breaking it with a rogue function. I included those files under the homework folder. I'm still hoping to complete at least 2 of the 7 projects I have outstanding, so I did not redo the ERD.

ERD RELATIONSHIPS (from original README file):
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

******************************************************************
NOT INCLUDED THIS TIME: 
Since I am not calculating wages, I have removed the separate tables for office employees, mechanics, and salespeople. 

The tax table is gone. 

The comparisons and info gathering between customers and employees is null, so the People table I created while working on the last iteration is also gone.

SPACING:
I like spacing, so I can see what I'm doing. Shift + alt + f worsens the situation, rather than making it better. I am still dealing with my beautifully separated code getting smooshed together when I close it and return to it later. I have not found a solution, yet.

FILES:
** One setup file called Tables set up.
** One file for each table to populate it called Input & Alter [table name].

TABLES:
Redid the Sales Receipt and Services Receipt Tables, based on errors that required additional information.

FUNCTIONS:
Created one or more repeatable FUNCTIONs at the beginning of the file for each table to input & manipulate data

PROCUDURES:
Used camel case for procedures. 
** Created procedure for updating an inventory vehicle's sales price.
** Created procedure for updating service charges.

TAX CALCULATIONS:
Changed tax from Decimal to Numeric. 
Tax is calculated at 6.25% or .0625. 
I'm sure there's a way to do run the calculations within SQL or even create another procedure to do it. If this were for a job, I would seek it out. However, I'm still hoping to accomplish more homeowork this weekend. So, for now, I used https://www.calculatorsoup.com/calculators/financial/sales-tax-calculator.php


