//
//  CustomPopUp.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 2.08.2022.
//

import UIKit


class CustomPopUp: UIView {
    static let popup = CustomPopUp()
    @IBOutlet var parentView2: CustomPopUp!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var alertImg: UIImageView!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var alertTitle: UILabel!
    override init (frame:CGRect){
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomPopUp", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    private func commonInit(){
        alertImg.layer.cornerRadius = 30
        alertImg.layer.borderColor = UIColor.white.cgColor
        alertImg.layer.borderWidth = 2
        
        parentView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView2.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
    enum AlertType{
        case success
        case fail
    }
    
    func showAlert(title:String,message:String,type:AlertType){
        alertTitle.text = title
        alertMessage.text = message
        switch type {
        case .success:
            alertImg.image = UIImage(named: "success")
        case .fail:
            alertImg.image = UIImage(named: "reject")
        }
        UIApplication.shared.keyWindow?.addSubview(parentView2)
    }
    @IBAction func okButton(_ sender: Any) {
        parentView2.removeFromSuperview()
    }
}
