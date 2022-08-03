//
//  LoginVC.swift
//  HataPaylasimv3
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit

protocol LoginDelegate{
    func updateUser(newUsers:String)
}

class LoginVC: UIViewController {
    var allUserArray = [User]()
    @IBOutlet weak var loginButtonSettings: UIButton!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let username = UIImage(systemName: "person.fill")
        let lock = UIImage(systemName: "lock.fill")
        loginImage.layer.cornerRadius =  loginImage.frame.height/2
        APIFunctions.functions.loginDelegate = self
        APIFunctions.functions.fetchUser()
        print(allUserArray)
        loginButtonSettings.layer.cornerRadius = 50
        loginButtonSettings.backgroundColor = .systemIndigo
        loginButtonSettings.titleLabel?.textColor = .white
        
        Helper.helper.addLeftImage(textField: mailTextField, image: username!)
        Helper.helper.addLeftImage(textField: passwordTextField, image: lock!)
        
        
    }
    
    
   
    
    @IBAction func loginButton(_ sender: Any) {
        for users in allUserArray {
            if mailTextField.text != "" && passwordTextField.text != ""{
                if users.mail == mailTextField.text && users.password == passwordTextField.text{
                    
                    var userMail = users.mail
                    activeUser = userMail
                    CustomPopUp.popup.showAlert(title: "Giriş Başarılı", message: "Hoşgeldiniz!", type: .success)
                    navigationController?.popViewController(animated: true)
                    break
                    
                }else if mailTextField.text == "admin"{
                    performSegue(withIdentifier: "adminPage", sender: nil)
                    break
                }
                else {
                    CustomPopUp.popup.showAlert(title: "Giriş Başarısız", message: "Kullanıcı Adı veya Şifre Hatalı!", type: .fail)
                }
            }
            else {
                CustomPopUp.popup.showAlert(title: "Giriş Başarısız", message: "Kullanıcı Adı veya Şifre Boş!", type: .fail)
                
            }
        }
    }
    

   

}





extension LoginVC : LoginDelegate {
    
    func updateUser(newUsers: String) {
        do{
            allUserArray = try JSONDecoder().decode([User].self, from: newUsers.data(using: .utf8)!)
            
            for userData in allUserArray{
                print(userData)
                }
            }
            catch{
            print("OF")
        }
    }

}
