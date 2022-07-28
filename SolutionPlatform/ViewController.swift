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

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var entryTableView: UITableView!
    
    
    var entryArray = [AllEntry]()
        override func viewDidLoad() {

        super.viewDidLoad()
        homeNavBar()
            APIFunctions.functions.delegate = self
            APIFunctions.functions.fetchEntry()
            print(entryArray)
            entryTableView.dataSource = self
            entryTableView.delegate = self
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
        entryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = entryTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell()
        cell.textLabel?.text = entryArray[indexPath.row].header
        return cell
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
            print(entryArray)
        }
        catch{
            
        }
        self.entryTableView.reloadData()
        
    }
}

