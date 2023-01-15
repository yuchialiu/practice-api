require('dotenv').config();
const express = require('express');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

const { pool } = require('./mysqlcon');

const salt = parseInt(process.env.BCRYPT_SALT);

// Sign Up API
app.post('/signup', async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    res
      .status(400)
      .json({ success: false, error: 'username and password are required' });
    return;
  }

  if (username.length < 3 || username.length > 32) {
    return res.status(400).json({
      success: false,
      error: 'username must be between 3 and 32 characters',
    });
  }

  if (!password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,32})/)) {
    return res.status(400).json({
      success: false,
      error:
        'password must be at least 8 characters in length and contains at least 1 uppercase letter, 1 lowercase letter, and 1 number',
    });
  }

  // usernane exist
  const resultUsername = await validateUsername(username);
  if (resultUsername.length) {
    return res.status(400).json({ success: false, error: 'Username existed' });
  }

  const result = await createUser(username, password);
  if (result.error) {
    res.status(403).json({ success: false, error: result.error.message });
    return;
  }

  res
    .status(201)
    .json({ success: true, message: 'account created successfully' });
});

const validateUsername = async (username) => {
  const [result] = await pool.execute(
    'SELECT * FROM `user` WHERE username = ?',
    [username]
  );
  return result;
};

const createUser = async (username, password) => {
  try {
    const user = {
      username,
      password: bcrypt.hashSync(password, salt),
    };

    const sql = 'INSERT INTO `user` (username, password) VALUES (?, ?)';
    const [result] = await pool.execute(sql, [user.username, user.password]);
    user.id = result.insertId;

    return { user };
  } catch (err) {
    console.log(err);
    return {
      error: err,
      status: 403,
    };
  }
};

// Sign In API
app.post('/signin', async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    res
      .status(400)
      .json({ success: false, error: 'username and password are required' });
    return;
  }

  // usernane not exist
  const resultUsername = await validateUsername(username);
  if (!resultUsername.length) {
    return res
      .status(400)
      .json({ success: false, error: 'Username not existed' });
  }

  const isAuth = await bcrypt.compare(password, resultUsername[0].password);
  if (!isAuth) {
    console.log({ error: 'Password is wrong' });
    return res.status(400).json({ error: 'Username or password is wrong' });
  }

  return res
    .status(201)
    .json({ success: true, message: 'Sign in successfully' });
});

// Server Port
const port = 3000;
app.listen(port, () => {
  console.log(`server.js listening on port ${port}`);
});
