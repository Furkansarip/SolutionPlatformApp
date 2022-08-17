var mongoose = require('mongoose')
var Schema = mongoose.Schema

var users = new Schema({

    mail: String,
    password : String


})

var userData = mongoose.model("userData",users)
module.exports = userData