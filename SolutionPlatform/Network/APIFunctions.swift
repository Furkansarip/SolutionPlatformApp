//
//  APIFunctions.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 28.07.2022.
//

import Foundation
import Alamofire
var url = "http://10.215.0.48:8081"
struct AllEntry : Decodable {
    var _id : String
    var userId : String
    var header : String
    var description : String
    var solution : String
    var category : String
    var tags:String
    var isActive : Bool
}

struct User : Decodable {
    var mail:String
    var password : String
}

struct CategoryInfo : Decodable{
    var _id : String
    var name : String
}

class APIFunctions {
    var delegate : DataDelegate?
    var loginDelegate : LoginDelegate?
    var profileDelegate : ProfileDelegate?
    var categoryDelegate : CategoryDelegate?
    static let functions = APIFunctions()
    func fetchEntry(){//Tüm entryleri sunucudan çekiyor.
        AF.request("\(url)/fetch").response { response in
            
            print(response.data)
            let data = String(data:response.data!,encoding: .utf8)
            self.delegate?.updateArray(newArray: data!)
            
            
        }
    }
    
    func fetchUser(){//Kayıtlı kullanıcıları çekiyor.
        AF.request("\(url)/fetchUser").response { response in
            
            print(response.data)
            let userData = String(data:response.data!,encoding: .utf8)
            self.loginDelegate?.updateUser(newUsers: userData!)
            
            
        }
    }
    
    func fetchCategory(){
        AF.request("\(url)/fetchCategory").response { response in
            
            print(response.data)
            let categoryData = String(data:response.data!,encoding: .utf8)
            self.categoryDelegate?.categoryList(newCategory: categoryData!)
            
            
        }
    }
    
    func fetchProfile(){//Giriş yapmış kullanıcı için geçmiş konularını çekiyor.
        AF.request("\(url)/fetch").response { response in
            
            print(response.data)
            let profileEntry = String(data:response.data!,encoding: .utf8)
            self.profileDelegate?.updateEntryHistory(entryHistory: profileEntry!)
            
            
        }
    }
    
    func createUser(mail:String,password:String){
        AF.request("\(url)/createUser",method: .post,encoding: URLEncoding.httpBody,headers: ["mail":mail,"password":password]).responseJSON{
            response in
        }
    }
    
    func createCategory(name:String){
        AF.request("\(url)/createCategory",method: .post,encoding: URLEncoding.httpBody,headers: ["name":name]).responseJSON{
            response in
        }
    }
    
    func createEntry(header:String,description:String,solution:String,category:String,tags:String,userId:String){
        AF.request("\(url)/createEntry",method: .post,encoding: URLEncoding.httpBody,headers: ["header":header,"description":description,"solution":solution,"category":category,"tags":tags,"userId":userId]).responseJSON {
            response in
            
        }
        
}
    
    func updateEntry(id:String,header:String,description:String,solution:String,tags:String,category:String){
        AF.request("\(url)/update",method: .post,encoding:URLEncoding.httpBody,headers: ["id":id,"header":header,"description":description,"solution":solution,"category":category,"tags":tags]).responseJSON {
            response in
        }
        
    }
    
    func applyEntry(id:String,header:String,description:String,solution:String,tags:String,category:String,isActive:Bool){
        AF.request("\(url)/update",method: .post,encoding:URLEncoding.httpBody,headers: ["id":id,"header":header,"description":description,"solution":solution,"category":category,"tags":tags,"isActive" : "true"]).responseJSON {
            response in
        }
        
    }
    func falseStatus(id:String,header:String,description:String,solution:String,tags:String,category:String,isActive:Bool){
        AF.request("\(url)/update",method: .post,encoding:URLEncoding.httpBody,headers: ["id":id,"header":header,"description":description,"solution":solution,"category":category,"tags":tags,"isActive" : "false"]).responseJSON {
            response in
        }
        
    }
    
    func deleteEntry(id:String){
        AF.request("\(url)/delete",method: .post,encoding:URLEncoding.httpBody,headers: ["id":id]).responseJSON {
            response in
        }
        
    }
}

