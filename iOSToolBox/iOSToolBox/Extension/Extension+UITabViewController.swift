//
//  Extension+UITabViewController.swift
//  
//
//  Created by Anthony on 25/6/2018.
//  Copyright © 2018 AntmanTech. All rights reserved.
//

import UIKit

extension UITabBarController {
    func createTabBarItem(image: UIImage, selectedimage: UIImage) -> UITabBarItem {
        //        let resizedImage = image.resizeImage(targetSize: CGSize(width: 30, height: 30))
        //        let resizedSelectedImage = selectedimage.resizeImage(targetSize: CGSize(width: 30, height: 30))
        
        let item = UITabBarItem(title: nil, image: image, selectedImage: selectedimage)
        item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return item
    }
}
