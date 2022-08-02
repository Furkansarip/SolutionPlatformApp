//
//  EntryVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 27.07.2022.
//

import UIKit
protocol CategoryDelegate {
    func categoryList(newCategory:String)
}
class EntryVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var headerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var solutionTextField: UITextField!
    var categoryData = [CategoryInfo]()
    var categoryArray = [CategoryInfo]()
    var categoryText = ""
    @IBOutlet weak var tagsTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.categoryDelegate = self
        APIFunctions.functions.fetchCategory()
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        var utf8text = tagsTextField.text?.utf8
        print(utf8text)
        //categoryText = categoryData[0].categoryName
        print(categoryArray)
        // Do any additional setup after loading the view.
    }
    


    @IBAction func createEntry(_ sender: Any) {
        APIFunctions.functions.createEntry(header: headerTextField.text!, description: descriptionTextField.text!, solution: solutionTextField.text!, category: categoryText, tags: tagsTextField.text!, userId: activeUser)
        CustomPopUp.popup.showAlert(title: "Kayıt Oluşturuldu!", message: "Admin tarafından onaylandıktan sonra konunuz aktif hale gelecektir!", type: .success)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: -> Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryText = categoryArray[row].name
        print(categoryText)
    }
    

  
    
    
}
extension EntryVC : CategoryDelegate {
    func categoryList(newCategory: String) {
        do{
            categoryData = try JSONDecoder().decode([CategoryInfo].self , from: newCategory.data(using: .utf8)!)
            for cat in categoryData {
                categoryArray.append(cat)
                
            }
           
            
        }
        catch{
            print("Error Category")
        }
        self.categoryPicker.reloadAllComponents()
        
        
    }
    
    
}
