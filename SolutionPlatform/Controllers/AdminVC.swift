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
    @IBOutlet weak var falseTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchEntry()
        print(falseArray)
        // Do any additional setup after loading the view.
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

    

}


//MARK: -> Extension
extension AdminVC : DataDelegate{
    func updateArray(newArray: String) {
        do{
            allEntryArray = try JSONDecoder().decode([AllEntry].self, from: newArray.data(using: .utf8)!)
            
            for falseData in allEntryArray{
                if falseData.isActive == false{
                    falseArray.append(falseData)
                    print(falseArray)

                }
            }
                    }catch{
            print("Error Admin Page")
        }
    }
}
