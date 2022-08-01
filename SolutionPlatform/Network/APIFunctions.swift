//
//  APIFunctions.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 28.07.2022.
//

import Foundation
import Alamofire

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

class APIFunctions {
    var delegate : DataDelegate?
    var loginDelegate : LoginDelegate?
    static let functions = APIFunctions()
    func fetchEntry(){
        AF.request("http://192.168.1.34:8081/fetch").response { response in
            
            print(response.data)
            let data = String(data:response.data!,encoding: .utf8)
            self.delegate?.updateArray(newArray: data!)
            
            
        }
    }
    
    func fetchUser(){
        AF.request("http://192.168.1.34:8081/fetchUser").response { response in
            
            print(response.data)
            let userData = String(data:response.data!,encoding: .utf8)
            self.loginDelegate?.updateUser(newUsers: userData!)
            
            
        }
    }
    
    func createEntry(header:String,description:String,solution:String,category:String,tags:String,userId:String){
        AF.request("http://192.168.1.34:8081/createEntry",method: .post,encoding: URLEncoding.httpBody,headers: ["header":header,"description":description,"solution":solution,"category":category,"tags":tags,"userId":userId]).responseJSON {
            response in
            let entryData = String(data: response.data!, encoding: .utf8)
            response.data?.description.utf8
        }
        
}
    
    func updateEntry(id:String,header:String,description:String,solution:String,tags:String,category:String){
        AF.request("http://192.168.1.34:8081/update",method: .post,encoding:URLEncoding.httpBody,headers: ["id":id,"header":header,"description":description,"solution":solution,"category":category,"tags":tags]).responseJSON {
            response in
        }
        
    }
}

