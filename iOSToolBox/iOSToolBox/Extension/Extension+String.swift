//
//  Extension+String.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }
    
    func verifyUrl() -> Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        } else {
            return false
        }
    }
    
    func isValidEmail() -> Bool {
        if self.count <= 0 {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}

extension String {
    func convertHtml() -> NSAttributedString {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
