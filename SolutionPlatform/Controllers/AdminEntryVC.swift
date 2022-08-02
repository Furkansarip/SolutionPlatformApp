//
//  AdminEntryVC.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 1.08.2022.
//

import UIKit


class AdminEntryVC: UIViewController {
    var header = ""
    var desc = ""
    var solution = ""
    var category = ""
    var tags = ""
    var objectId = ""
    var user = ""

    @IBOutlet weak var headerTextfield: UITextField!
    @IBOutlet weak var descTextfield: UITextField!
    @IBOutlet weak var solutionTextfield: UITextField!
    @IBOutlet weak var catTextfield: UITextField!
    @IBOutlet weak var tagsTextfield: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headerTextfield.text = header
        descTextfield.text = desc
        solutionTextfield.text = solution
        catTextfield.text = category
        tagsTextfield.text = tags
        userTextField.text = user
        print(objectId)
    }
    


    @IBAction func entryApply(_ sender: Any) {
        APIFunctions.functions.applyEntry(id: objectId, header: headerTextfield.text!, description: descTextfield.text!, solution: solutionTextfield.text!, tags: tagsTextfield.text!, category: catTextfield.text!,isActive: true)
        CustomPopUp.popup.showAlert(title: "Kayıt Onaylandı", message: "Kullanıcı kaydı aktif duruma geçti!", type: .success)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteEntry(_ sender: Any) {
        APIFunctions.functions.deleteEntry(id: objectId)
        CustomPopUp.popup.showAlert(title: "Kayıt Silindi!", message: "Entry veritabanından silindi!", type: .success)
        navigationController?.popViewController(animated: true)
    }
    
    
}
