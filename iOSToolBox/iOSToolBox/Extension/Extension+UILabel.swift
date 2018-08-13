//
//  Extension+UILabel.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import UIKit

extension UILabel {
    func adjustsFontSizeToFitDevice() {
        switch UIDevice().screenType {
        case .iPhone4, .iPhone5:
            font = font.withSize(font.pointSize - 5)
            break
        case .iPhone6, .iPhoneX:
            font = font.withSize(font.pointSize - 4)
            break
        case .iPhone6Plus:
            font = font.withSize(font.pointSize - 3)
            break
        default:
            font = font.withSize(font.pointSize)
        }
    }
}
