const sql = require('mssql');

const config = {
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT || 1433),
  options: {
    encrypt: process.env.DB_ENCRYPT === 'true',
    trustServerCertificate: process.env.DB_TRUST_SERVER_CERTIFICATE === 'true',
  },
};

let poolPromise;

const getPool = async () => {
  if (!poolPromise) {
    poolPromise = sql.connect(config).catch((error) => {
      poolPromise = null;
      throw error;
    });
  }

  return poolPromise;
};

module.exports = { sql, getPool };
