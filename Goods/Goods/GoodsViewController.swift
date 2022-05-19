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
    
    fileprivate typealias CellRegistrationType = UICollectionView.CellRegistration<GoodsCollectionViewCell, Good.ID>
    fileprivate typealias DataSourceType = UICollectionViewDiffableDataSource<Section, Good.ID>
    fileprivate typealias SnapshotType = NSDiffableDataSourceSnapshot<Section, Good.ID>
    
    private var dataSource: DataSourceType!
    
    private lazy var goods: [Good] = []
    
    private let goodsView = GoodsView()
    
    private var imageRequest: Cancellable?
    
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
            case .success(let goods):
                self.goods = goods
                DispatchQueue.main.async {
                    self.setupDataSource()
                }
            case .failure(_):
                return
            }
        }
    }
    
    func createCellRegistration() -> CellRegistrationType {
        return CellRegistrationType { [weak self] cell, indexPath, id in
            guard let self = self else {
                return
            }
            //self?.goods[indexPath.row].imageData = image ?? UIImage()
            cell.imageRequest = NetworkService.shared.downloadImage(from: self.goods[indexPath.row].image) { [weak self] image in
                self?.updateSnapshot(with: id)
            }
            cell.configure(with: self.goods[indexPath.row], using: self.goods[indexPath.row].imageData)
        }
    }
    
    func setupDataSource() {
        let goodCellRegistration = createCellRegistration()
        
        dataSource = DataSourceType(collectionView: goodsView.collectionView, cellProvider: { collectionView, indexPath, id in
            
            return collectionView.dequeueConfiguredReusableCell(using: goodCellRegistration,
                                                                for: indexPath,
                                                                item: id)
        })
        
        applySnapshot()
    }
    
    func applySnapshot() {
        var snapshot = SnapshotType()
        snapshot.appendSections([.main])
        let itemIdentifiers = goods.map { $0.id }
        snapshot.appendItems(itemIdentifiers)
        dataSource?.apply(snapshot)
    }
    
    func updateSnapshot(with id: Good.ID) {
        var snapshot = dataSource.snapshot()
        snapshot.reconfigureItems([id])
        dataSource?.apply(snapshot)
    }
    
}

