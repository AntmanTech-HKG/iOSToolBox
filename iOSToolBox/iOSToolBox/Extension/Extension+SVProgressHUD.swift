//
//  Extension+SVProgressHUD.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import Foundation
import SVProgressHUD

extension SVProgressHUD {
    
    open func showSuccess(withText text: String, duration: Double, completion: @escaping () -> ()) {
        SVProgressHUD.showSuccess(withStatus: text)
        SVProgressHUD.dismiss(withDelay: duration)
        completion()
    }
    
}
