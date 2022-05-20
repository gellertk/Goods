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
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                     leading: 5,
                                                     bottom: 5,
                                                     trailing: 5)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                          heightDimension: .fractionalHeight(0.3)),
                                                       subitem: item,
                                                       count: 2)
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                      leading: 10,
                                                      bottom: 0,
                                                      trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

private extension GoodsView {
    
    func setupView() {
        backgroundColor = .white
        collectionView.backgroundColor = .white
        addSubviews([collectionView])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
