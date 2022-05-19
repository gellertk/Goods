//
//  Good.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

struct Good: Codable, Hashable, Identifiable {
    
    let id: String
    let desc: String
    let image: String
    let name: String
    let price: Int
    var rating = Int.random(in: 3...5)
    var imageData = UIImage()
    
    enum CodingKeys: String, CodingKey {
        case desc
        case id
        case image
        case name
        case price
        //case imageData
    }
    
}
