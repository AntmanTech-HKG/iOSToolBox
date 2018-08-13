//
//  Extension+Enum.swift
//  
//
//  Created by Anthony on 9/8/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import Foundation

protocol CaseCountable {
    static var caseCount: Int { get }
}

extension CaseCountable where Self: RawRepresentable, Self.RawValue == Int {
    internal static var caseCount: Int {
        var count = 0
        while let _ = Self(rawValue: count) {
            count += 1
        }
        return count
    }
}
