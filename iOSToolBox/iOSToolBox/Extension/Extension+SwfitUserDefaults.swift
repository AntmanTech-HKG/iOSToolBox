//
//  Extension+SwfitUserDefaults.swift

//
//  Created by Anthony on 6/4/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import SwiftyUserDefaults
import SwiftyJSON

extension DefaultsKeys {
    static let apnsToken = DefaultsKey<String?>("apnsToken")
    static let languagePack = DefaultsKey<Data?>("languagePack")
    static let currentLanguage = DefaultsKey<String?>("currentLanguage")
    static let isFirstOpenApp = DefaultsKey<Bool?>("isFirstOpenApp")
}

