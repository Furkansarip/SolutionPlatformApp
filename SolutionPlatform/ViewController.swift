//
//  ViewController.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit
import Alamofire
protocol DataDelegate{
    func updateArray(newArray : String)
 
        
    
}
var activeUser = ""
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var entryTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var entryArray = [AllEntry]()
    var newEntryArray = [AllEntry]()
    var filteredData : [AllEntry]!
    var mainHeader = ""
    var mainDesc = ""
    var mainSolution = ""
    var mainCat = ""
    var mainTags = ""
    var mainUser = ""
    var mainEntryId = ""
   
        override func viewDidLoad() {

        super.viewDidLoad()
            if activeUser == "" {
                homeNavBar()
                APIFunctions.functions.delegate = self
                filteredData = newEntryArray
                entryTableView.dataSource = self
                entryTableView.delegate = self
                searchBar.delegate = self
                //print("test \(newEntryArray)")
                entryTableView.reloadData()
            }else {
                accessNavBar()
                APIFunctions.functions.delegate = self
                filteredData = newEntryArray
                entryTableView.dataSource = self
                entryTableView.delegate = self
                searchBar.delegate = self
                //print("test \(newEntryArray)")
                entryTableView.reloadData()
                print(activeUser)
            }
            
            
            
       
    }
    override func viewWillAppear(_ animated: Bool) {
        if activeUser != "" {
            print("aktif \(activeUser)")
            accessNavBar()
            entryArray.removeAll(keepingCapacity: false)
            newEntryArray.removeAll(keepingCapacity: false)
            filteredData.removeAll(keepingCapacity: false)
            entryTableView.reloadData()
            APIFunctions.functions.fetchEntry()
        }else {
            //print("testy")
            entryArray.removeAll(keepingCapacity: false)
            newEntryArray.removeAll(keepingCapacity: false)
            filteredData.removeAll(keepingCapacity: false)
            entryTableView.reloadData()
            APIFunctions.functions.fetchEntry()
        }
        
       
    }
    
   
    
    
  
    
    //MARK: -> Navbar functions
    func homeNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Kayıt Ol", style: .plain, target: self, action: #selector(registerPage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Giriş Yap", style: .plain, target: self, action: #selector(loginPage))
    }
    
    func accessNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createEntry))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profil", style: .plain, target: self, action: #selector(profilePage))
    }
    
    //MARK: -> tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = entryTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredData[indexPath.row].header
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainHeader = filteredData[indexPath.row].header
        mainDesc = filteredData[indexPath.row].description
        mainCat = filteredData[indexPath.row].category
        mainTags = filteredData[indexPath.row].tags
        mainSolution = filteredData[indexPath.row].solution
        mainUser = filteredData[indexPath.row].userId
        mainEntryId = filteredData[indexPath.row]._id
        
        performSegue(withIdentifier: "entryDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entryDetail"{
            let destination = segue.destination as! DetailVC
            destination.detailCat = mainCat
            destination.detailDesc = mainDesc
            destination.detailTags = mainTags
            destination.detailHeader = mainHeader
            destination.detailUser = mainUser
            destination.detailSolution = mainSolution
            destination.entryId = mainEntryId
        }
        
        
        
    }
    
    //MARK: -> SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == "" {
            filteredData = newEntryArray
        }
        
        else {
            for errors in newEntryArray
    {
                if errors.header.lowercased().contains(searchText.lowercased()){
                    filteredData.append(errors)
                }
            }
        }
        self.entryTableView.reloadData()
    }
    
    //MARK: -> objc Func

    @objc func createEntry(){
        performSegue(withIdentifier: "createEntry", sender: nil)
    }
    @objc func registerPage(){
        performSegue(withIdentifier: "registerPage", sender: nil)
    }
    @objc func loginPage(){
        performSegue(withIdentifier: "loginPage", sender: nil)
    }
    @objc func profilePage(){
        performSegue(withIdentifier: "profilePage", sender: nil)
    }
}



extension ViewController : DataDelegate {
    
    
    func updateArray(newArray: String) {
        do{
            entryArray = try JSONDecoder().decode([AllEntry].self , from:newArray.data(using: .utf8)!)
           // print(entryArray)
            for active in entryArray {
                if active.isActive == true {
                    newEntryArray.append(active)
                    //print(newEntryArray)
                }
            }
            //print(entryArray)
            filteredData = newEntryArray
        }
        catch{
            print("Error Main Page")
        }
        self.entryTableView.reloadData()
        
    }
}

