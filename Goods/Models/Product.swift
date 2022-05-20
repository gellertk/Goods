//
//  Good.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

struct PageData: Codable {
    let products: [Product]
}

class Product: Codable, Hashable, Identifiable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
    
    let productName: String
    let productId: Int
    let productImage: URL
    let id = UUID()
    var image: UIImage = UIImage()
    //let desc: String
//    let price: Int
//    var rating = Int.random(in: 3...5)
//    var imageData = UIImage()

    enum CodingKeys: String, CodingKey {
        case productName
        case productId
        case productImage
        //case price
        //case imageData
    }

}
