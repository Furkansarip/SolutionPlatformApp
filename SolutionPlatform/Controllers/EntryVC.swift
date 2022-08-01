//
//  EntryVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 27.07.2022.
//

import UIKit

class EntryVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var solutionTextField: UITextField!
    var categoryData = ["Yazılım","Donanım","Diğer"]
    var categoryText = ""
    @IBOutlet weak var tagsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        categoryText = categoryData[0]
        
        
        // Do any additional setup after loading the view.
    }
    


    @IBAction func createEntry(_ sender: Any) {
        APIFunctions.functions.createEntry(header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, category: categoryText, tags: tagsTextField.text!, userId: activeUser)
        makeAlert(title: "Kayıt Oluşturuldu.", message: "Konunuz Açılmıştır!")
    }
    
    // MARK: -> Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryText = categoryData[row]
        print(categoryText)
    }
    

    //MARK: -> Alert
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
       
        
        
    }
    
    
}
