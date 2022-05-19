//
//  FavouritePhotosView.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 17.05.2022.
//

import UIKit

class CartPhotosView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CartPhotosView {
    
    func setupView() {
        backgroundColor = .white
        //addSubviews([])
    }
    
}
