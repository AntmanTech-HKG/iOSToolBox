//
//  Extension+UIView.swift
//  
//
//  Created by Anthony on 25/6/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var width:CGFloat { return self.bounds.size.width }
    var height:CGFloat { return self.bounds.size.height }
    var top:CGFloat { return self.frame.origin.y }
    var left:CGFloat { return self.frame.origin.x }
    var right:CGFloat { return left + width }
    var bot:CGFloat { return top + height }
}
