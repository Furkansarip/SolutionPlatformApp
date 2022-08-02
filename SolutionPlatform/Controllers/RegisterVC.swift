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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createUser(_ sender: Any) {
        APIFunctions.functions.createUser(mail: mailTextField.text!, password: passwordTextField.text!)
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
