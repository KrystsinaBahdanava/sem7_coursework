var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index.js');
var usersRouter = require('./routes/users.js');

var app = express();

app.get('/',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
});

app.get('/index.html',function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
});

app.get('/howtomakeorder.html', function (req, res) {
   console.log("Got a GET request for /howtomakeorder.html");
   res.sendFile(path.join(__dirname+'/howtomakeorder.html'));
});

app.get('/news.html', function (req, res) {
   console.log("Got a GET request for /news.html");
   res.sendFile(path.join(__dirname+'/news.html'));
});

app.get('/contacts.html', function (req, res) {
   console.log("Got a GET request for /contacts.html");
   res.sendFile(path.join(__dirname+'/contacts.html'));
});

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(function (err, req, res, next) {
  console.error(err.stack)
  res.status(500).send('Something broke!')
});

app.use(function (req, res, next) {
  res.status(404).send("Sorry can't find that!")
});

app.use('/', indexRouter);
app.use('/users', usersRouter);

module.exports = app;
app.listen(3000);

console.log("Running at Port 3000");

/*
app.listen(3000);

console.log("Running at Port 3000");

var oracledb = require('oracledb');

oracledb.getConnection(
  {
    user          : "delivery",
    password      : "delivery",
    connectString : "localhost/XE"
  },
  function(err, connection) {
    if (err) {
      console.error(err.message);
      return;
    }
    connection.execute(
      `SELECT be_id, be_name
       FROM att_address
       WHERE be_id = :id`,
      [1],  // bind value for :id
      function(err, result) {
        if (err) {
          console.error(err.message);
          doRelease(connection);
          return;
        }
        console.log(result.rows);
        doRelease(connection);
      });
  });

function doRelease(connection) {
  connection.close(
    function(err) {
      if (err)
        console.error(err.message);
    });
}
*/

/*const oracledb = require('oracledb');
    
        oracledb.getConnection(
          {
            user          : "delivery",
            password      : "delivery",
            connectString : "localhost/XE"
          },
          function(err, connection) {  
          if (err) {
            console.error(err.message);
            return;
           }      
          connection.execute(
           `SELECT be_id
            FROM att_address
            WHERE be_id = 1`,
           function(err, result) {
             if (err) {
               console.error(err.message);
               doRelease(connection);
               return;
             }
             console.log(result.rows);
             doRelease(connection);
           });
            
          });


window.onload = function () {
    alert('Page loaded');

        
    const oracledb = require('oracledb');
    
        oracledb.getConnection(
          {
            user          : "delivery",
            password      : "delivery",
            connectString : "localhost/XE"
          },
            
          connection.execute(
           `SELECT be_id
            FROM att_address
            WHERE be_id = 1`,
           function(err, result) {
             if (err) {
               console.error(err.message);
               doRelease(connection);
               return;
             }
             console.log(result.rows);
             doRelease(connection);
           });
            
          );
    
  };


function doRelease(connection) {
  connection.close(
    function(err) {
      if (err)
        console.error(err.message);
    });
}
/*


const executePLSQL = (statement, params=[]) =>
    new Promise((resolve, reject) => {
        oracledb.getConnection(
            {
                user: process.env.DB_USER,
                password: process.env.DB_PASSWORD,
                connectString: process.env.DB_CONNECTION_STRING
            }
        ).then(connection => {
            return connection.execute(
                statement, params
            ).then(result => {
                resolve(result);
                return connection.release();
            }).catch(err => {
                reject(err);
                return connection.release();
            })
        }).catch(err => reject(err));
    });
    */