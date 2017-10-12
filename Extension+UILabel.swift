//
//  Extension+UILabel.swift
//
//  Created by AntmanTech-HKG on 2/10/2017.
//
//

import Foundation

extension UILabel {
    
    func adjustsFontSizeToFitDevice() {
        
        switch UIDevice().screenType {
        case .iPhone4, .iPhone5:
            font = font.withSize(font.pointSize - 4)
            break
        case .iPhone6:
            font = font.withSize(font.pointSize - 2)
            break
        case .iPhone6Plus:
            font = font.withSize(font.pointSize)
            break
        default:
            font = font.withSize(font.pointSize)
        }
    }
    
}
