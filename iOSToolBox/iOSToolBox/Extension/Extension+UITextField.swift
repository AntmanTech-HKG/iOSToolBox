//
//  Extension+UITextField.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import UIKit

private var maxLengths = [UITextField: Int]()

extension UITextField {
    func isValidEmail() -> Bool {
        if let text = text,text.count > 0 {
            if !text.isValidEmail() {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    func isValidLength(_ lengthLimit:Int = 0) -> Bool {
        if let text = text,text.count > lengthLimit {
            return true
        } else {
            return false
        }
    }
}

extension UITextField {

    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            addTarget(self, action: #selector(limitLength(textField:)), for: .editingChanged)
        }
    }

    @objc func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text, prospectiveText.count > maxLength else {
            return
        }

        let selection = selectedTextRange

        text = String(prospectiveText[..<prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)])
        
        selectedTextRange = selection
    }

}
