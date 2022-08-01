//
//  DetailVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var headerTextField: UITextField!
    
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var solutionTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    var detailHeader = ""
    var detailDesc = ""
    var detailSolution = ""
    var detailCat = ""
    var detailTags = ""
    var detailUser = ""
    var entryId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        headerTextField.text = detailHeader
        tagsTextField.text = detailTags
        categoryTextField.text = detailTags
        solutionTextField.text = detailSolution
        descriptionTextField.text = detailDesc
       /* print(entryId)
        print(detailUser)
        print("active : \(activeUser)")*/
        updateButton.isHidden = true
        
        
        if detailUser == activeUser {
            headerTextField.isUserInteractionEnabled = true
            tagsTextField.isUserInteractionEnabled = true
            categoryTextField.isUserInteractionEnabled = true
            solutionTextField.isUserInteractionEnabled = true
            descriptionTextField.isUserInteractionEnabled = true
            updateButton.isHidden = false
            
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateEntry(_ sender: Any) {
        APIFunctions.functions.updateEntry(id:entryId,header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, tags: tagsTextField.text!, category: categoryTextField.text!)
        
        //print(entryId)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
