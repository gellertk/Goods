//
//  PhotosView.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 17.05.2022.
//

import UIKit

class GoodsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: createCompositionalLayout())
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                             heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 3,
                                                     leading: 3,
                                                     bottom: 3,
                                                     trailing: 3)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalHeight(0.3)),
                                                       subitem: item,
                                                       count: 2)
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

private extension GoodsView {
    
    func setupView() {
        backgroundColor = .white
        addSubviews([collectionView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}
