var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var oracledb = require('oracledb');

var indexRouter = require('./routes/index.js');
var usersRouter = require('./routes/users.js');

var app = express();

 const connection = oracledb.getConnection ({
  user          : "delivery",
  password      : "delivery",
  connectString : "localhost/XE"
 });

var address;
var category_all;
var re = [];
var sh = [];
var logo = [];
var mark = [];
var category = [];
app.get('/',function(req,res){
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
           `SELECT be_name
            FROM att_rstrnt`,
           function(err, result) {
             if (err) {
               console.error(err.message);
                 
               doRelease(connection);
               return;
             }
              // res.send(result.rows);
             doRelease(connection);
           });
            
          });
       // convert whatever we want to send (preferably should be an object) to JSON
  res.sendFile(path.join(__dirname+'/index.html'));   
});

app.get('/data',function(req,res){
//extract restaurants for main page
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
           `select r.be_name, schedule, c.be_name, round(avg(f.mark), 1), logo from att_rstrnt r
            inner join att_rest_category c
            on r.category_oid = C.be_id
            inner join att_feedback f
            on f.rstrnt_oid = r.be_id
            group by r.be_name, schedule, c.be_name, logo`,
           function(err, result) {
             if (err) {
               console.error(err.message);
                 
               doRelease(connection);
               return;
             }
                    re = [];
                     sh = [];
                     logo = [];
                     mark = [];
                     category = [];
               address= result.rows;
                  address.forEach(e => {
                      re.push(e[0]);
                      sh.push(e[1]);
                      category.push(e[2]);
                      mark.push(e[3]);
                      logo.push(e[4]);
                  });
              // res.send(result.rows);
             doRelease(connection);
           });
          });
    
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
           `select be_name
            from att_rest_category`,
           function(err, result) {
             if (err) {
               console.error(err.message);
               doRelease(connection);
               return;
             }
               category_all= result.rows;
              // res.send(result.rows);
             console.log(category_all);
             doRelease(connection);
           });
          });
    
      var dataToSendToClient = {restaurant: re, sched: sh, cat: category, mark: mark, logo: logo, categories: category_all};
       // convert whatever we want to send (preferably should be an object) to JSON
       var JSONdata = JSON.stringify(dataToSendToClient);
      // res.send(JSONdata);
    res.send(JSONdata); 
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

function doRelease(connection) {
  connection.close(
    function(err) {
      if (err)
        console.error(err.message);
    });
}



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