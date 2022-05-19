//
//  MainNavigationController.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

private extension MainNavigationController {
    
    func setup() {
        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBar.prefersLargeTitles = true
    }
    
}
 
