//
//  AllEntrysVC.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 3.08.2022.
//

import UIKit

class AllEntrysVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    var newEntryArray = [AllEntry]()
    var allEntry = [AllEntry]()
    var headerAdmin = ""
    var descAdmin = ""
    var solutionAdmin = ""
    var categoryAdmin = ""
    var tagsAdmin = ""
    var usernameAdmin = ""
    var idAdmin = ""
    var activeStatus : Bool!
    @IBOutlet weak var allEntryView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allEntryView.delegate = self
        allEntryView.dataSource = self
        APIFunctions.functions.delegate = self
        
        print(allEntry)
    }
    override func viewWillAppear(_ animated: Bool) {
        allEntry.removeAll(keepingCapacity: false)
        APIFunctions.functions.fetchEntry()//Admin sayfası olduğu için aktif durumu fark etmeksizin tüm listeyi alıyoruz.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = allEntry[indexPath.row].header
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        headerAdmin = allEntry[indexPath.row].header
        descAdmin = allEntry[indexPath.row].description
        solutionAdmin = allEntry[indexPath.row].solution
        categoryAdmin = allEntry[indexPath.row].category
        tagsAdmin = allEntry[indexPath.row].tags
        usernameAdmin = allEntry[indexPath.row].userId
        idAdmin = allEntry[indexPath.row]._id
        activeStatus = allEntry[indexPath.row].isActive
       
        performSegue(withIdentifier: "allEntryDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailVC
        destination.detailHeader = headerAdmin
        destination.detailDesc = descAdmin
        destination.detailSolution = solutionAdmin
        destination.detailCat = categoryAdmin
        destination.detailTags = tagsAdmin
        destination.detailUser = usernameAdmin
        destination.entryId = idAdmin
        destination.detailStatus = activeStatus
        activeUser = "admin"
    }
    

}

extension AllEntrysVC : DataDelegate{
   
        func updateArray(newArray: String) {
            do{
                newEntryArray = try JSONDecoder().decode([AllEntry].self , from:newArray.data(using: .utf8)!)
               // print(entryArray)
                for active in newEntryArray {
                    
                    allEntry.append(active)
                        //print(allEntry)
                    
                }
                //print(entryArray)
               
            }
            catch{
                print("Error Main Page")
            }
            self.allEntryView.reloadData()
    }
    
    
}
