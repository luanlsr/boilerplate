#! /bin/bash
clear
npm init -y
echo 'node_modules'>>.gitignore
echo '.env'>>.gitignore
echo "Welcome to my Project">>readme.md
echo "PORT=3000
DB_URL='mongodb://localhost:27017'
DB_NAME='databaseName'">>.env
echo "const express = require('express');

const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.json());

require('dotenv').config();

const { PORT } = process.env;
const router = require('./routes/router');

app.get('/', router);

app.listen(PORT, () => {
  console.log(`Acessar http://localhost:${PORT}`);
  console.log(`Online na porta ${PORT}`);
});

">>index.js
npm i express express-rescue express-validations body-parser mongodb dotenv joi
npm i nodemon -D
mkdir docs models services controllers helpers validations middlewares routes config
cd models
echo "const mongodb = require('mongodb').MongoClient;
require('dotenv').config();

const { DB_URL, DB_NAME } = process.env;

const OPTIONS = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
};

module.exports = () => mongodb.connect(DB_URL, OPTIONS).then((connection) => connection.db(DB_NAME))
  .catch((err) => {
    console.log(err);
    process.exit(1);
  });">>connection.js
touch model.js
cd ..
cd services
echo "const model = require('../models/model');
const validate = require('../validations/validations');

const getAll = async () => model.getAll();

const findById = async (id) => {
  const author = await model.findById(id);
  if (!author) {
    return {
      error: {
        code: 'notFound',
        message: 'Something is wrong',
      },
    };
  }
  return author;
};

const create = async (firstName, middleName, lastName) => {
  const existingAuthor = await model.findByName(firstName, middleName, lastName);

  if (existingAuthor) {
    return {
      error: {
        code: 'alreadyExists',
        message: 'Um autor já existe com esse nome completo',
      },
    };
  }
  const created = await validate(firstName, middleName, lastName);
  return model.create(created);
};

module.exports = {
  getAll,
  findById,
  create,
};
">>serviceName.js
cd ..
cd controllers
touch controllerName.js
cd ..
cd validations
touch validations.js
cd ..
cd helpers
echo "const HTTP_OK_STATUS = 200;
const HTTP_CREATED_STATUS = 201;
const HTTP_NO_BODY_STATUS = 422;
const HTTP_401 = 401;
const HTTP_NOT_FOUND_STATUS = 404;

module.exports = {
  HTTP_OK_STATUS,
  HTTP_CREATED_STATUS,
  HTTP_NO_BODY_STATUS,
  HTTP_401,
  HTTP_NOT_FOUND_STATUS,
};
">> helpers.js
cd ..
cd routes
echo "const express = require('express');

const router = express.Router();

const {
  getAll,
  findById,
  create,
  edit,
  remove,
} = require('../controllers/controllerName');

router.get('/', getAll);

router.get('/', findById);

router.post('/', create);

router.put('/', edit);

router.delete('/', remove);

module.exports = router;

">>router.js
cd ..
cd middlewares
touch middlewareName.js
cd ..
cd docs
echo "# Express-Validations:
## Complete List of Validation Methods
* isValidEmail(email)
* isValidFirstname(firstname)
* isValidMiddlename(middlename)
* isValidLastname(lastname)
* isValidFullname(fullname)
* isStrongPassword(password)
* isValidDate(date)
* isAlpha(alphabeticString)
* isNumeric(numericString)
* isAlphaNumeric(alphaNumericString)
* containsNotNumber(nonNumericString)
* containsNotAlphabets(nonAlphabeticString)
* isLength(string, minLength, maxLength)
* isValidURL(url)">>docs.md
clear
echo "boilerplate terminado! by Luan da Silva Ramalho | https://github.com/luanlsr"