DROP TABLE IF EXISTS People CASCADE;
CREATE TABLE People (
    people_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
SELECT *
FROM People;
SELECT
SELECT employee.employee_id,
    customer.customer_id,
    employee.phone AS e_phone,
    customer.phone AS c_phone
FROM employee
    JOIN people ON employee.employee_id = people.employee_id
    JOIN customer ON people.customer_id = customer.customer_id
GROUP BY employee.employee_id,
    customer.customer_id
ORDER BY employee.phone,
    customer.phone;
SELECT employee.employee_id,
    customer.customer_id,
    employee.phone AS e_phone,
    customer.phone AS c_phone
FROM people
GROUP BY employee.employee_id,
    customer.customer_id
ORDER BY employee.phone,
    customer.phone;
SELECT *
FROM employee,
    customer
WHERE employee.phone = customer.phone
GROUP BY employee.employee_id,
    customer.customer_id
ORDER BY employee.phone,
    customer.phone;
SELECT employee.employee_id,
    customer.customer_id,
    employee.phone AS e_phone,
    customer.phone AS c_phone
FROM employee,
    customer
WHERE employee.phone = customer.phone
GROUP BY employee.employee_id,
    customer.customer_id;