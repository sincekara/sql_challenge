-- drop tables if exist

drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists departments;
drop table if exists employees;
drop table if exists titles;
drop table if exists salaries;

-- specifying data types, and keys 
-- Import CSV files into corresponding table

create table "departments" (
    "dept_no" varchar not null,
	"dept_name" varchar not null,
     constraint "pk_departments" primary key ("dept_no")
);

create table "dept_emp" (
    "emp_no" int not null,
    "dept_no" varchar not null,
    "from_date" date not null,
    "to_date" date not null
    );

create table "dept_manager" (
    "dept_no" varchar not null,
	"emp_no" int not null,
    "from_date" date not null,
    "to_date" date not null
);

create table "employees" (
    "emp_no" int not null,
    "birth_date" date not null,
    "first_name" varchar not null,
    "last_name" varchar not null,
    "gender" varchar not null,
    "hire_date" date not null,
    constraint "pk_employees" primary key ("emp_no")
);

create table "salaries" (
    "emp_no" int not null,
    "salary" int not null,
    "from_date" date not null,
    "to_date" date not null
);

create table "titles" (
    "emp_no" int not null,
    "title" varchar not null,
    "from_date" date not null,
    "to_date" date not null
);

-- creating foreign keys (fk)
-- note: the two f keys have been reated for both "dept_emp" and "dept_manager" 
-- tables because all of them have been used in queries as f keys. 


alter table "dept_emp" add constraint "fk_dept_emp_emp_no" foreign key ("emp_no")
references "employees" ("emp_no");

alter table "dept_emp" add constraint "fk_dept_emp_dept_no" foreign key("dept_no")
references "departments" ("dept_no");

alter table "dept_manager" add constraint "fk_dept_manager_dept_no" foreign key("dept_no")
references "departments" ("dept_no");

alter table "dept_manager" add constraint "fk_dept_manager_emp_no" foreign key("emp_no")
references "employees" ("emp_no");

alter table "salaries" add constraint "fk_salaries_emp_no" foreign key("emp_no")
references "employees" ("emp_no");

alter table "titles" add constraint "fk_titles_emp_no" foreign key("emp_no")
references "employees" ("emp_no");