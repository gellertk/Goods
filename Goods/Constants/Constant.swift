//
//  Constant.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

struct K {
    
    struct String {
        static let api = "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search?page=1"
    }
    
    struct SystemImage {
        static let good = UIImage(systemName: "display") ?? UIImage()
        static let cart = UIImage(systemName: "cart") ?? UIImage()
    }
    
    struct Collection {
        static let titlesAndImages: KeyValuePairs = [
            "Товары": K.SystemImage.good,
            "Корзина": K.SystemImage.cart
        ]
    }
    
}
