//
//  FavouritesPhotosViewController.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 17.05.2022.
//

import UIKit

class CartPhotosViewController: UIViewController {

    private let cartPhotosView = CartPhotosView()

    override func loadView() {
        view = cartPhotosView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Корзина"
    }

}
