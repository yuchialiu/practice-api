require('dotenv').config();
const mysql = require('mysql2/promise');

const env = process.env.NODE_ENV;
const multipleStatements = process.env.NODE_ENV === 'test';

const { DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE } = process.env;

const mysqlConfig = {
  development: {
    // for localhost development
    host: DB_HOST,
    user: DB_USERNAME,
    password: DB_PASSWORD,
    database: DB_DATABASE,
  },
};

const mysqlEnv = mysqlConfig[env];
mysqlEnv.waitForConnections = true;
mysqlEnv.connectionLimit = 20;

const pool = mysql.createPool(mysqlEnv, { multipleStatements });

async function execute(sql, params) {
  // check array
  if (typeof params === 'object' && params[0]) {
    params = params.map((param) => String(param));
  }

  // check number
  if (typeof params === 'number') {
    params = String(params);
  }

  // check string
  if (typeof params === 'string') {
    params = [params];
  }

  const [results] = await pool.execute(sql, params);
  return results;
}

module.exports = {
  mysql,
  pool,
  execute,
};
