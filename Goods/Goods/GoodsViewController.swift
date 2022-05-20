//
//  ViewController.swift
//  Unsplash
//
//  Created by Кирилл  Геллерт on 17.05.2022.
//

import UIKit

class GoodsViewController: UIViewController {
    
    fileprivate enum Section {
        case main
    }
    
    fileprivate typealias CellRegistrationType = UICollectionView.CellRegistration<GoodsCollectionViewCell, Product>
    fileprivate typealias DataSourceType = UICollectionViewDiffableDataSource<Section, Product>
    fileprivate typealias SnapshotType = NSDiffableDataSourceSnapshot<Section, Product>
    
    private var dataSource: DataSourceType!
    
    private lazy var products: [Product] = []
    
    private let goodsView = GoodsView()
        
    override func loadView() {
        view = goodsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Товары"
        fetchData()
        setupDataSource()
    }
    
}

private extension GoodsViewController {
    
    func fetchData() {
        NetworkService.shared.fetchData { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let pageData):
                self.products = pageData.products
                DispatchQueue.main.async {
                    self.setupDataSource()
                }
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func createCellRegistration() -> CellRegistrationType {
        return CellRegistrationType { [weak self] cell, indexPath, product in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                cell.imageRequest = NetworkService.shared.downloadImage(from: product.productImage, product: product) { [weak self] (fetchedItem, image) in
                    guard let self = self else {
                        return
                    }
                    if let img = image, img != fetchedItem.image {
                        var updatedSnapshot = self.dataSource.snapshot()
                        if let datasourceIndex = updatedSnapshot.indexOfItem(fetchedItem) {
                            self.products[datasourceIndex].image = img
                            updatedSnapshot.reloadItems([self.products[datasourceIndex]])
                            self.dataSource.apply(updatedSnapshot, animatingDifferences: true)
                        }
                    }
                }
                cell.configure(with: self.products[indexPath.row])
            }
            
        }
    }
    
    func setupDataSource() {
        let goodCellRegistration = createCellRegistration()
        
        dataSource = DataSourceType(collectionView: goodsView.collectionView, cellProvider: { collectionView, indexPath, product in
            
            return collectionView.dequeueConfiguredReusableCell(using: goodCellRegistration,
                                                                for: indexPath,
                                                                item: product)
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = SnapshotType()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        dataSource?.apply(snapshot)
    }

}

