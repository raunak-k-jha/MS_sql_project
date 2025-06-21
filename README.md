# 🏦 Banking System Database (SQL)  

A **relational database** design for a banking system, implemented in SQL. This project includes:  
- **ER Diagram** of entities (Customer, Account, Loan, Branch, etc.)  
- **SQL scripts** for table creation, constraints, and relationships  
- Documentation explaining the schema design  

## 📌 Features  
- **Normalized database schema** (3NF) with primary/foreign keys  
- **Table relationships**:  
  - `Customer` → `Account` (Savings/Current)  
  - `Loan` → `Payment` (Weak Entity)  
  - `Employee` → `Branch` (1:N) .. ETC. 
- **Constraints**: `NOT NULL`, `DEFAULT`, `ON DELETE CASCADE`  

## 🛠️ Tech Stack  
- **Database**: MSSQL, Database : SQL SERVER, GUI : SSMS  
- **Tools**: SQL scripts, ER Diagram (conceptual)  

 
