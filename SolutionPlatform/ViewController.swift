//
//  ViewController.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 28.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        homeNavBar()
        //accessNavBar()
    }

    
    
    
    //MARK: -> Navbar functions
    func homeNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Kayıt Ol", style: .plain, target: self, action: #selector(registerPage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Giriş Yap", style: .plain, target: self, action: #selector(loginPage))
    }
    
    func accessNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createEntry))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profil", style: .plain, target: self, action: #selector(profilePage))
    }
    
    
    //MARK: -> objc Func

    @objc func createEntry(){
        performSegue(withIdentifier: "createEntry", sender: nil)
    }
    @objc func registerPage(){
        performSegue(withIdentifier: "registerPage", sender: nil)
    }
    @objc func loginPage(){
        performSegue(withIdentifier: "loginPage", sender: nil)
    }
    @objc func profilePage(){
        performSegue(withIdentifier: "profilePage", sender: nil)
    }
}

