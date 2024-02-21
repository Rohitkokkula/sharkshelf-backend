import bcrypt from "bcrypt";
import pg from "pg";
import fs from "fs";
import dotenv from "dotenv";

dotenv.config();
const image='https://payx-s3.s3.ap-south-1.amazonaws.com/fc6e2b1ffb5dde2eff2293d72d683b44';
const salt = bcrypt.genSaltSync(10);
const password = bcrypt.hashSync("Shiva@123", salt, null);
const filePath = './utils/insert.sql';
const connectionString = process.env.DB; // Change this to your actual database connection string

// Create a PostgreSQL pool
const { Pool } = pg;
const pool = new Pool({
  connectionString: connectionString,
});

// Function to execute SQL statements
const executeQuery = async (query) => {
  const client = await pool.connect();
  try {
    const query = fs.readFileSync(filePath, { encoding: 'utf-8' }).replace('{{password}}', password).replace('{{image}}', image);
    const res=await client.query(query);
    console.log('Query executed successfully.');
  } catch (error) {
    console.error('Error executing query:', error);
  } finally {
    client.release();
  }
};

executeQuery();
pool.end();