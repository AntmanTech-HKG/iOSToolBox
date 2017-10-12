//
//  Extension+NSObject.swift
//
//  Created by AntmanTech-HKG on 2/10/2017.
//
//

import Foundation

extension NSObject {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
            Swift.print(items[0], separator:separator, terminator: terminator)
        #endif
    }
}
