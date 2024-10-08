CREATE DATABASE HR_Evaluation;
GO

USE HR_Evaluation;
GO

CREATE TABLE Company (
    company_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    company_id INT FOREIGN KEY REFERENCES Company(company_id),
    name NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Manager (
    manager_id INT PRIMARY KEY IDENTITY(1,1),
    company_id INT FOREIGN KEY REFERENCES Company(company_id),
    name NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Event (
    event_id INT PRIMARY KEY IDENTITY(1,1),
    company_id INT FOREIGN KEY REFERENCES Company(company_id),
    name NVARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category NVARCHAR(100) NOT NULL,
    created_by NVARCHAR(50) NOT NULL -- Có thể là 'admin' hoặc 'manager'
);
GO

CREATE TABLE Step (
    step_id INT PRIMARY KEY IDENTITY(1,1),
    event_id INT FOREIGN KEY REFERENCES Event(event_id),
    step_name NVARCHAR(255) NOT NULL,
    step_type NVARCHAR(50) CHECK (step_type IN ('Employee', 'Manager')) NOT NULL,
    sequence INT NOT NULL -- Thứ tự của bước
);
GO

CREATE TABLE Evaluation_Sheet (
    sheet_id INT PRIMARY KEY IDENTITY(1,1),
    event_id INT FOREIGN KEY REFERENCES Event(event_id),
    name NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE Sheet_Input (
    input_id INT PRIMARY KEY IDENTITY(1,1),
    sheet_id INT FOREIGN KEY REFERENCES Evaluation_Sheet(sheet_id),
    input_type NVARCHAR(50) CHECK (input_type IN ('number', 'string', 'date', 'long text', 'checkbox', 'radio')) NOT NULL,
    permissions NVARCHAR(50) CHECK (permissions IN ('read-only', 'editable', 'required', 'not-required', 'hidden')) NOT NULL
);
GO

CREATE TABLE Access_Control (
    access_id INT PRIMARY KEY IDENTITY(1,1),
    input_id INT FOREIGN KEY REFERENCES Sheet_Input(input_id),
    employee_id INT NULL FOREIGN KEY REFERENCES Employee(employee_id),
    manager_id INT NULL FOREIGN KEY REFERENCES Manager(manager_id),
    CONSTRAINT chk_employee_or_manager CHECK (
        (employee_id IS NOT NULL AND manager_id IS NULL) OR 
        (employee_id IS NULL AND manager_id IS NOT NULL)
    )
);
GO
