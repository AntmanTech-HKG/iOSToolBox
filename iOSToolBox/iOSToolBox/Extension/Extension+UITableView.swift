//
//  Extension+NSObject.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import UIKit

extension UITableView {

    func reloadData(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
    
}

extension UICollectionView {
    
    func reloadData(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
    
}
