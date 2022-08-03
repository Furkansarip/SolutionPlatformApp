//
//  DetailVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var headerTextField: UITextField!
    
    @IBOutlet weak var adminDelete: UIButton!
    @IBOutlet weak var activeSwitch: UISwitch!
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var solutionTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var activeText: UILabel!
    var detailHeader = ""
    var detailDesc = ""
    var detailSolution = ""
    var detailCat = ""
    var detailTags = ""
    var detailUser = ""
    var entryId = ""
    var detailStatus : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if detailStatus == true {
            activeSwitch.isOn = true
        }
        else {
            activeSwitch.isOn = false
        }
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
        print("detail: -> \(entryId)")
        navigationItem.title = detailUser
        
        
        if detailUser == activeUser {
            headerTextField.isUserInteractionEnabled = true
            tagsTextField.isUserInteractionEnabled = true
            categoryTextField.isUserInteractionEnabled = true
            solutionTextField.isUserInteractionEnabled = true
            descriptionTextField.isUserInteractionEnabled = true
            updateButton.isHidden = false
            deleteButton.isHidden = false
            
            
        }else if activeUser == "admin" {
            headerTextField.isUserInteractionEnabled = true
            tagsTextField.isUserInteractionEnabled = true
            categoryTextField.isUserInteractionEnabled = true
            solutionTextField.isUserInteractionEnabled = true
            descriptionTextField.isUserInteractionEnabled = true
            activeSwitch.isHidden = false
            adminDelete.isHidden = false
            activeText.isHidden = false
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
   
    @IBAction func deleteAdminEntry(_ sender: Any) {
        APIFunctions.functions.deleteEntry(id: entryId)
        CustomPopUp.popup.showAlert(title: "Kayıt Silindi!", message: "Konu veritabanından silindi!", type: .success)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func activeStatus(_ sender: Any) {
        if activeSwitch.isOn {
            APIFunctions.functions.applyEntry(id: entryId, header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, tags: tagsTextField.text!, category: categoryTextField.text!, isActive: true)
            CustomPopUp.popup.showAlert(title: "Kayıt Onaylandı", message: "Kullanıcı kaydı aktif duruma geçti!", type: .success)
        }
        else if activeSwitch.isOn == false {
            APIFunctions.functions.falseStatus(id: entryId, header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, tags: tagsTextField.text!, category: categoryTextField.text!, isActive: false)
            CustomPopUp.popup.showAlert(title: "Durum Değişti", message: "Kullanıcı kaydı pasif duruma geçti!", type: .success)
            print(activeSwitch.isOn)
        }
    }
}
