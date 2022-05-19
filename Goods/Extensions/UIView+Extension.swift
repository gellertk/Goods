//
//  UINavigationController+Extension.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 17.05.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
}


