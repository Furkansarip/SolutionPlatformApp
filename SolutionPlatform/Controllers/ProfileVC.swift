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

    @IBOutlet weak var profileView: UITableView!
    var userAllEntry = [AllEntry]()
    var singleEntry = [AllEntry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.profileDelegate = self
        APIFunctions.functions.fetchProfile()
        profileView.delegate = self
        profileView.dataSource = self
        print("prof \(activeUser)")
        // Do any additional setup after loading the view.
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = singleEntry[indexPath.row].header
        headerText = singleEntry[indexPath.row].header
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "profileDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let destination = segue.destination as! DetailVC
        destination.detailHeader = headerText
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
                    print(userEntry)
                }
            }
                    }catch{
            print("Error Profile Page")
        }
        self.profileView.reloadData()
    }
    
    
}
