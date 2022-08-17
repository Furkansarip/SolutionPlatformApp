const { error } = require('console')
const express = require('express')
const mongoose = require('mongoose')
const categoryData = require('./categorySchema')
var Data = require('./entrySchema')
var userData = require('./userSchema')

var app = express()

mongoose.connect("mongodb://localhost/newDB2")

mongoose.connection.once("open",()=>{
    console.log("Connected to DB!")
}).on("error",(error)=>{
    console.log("Failed to connect"+ error)
})


//Create - Post
app.post("/createEntry",(req,res)=>{
    var entry = Data({
        userId:req.get("userId"),
        header : req.get("header"),
        description:req.get("description"),
        solution:req.get("solution"),
        category:req.get("category"),
        tags:req.get("tags")
    })

    entry.save().then(()=>{

        if (entry.isNew == false){
            console.log("Saved Data!")
            res.send("Saved Data!")
            
        }
        else{
            console.log("Failed")
        }
    })

    

})

//User post

//Create - user
app.post("/createUser",(req,res)=>{
    var user = userData({
        mail : req.get("mail"),
        password : req.get("password")
    })
    

    user.save().then(()=>{

        if (user.isNew == false){
            console.log("Saved User!")
            res.send("Saved User!")
            
        }
        else{
            console.log("Failed")
        }
    })
})
// Create Category
app.post("/createCategory",(req,res)=>{
    var category = categoryData({
        name: req.get("name"),
        
    })

    category.save().then(()=>{

        if (category.isNew == false){
            console.log("Saved Category!")
            res.send("Saved category!")
            
        }
        else{
            console.log("Failed Category")
        }
    })
})






//Delete - Post

app.post("/delete",(req,res)=>{
    Data.findOneAndRemove({
        _id : req.get("id")
    },(err)=>{
        console.log("failed"+err)
    })
    res.send("deleted")
})


//Update - Post

app.post("/update",(req,res)=>{
    Data.findOneAndUpdate({
        
        
        _id : req.get("id")
    },{
        
        header : req.get("header"),
        description:req.get("description"),
        solution:req.get("solution"),
        category:req.get("category"),
        tags:req.get("tags"),
        isActive : req.get("isActive")
       
    },(err) => {
            console.log("update failed s" + err)
    })
    res.send("Updated!")
})

//isActive update
app.post("/updateStatus",(req,res)=>{
    Data.findOneAndUpdate({
        
        
        _id : req.get("id")
    },{
        
        isActive : req.get("isActive")
       
    },(err) => {
            console.log("update failed s" + err)
    })
    res.send("Updated! isActive")
})




//Fetch - Get
app.get('/fetch',(req,res)=>{
    Data.find({}).then((DBitems)=>{
                res.send(DBitems)
    })
})
//user
app.get('/fetchUser',(req,res)=>{
    userData.find({}).then((userItems)=>{
        res.send(userItems)
    })
})

//category
app.get('/fetchCategory',(req,res)=>{
    categoryData.find({}).then((catItems)=>{
        res.send(catItems)
    })
})


//http://10.215.0.41:27017/create
var server = app.listen(8081 , "192.168.1.54",()=>{
    console.log("Server is running")
})







