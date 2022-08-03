//
//  RegisterVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 27.07.2022.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButtonSettings: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let username = UIImage(systemName: "person.fill")
        let lock = UIImage(systemName: "lock.fill")
        registerButtonSettings.layer.cornerRadius = 50
        registerButtonSettings.backgroundColor = .systemIndigo
        registerButtonSettings.titleLabel?.textColor = .white
        
        Helper.helper.addLeftImage(textField: mailTextField, image: username!)
        Helper.helper.addLeftImage(textField: passwordTextField, image: lock!)
    }
    
    @IBAction func createUser(_ sender: Any) {
        if mailTextField.text != "" && passwordTextField.text != "" {
            APIFunctions.functions.createUser(mail: mailTextField.text!, password: passwordTextField.text!)
            CustomPopUp.popup.showAlert(title: "Kayıt Başarılı", message: "Kaydınız Gerçekleşti. Giriş Yaparak konu açabilirsiniz.", type: .success)
            navigationController?.popViewController(animated: true)
        }else {
            CustomPopUp.popup.showAlert(title: "İşlem Başarısız", message: "Değerler boş olamaz", type: .fail)
        }
        
        
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
