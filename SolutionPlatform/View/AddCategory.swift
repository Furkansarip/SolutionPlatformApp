//
//  AddCategory.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 2.08.2022.
//

import UIKit

class AddCategory: UIView {
    static let category = AddCategory()
    @IBOutlet weak var categoryName: UITextField!
    @IBOutlet var categoryView: UIView!
    
   
    @IBOutlet weak var addCategory: UIButton!
    
    override init (frame:CGRect){
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AddCategory", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    private func commonInit(){
        
        
        categoryView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        categoryView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    func showCategory(){
        UIApplication.shared.keyWindow?.addSubview(categoryView)
    }
    
    func closeCategory(){
        categoryView.removeFromSuperview()
    }
    
    
    @IBAction func addCategoryButton(_ sender: Any) {
        if categoryName.text != ""{
            APIFunctions.functions.createCategory(name: categoryName.text!)
            CustomPopUp.popup.showAlert(title: "Başarılı!", message: "Kategori oluşturuldu!", type: .success)
            categoryView.removeFromSuperview()

            
        }else{
            CustomPopUp.popup.showAlert(title: "Hatalı Giriş", message: "Kategori Adı Boş Olamaz!", type: .fail)
        }
        
    }
    
    @IBAction func cancelCategory(_ sender: Any) {
        closeCategory()
    }
    
    
}
