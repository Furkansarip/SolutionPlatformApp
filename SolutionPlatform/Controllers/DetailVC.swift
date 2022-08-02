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
    @IBOutlet weak var deleteButton: UIButton!
    var detailHeader = ""
    var detailDesc = ""
    var detailSolution = ""
    var detailCat = ""
    var detailTags = ""
    var detailUser = ""
    var entryId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "hello"
        headerTextField.text = detailHeader
        tagsTextField.text = detailTags
        categoryTextField.text = detailCat
        solutionTextField.text = detailSolution
        descriptionTextField.text = detailDesc
       /* print(entryId)
        print(detailUser)
        print("active : \(activeUser)")*/
        updateButton.isHidden = true
        deleteButton.isHidden = true
        print(entryId)
        
        
        if detailUser == activeUser {
            headerTextField.isUserInteractionEnabled = true
            tagsTextField.isUserInteractionEnabled = true
            categoryTextField.isUserInteractionEnabled = true
            solutionTextField.isUserInteractionEnabled = true
            descriptionTextField.isUserInteractionEnabled = true
            updateButton.isHidden = false
            deleteButton.isHidden = false
            
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateEntry(_ sender: Any) {
        APIFunctions.functions.updateEntry(id:entryId,header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, tags: tagsTextField.text!, category: categoryTextField.text!)
        CustomPopUp.popup.showAlert(title: "Kayıt Güncellendi!", message: "Kayıt Güncelleme işleminiz tamamlanmıştır!", type: .success)
        navigationController?.popViewController(animated: true)
        
        //print(entryId)
    }
    
    @IBAction func deleteEntry(_ sender: Any) {
        APIFunctions.functions.deleteEntry(id: entryId)
        CustomPopUp.popup.showAlert(title: "Kayıt Silindi!", message: "Konu veritabanından silindi!", type: .success)
        navigationController?.popViewController(animated: true)
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
