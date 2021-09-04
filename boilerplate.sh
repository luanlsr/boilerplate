#! /bin/bash
clear
npm init -y
echo 'node_modules'>>.gitignore
echo '.env'>>.gitignore
touch .env
touch index.js
echo "const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.json());

require('dotenv').config();
const { PORT } = process.env;
const router = require('./api/routes/routes');

app.get('/', router)

app.listen(PORT, () => {
  console.log(`Acessar: http://localhost:${PORT}`);
  console.log(`Server listening on port ${PORT}`);
});
">>index.js
npm i express express-rescue express-validations body-parser mongodb dotenv
npm i nodemon -D
mkdir docs models services controllers helpers validations middlewares routes config
cd models
touch connection.js
echo "const { MongoClient } = require('mongodb');

const OPTIONS = {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}

const MONGO_DB_URL = 'mongodb://127.0.0.1:27017';

let db = null;

const connection = () => {
    return db
    ? Promise.resolve(db)
    : MongoClient.connect(MONGO_DB_URL, OPTIONS)
    .then((conn) => {
    db = conn.db('model_example');
    return db;
    })
};

module.exports = connection;">>connection.js
touch model.js
cd ..
cd services
touch serviceName.js
cd ..
cd controllers
touch controllerName.js
cd ..
cd validations
touch validations.js
echo "var expressValidations = require('express-validations')

const {
  isValidFirstname,
  isValidMiddlename,
  isValidLastname,
  isValidFullname,
  isStrongPassword,
  isValidDate,
  isAlpha,
  isNumeric,
  isAlphaNumeric,
  containsNotNumber,
  containsNotAlphabets,
  isLength,
  isValidURL,
} = expressValidations

const errors_messages = {
  firstName_invalid: 'first name is not valid',
  middleName_invalid: 'middle name is not valid',
  lastName_invalid: 'last name is not valid',
  firstName_length: 'first name should have length XXX'
}

const http_status_code = {
  HTTP_INVALID_STATUS: 422,
}

const { HTTP_INVALID_STATUS } = http_status_code
const { firstName_invalid, middleName_invalid, lastName_invalid, firstName_length } = errors_messages


const validate = (params) => {
  switch (true) {
    case isValidFirstname(firstName): return { code: HTTP_INVALID_STATUS, message: firstName_invalid}
    case isLength(firstName, 3, null ): return {code: HTTP_INVALID_STATUS, message: firstName_length}
    case isValidMiddlename(middleName): return { code: HTTP_INVALID_STATUS, message: middleName_invalid}
    case isValidLastname(lastName): return { code: HTTP_INVALID_STATUS, message: lastName_invalid}
  
    default: return {}
  }

}

module.exports = validate;">>validations.js
cd ..
cd helpers
touch helpers.js
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
}">> helpers.js
cd ..
cd routes
touch router.js
echo "const express = require('express');
const router = express.Router();

const { getAll, findById, create, edit, remove } = require('../controllers/controlerName');

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
touch docs.md
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
* isValidURL(url)"
clear
echo "boilerplate terminado! by Luan da Silva Ramalho | https://github.com/luanlsr"