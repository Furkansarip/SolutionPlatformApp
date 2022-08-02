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
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        APIFunctions.functions.loginDelegate = self
        APIFunctions.functions.fetchUser()
        print(allUserArray)
        
        
        
    }
   
    
    @IBAction func loginButton(_ sender: Any) {
        for users in allUserArray {
            if mailTextField.text != "" && passwordTextField.text != ""{
                if users.mail == mailTextField.text && users.password == passwordTextField.text{
                    
                    var userMail = users.mail
                    activeUser = userMail
                    CustomPopUp.popup.showAlert(title: "Giriş Başarılı", message: "Hoşgeldiniz!", type: .success)
                    navigationController?.popViewController(animated: true)
                    
                }else if mailTextField.text == "admin"{
                    performSegue(withIdentifier: "adminPage", sender: nil)
                    break
                }
                else {
                    print("Email veya şifre hatalı")
                }
            }
            else {
                print("error")
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
