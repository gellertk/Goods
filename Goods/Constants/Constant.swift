//
//  Constant.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

struct K {
    
    struct String {
        static let api = "http://94.127.67.113:8099/getGoods"
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
