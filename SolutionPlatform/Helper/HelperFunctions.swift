//
//  HelperFunctions.swift
//  SolutionPlatform
//
//  Created by Furkan Sarı on 3.08.2022.
//

import Foundation
import UIKit

class Helper {// Yardımcı funcların olduğu bir class oluşturdum.
    static let helper = Helper()
    func addLeftImage(textField:UITextField,image:UIImage){//TextFieldlarların sol tarafına iconlar eklemek için oluşturuldu.
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: image.size.width+10, height: image.size.height+10))
        leftImageView.image = image
        textField.leftView = leftImageView
        textField.tintColor = .systemIndigo
        textField.leftViewMode = .always
    }
}
