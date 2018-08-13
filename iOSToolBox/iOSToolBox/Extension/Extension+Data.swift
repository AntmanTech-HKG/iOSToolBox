//
//  Extension+Data.swift

//
//  Created by Anthony on 6/4/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import Foundation

extension Data {

    func hexString() -> String {
        return reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
    }

}
