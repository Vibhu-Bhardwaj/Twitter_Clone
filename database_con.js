const { connect } = require('http2');
var mysql = require('mysql');
var db = mysql.createConnection({
    hostname:"localhost",
    user:"root",
    password:"Vibhu@66896",
    database:"Twitter_Clone"
});


db.connect(function(err){
    if(err) throw err;
}); // end of connect function

module.exports=db;