alert('Hi');
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