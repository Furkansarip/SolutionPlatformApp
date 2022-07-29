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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var entryTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var entryArray = [AllEntry]()
    var newEntryArray = [AllEntry]()
    var filteredData : [AllEntry]!
        override func viewDidLoad() {

        super.viewDidLoad()
        homeNavBar()
            APIFunctions.functions.delegate = self
            APIFunctions.functions.fetchEntry()
            filteredData = newEntryArray
           // print(filteredData)
            entryTableView.dataSource = self
            entryTableView.delegate = self
            searchBar.delegate = self
           
            
            
        //accessNavBar()
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
        //if entryArray[indexPath.row].isActive == true {
            cell.textLabel?.text = filteredData[indexPath.row].header
      //  }
        
        return cell
    }
    
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
        performSegue(withIdentifier: "adminPage", sender: nil)
    }
    @objc func profilePage(){
        performSegue(withIdentifier: "profilePage", sender: nil)
    }
}



extension ViewController : DataDelegate {
    func updateArray(newArray: String) {
        do{
            entryArray = try JSONDecoder().decode([AllEntry].self , from:newArray.data(using: .utf8)!)
            for i in entryArray {
                if i.isActive == true {
                    newEntryArray.append(i)
                    //print(newEntryArray)
                }
            }
            //print(entryArray)
            filteredData = newEntryArray
        }
        catch{
            print("Error")
        }
        self.entryTableView.reloadData()
        
    }
}

