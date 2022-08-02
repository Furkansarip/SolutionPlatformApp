//
//  AdminVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit

class AdminVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var allEntryArray = [AllEntry]()
    var falseArray = [AllEntry]()
    var adminHeader = ""
    var adminDesc = ""
    var adminSolution = ""
    var adminCat = ""
    var adminTags = ""
    var adminEntryId = ""
    var adminUser = ""
    @IBOutlet weak var falseTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       APIFunctions.functions.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Kategori Ekle", style: .plain, target: self, action:#selector(addCategory))
        
       
        falseTableView.delegate = self
        falseTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        falseArray.removeAll(keepingCapacity: false)
        APIFunctions.functions.fetchEntry()
    }
    
    
    
    //MARK: -> TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        falseArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = UITableViewCell()
        cells.textLabel?.text = falseArray[indexPath.row].header
        return cells
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        adminCat = falseArray[indexPath.row].category
        adminDesc = falseArray[indexPath.row].description
        adminTags = falseArray[indexPath.row].tags
        adminSolution = falseArray[indexPath.row].solution
        adminHeader = falseArray[indexPath.row].header
        adminEntryId = falseArray[indexPath.row]._id
        adminUser = falseArray[indexPath.row].userId
        
        performSegue(withIdentifier: "adminApply", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adminApply"{
            let destination = segue.destination as! AdminEntryVC
            destination.header = adminHeader
            destination.solution = adminSolution
            destination.tags = adminTags
            destination.category = adminCat
            destination.desc = adminDesc
            destination.objectId = adminEntryId
            destination.user = adminUser
        }
        
    }
    
    @objc func addCategory(){
        AddCategory.category.showCategory()
    }
    

}


//MARK: -> Extension
extension AdminVC : DataDelegate{
    func updateArray(newArray: String) {
        do{
            allEntryArray = try JSONDecoder().decode([AllEntry].self, from: newArray.data(using: .utf8)!)
            
            for falseData in allEntryArray{
                if falseData.isActive == false{
                    falseArray.append(falseData)
                    //print(falseData._id)
                    //print(falseData.tags)
                }
            }
                    }catch{
            print("Error Admin Page")
        }
        self.falseTableView.reloadData()
    }
}


