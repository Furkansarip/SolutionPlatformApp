var mongoose = require('mongoose')
var Schema = mongoose.Schema

var entry = new Schema({

    userId:String,
    header:String,
    description:String,
    solution:String,
    category:String,
    tags:String,
    isActive : {type : Boolean,default:false}


})

var Data = mongoose.model("data",entry)
module.exports = Data