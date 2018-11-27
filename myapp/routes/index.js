
//var jquery = require('jquery');
var express = require('express');
var router = express.Router();
var oracledb = require('oracledb');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index.html', { title: 'Express' });
});

var app = express();


/*
let sql, binds, options, result;

const oracledb = require('oracledb'); 
 connection = oracledb.getConnection( { user : "delivery", password : "delivery", connectString : "localhost/XE" } );
 sql = `SELECT be_id, be_name
       FROM att_address
       WHERE be_id = :id`;

 binds = [[1]];

    // For a complete list of options see the documentation.
 options = {
      outFormat: oracledb.OBJECT   // query result format
      // extendedMetaData: true,   // get extra metadata
      // fetchArraySize: 100       // internal buffer allocation size for tuning
    };

 result = await connection.execute(sql, binds, options);

    console.log("Column metadata: ", result.metaData);
    console.log("Query results: ");
    console.log(result.rows);
module.exports = router;
*/


/*

  try {
const oracledb = require('oracledb');
    let sql, binds, options, result;

    const connection =  oracledb.getConnection(  {
      user          : "delivery",
      password      : "delivery",
      connectString : "localhost/XE"
    });

    // Query the data

    sql = `SELECT be_id, be_name
       FROM att_address`;

    binds = {};

    // For a complete list of options see the documentation.
    options = {
      outFormat: oracledb.OBJECT   // query result format
      // extendedMetaData: true,   // get extra metadata
      // fetchArraySize: 100       // internal buffer allocation size for tuning
    };

    result =  connection.execute(sql, binds, options);

    console.log("Column metadata: ", result.metaData);
    console.log("Query results: ");
    console.log(result.rows);

  } catch (err) {
    console.error(err);
  } finally {
    if (connection) {
      try {
         connection.close();
      } catch (err) {
        console.error(err);
      }
    }
  }
*/
/*
       const db = oracledb.getConnection ({
        user          : "delivery",
        password      : "delivery",
        connectString : "localhost/XE"
       });

app = express();
app.post('/index(.html)?', function(req, res) {
      console.log('Connected to database...');

      db.query(
        'SELECT be_id, be_name FROM att_address',
        function(err, results) {
          console.log(results);
        });
             
});
        
*/
        //console.log(result.rows);



module.exports = router;