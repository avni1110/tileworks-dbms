# Tileworks Database Management System

This project is a DBMS mini‑project for managing products, customers, and orders in a tile business.  
It uses **MySQL** for database design and queries, with sample data and reports.

---

## 📂 Project Structure
- `schema.sql` → Database creation and table definitions (DDL)
- `dml.sql` → Insert, update, delete operations (DML)
- `queries.sql` → Report queries (bill generation, sales summary, customer/order views)
- `report/` → Academic project report
- `ppt/` → Presentation slides
- `screenshots/` → MySQL Workbench outputs
- `app/` → Minimal Node.js app for deployment

---

## 🚀 How to Run Locally
1. Open MySQL Workbench or CLI.
2. Run `schema.sql` to create the database and tables.
3. Run `dml.sql` to insert and modify sample records.
4. Run `queries.sql` to generate outputs (billing, sales, views).
5. Check results in the Workbench output grid.

---

## 📊 Features
- Automated record management (products, customers, orders)
- Bill generation with discounts
- Sales per product summary
- Customer and order views

---

## 🌐 Deployment
A minimal Node.js app (`app/`) is included to connect to MySQL and expose endpoints.  
Once deployed, you can access:
- `/api/customers` → Customer table
- `/api/orders` → Orders table
- `/api/bill?ids=1,2` → Bill generation
- `/api/sales` → Sales summary

---

## 👩‍🎓 Credits
- Project by [Your Team Names & Roll Numbers]  
- Course: B.Tech CSE (AI & ML), Semester 3  
- University: JSS University