import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import mysql from "mysql2/promise";

dotenv.config();
const app = express();
app.use(cors());

// ✅ Tell Express to use EJS
app.set("view engine", "ejs");

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 5
});

// Homepage
app.get("/", (req, res) => {
  res.render("index", { title: "Tileworks DBMS" });
});

// Customers page
app.get("/customers", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM customer ORDER BY Cust_Id;");
    res.render("customers", { customers: rows });
  } catch (err) {
    res.send("❌ Error fetching customers: " + err.message);
  }
});

// Orders page
app.get("/orders", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM orders ORDER BY Order_Id;");
    res.render("orders", { orders: rows });
  } catch (err) {
    res.send("❌ Error fetching orders: " + err.message);
  }
});

// Bill generation page (e.g., ?ids=1,2)
app.get("/bill", async (req, res) => {
  const ids = (req.query.ids || "").split(",").map(Number).filter(Boolean);
  if (!ids.length) return res.send("❌ Provide order ids as ?ids=1,2");

  try {
    const [rows] = await pool.query(
      `SELECT B.Product_name,
              O.Order_Id,
              O.Qty,
              B.price,
              C.discount,
              O.Qty * B.price - (C.discount/100) * (O.Qty * B.price) AS amount
       FROM brochure B
       JOIN orders O ON B.Product_Id = O.Product_Id
       JOIN customer C ON O.Cust_Id = C.Cust_Id
       WHERE O.Order_Id IN (${ids.map(() => "?").join(",")});`,
      ids
    );
    res.render("bill", { bills: rows });
  } catch (err) {
    res.send("❌ Error generating bill: " + err.message);
  }
});

// Sales summary page
app.get("/sales", async (req, res) => {
  try {
    const [rows] = await pool.query(
      `SELECT O.Product_Id,
              B.Product_name,
              B.color,
              SUM(O.Qty) AS total_qty,
              B.price,
              SUM(O.Qty * B.price - (C.discount/100) * (O.Qty * B.price)) AS amount
       FROM brochure B
       JOIN orders O ON B.Product_Id = O.Product_Id
       JOIN customer C ON O.Cust_Id = C.Cust_Id
       GROUP BY O.Product_Id
       ORDER BY O.Product_Id;`
    );
    res.render("sales", { sales: rows });
  } catch (err) {
    res.send("❌ Error fetching sales: " + err.message);
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`✅ Server running on http://localhost:${port}`));