//
//  ProfileVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit
protocol ProfileDelegate{
    func updateEntryHistory(entryHistory:String)
}
class ProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var headerText = ""
    var descText = ""
    var solutionText = ""
    var tags = ""
    var category = ""
    var entryId = ""
    var username = ""

    @IBOutlet weak var profileView: UITableView!
    var userAllEntry = [AllEntry]()
    var singleEntry = [AllEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.profileDelegate = self
        
        profileView.delegate = self
        profileView.dataSource = self
                // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        singleEntry.removeAll(keepingCapacity: false)
        APIFunctions.functions.fetchProfile()
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = singleEntry[indexPath.row].header
        
        print("profile: - > \(entryId)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        headerText = singleEntry[indexPath.row].header
        descText = singleEntry[indexPath.row].description
        solutionText = singleEntry[indexPath.row].solution
        tags = singleEntry[indexPath.row].tags
        category = singleEntry[indexPath.row].category
        username = singleEntry[indexPath.row].userId
        entryId = singleEntry[indexPath.row]._id
        performSegue(withIdentifier: "profileDetail", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let destination = segue.destination as! DetailVC
        destination.detailHeader = headerText
        destination.detailDesc = descText
        destination.entryId = entryId
        destination.detailCat = category
        destination.detailTags = tags
        destination.detailSolution = solutionText
        destination.detailUser = username
        destination.detailUser = activeUser
        
    }
}
extension ProfileVC : ProfileDelegate{
    func updateEntryHistory(entryHistory: String) {
        do{
            userAllEntry = try JSONDecoder().decode([AllEntry].self, from: entryHistory.data(using: .utf8)!)
            
            for userEntry in userAllEntry{
                if userEntry.userId == activeUser{
                    singleEntry.append(userEntry)
                    print()
                }
            }
                    }catch{
            print("Error Profile Page")
        }
        self.profileView.reloadData()
    }
    
    
}
