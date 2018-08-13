//
//  Extension+NSObject.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import Foundation

extension NSObject {
    
    var theClassName: String {
        return NSStringFromClass(type(of: self))
    }
    
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
            let terminator = "\n" + theClassName + terminator
            Swift.print(items[0], separator:separator, terminator: terminator)
        #endif
    }
}

