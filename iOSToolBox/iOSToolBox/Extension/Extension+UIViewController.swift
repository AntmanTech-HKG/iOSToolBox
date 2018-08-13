//
//  Extension+UIViewController.swift
//  
//
//  Created by Anthony on 25/6/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import UIKit
extension UIViewController {
    func setTitle(title: String) {
        let titleView = UILabel()
        titleView.text = title
        titleView.font = UIFont.getFont(.systemSemibold, size: 17)
        titleView.textColor = .black
        titleView.textAlignment = .center
        titleView.sizeToFit()
        self.navigationItem.titleView = titleView
    }
    
    func getKeyWindow() -> UIWindow {
        return UIApplication.shared.keyWindow!
    }
}

