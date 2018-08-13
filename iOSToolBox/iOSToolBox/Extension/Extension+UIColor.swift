//
//  Extension+UIColor.swift

//
//  Created by Anthony on 4/4/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import UIKit

extension UIColor {
    class func rgba(_ r:CGFloat,_ g:CGFloat? = nil,_ b:CGFloat? = nil,_ a:CGFloat = 1) -> UIColor {
        if let g = g, let b = b {
            return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        } else {
            return UIColor(red: r/255.0, green: r/255.0, blue: r/255.0, alpha: a)
        }
    }
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(r: r, g: g, b: b, a: 1.0)
    }
    
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
}
