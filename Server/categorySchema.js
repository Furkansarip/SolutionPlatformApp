var mongoose = require('mongoose')
var Schema = mongoose.Schema

var category = new Schema({

    name: String,
   


})

var categoryData = mongoose.model("categoryData",category)
module.exports = categoryData