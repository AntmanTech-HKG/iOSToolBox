//
//  Extension+UIFont.swift
//
//
//  Created by Anthony on 4/4/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import UIKit

enum Font {
    case systemBold
    case systemThin
    case systemBlack
    case systemHeavy
    case systemLight
    case systemMedium
    case systemRegular
    case systemSemibold
    case systemUltraLight
}

extension UIFont {
    class func getFont(_ fontEnum: Font, size: CGFloat) -> UIFont {
        var font: UIFont?
        switch fontEnum {
        case .systemBold:
            font = UIFont.systemFont(ofSize: size, weight: .bold)
        case .systemThin:
            font = UIFont.systemFont(ofSize: size, weight: .thin)
        case .systemBlack:
            font = UIFont.systemFont(ofSize: size, weight: .black)
        case .systemHeavy:
            font = UIFont.systemFont(ofSize: size, weight: .heavy)
        case .systemLight:
            font = UIFont.systemFont(ofSize: size, weight: .light)
        case .systemMedium:
            font = UIFont.systemFont(ofSize: size, weight: .medium)
        case .systemRegular:
            font = UIFont.systemFont(ofSize: size, weight: .regular)
        case .systemSemibold:
            font = UIFont.systemFont(ofSize: size, weight: .semibold)
        case .systemUltraLight:
            font = UIFont.systemFont(ofSize: size, weight: .ultraLight)
        }
        if let font = font {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
}
