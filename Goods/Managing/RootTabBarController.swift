//
//  RootTabBarController.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setViewControllers([
            MainNavigationController(rootViewController: GoodsViewController()),
            MainNavigationController(rootViewController: CartPhotosViewController())
        ], animated: true)
        
        if let items = tabBar.items {
            
            let titlesAndImages = K.Collection.titlesAndImages
            
            for index in titlesAndImages.indices {
                items[index].title = titlesAndImages[index].key
                items[index].image = titlesAndImages[index].value
            }
            
        }
    }
    
}
