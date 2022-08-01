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

    @IBOutlet weak var headerTextfield: UITextField!
    @IBOutlet weak var descTextfield: UITextField!
    @IBOutlet weak var solutionTextfield: UITextField!
    @IBOutlet weak var catTextfield: UITextField!
    @IBOutlet weak var tagsTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headerTextfield.text = header
        descTextfield.text = desc
        solutionTextfield.text = solution
        catTextfield.text = category
        tagsTextfield.text = tags
        print(objectId)
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
