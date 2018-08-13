//
//  Extension+Int.swift
//  OneFamilyNews
//
//  Created by Anthony on 2/10/2017.
//  Copyright © 2017 AntmanTech. All rights reserved.
//

import Foundation

extension Int {
    init(_ range: Range<Int> ) {
        let delta = range.lowerBound < 0 ? abs(range.lowerBound) : 0
        let min = UInt32(range.lowerBound + delta)
        let max = UInt32(range.upperBound   + delta)
        self.init(Int(min + arc4random_uniform(max - min)) - delta)
    }
}
