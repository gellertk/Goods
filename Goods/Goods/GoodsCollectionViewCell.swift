//
//  GoodsCollectionViewCell.swift
//  Goods
//
//  Created by Кирилл  Геллерт on 19.05.2022.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GoodsCollectionViewCell"
    
    var imageRequest: Cancellable?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption2)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        return label
    }()
    
    private lazy var toCartButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        button.configuration?.image = UIImage(systemName: "cart.circle.fill",
                                              withConfiguration: configuration)
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .green
        button.configuration?.baseBackgroundColor = .white
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageRequest?.cancel()
        imageRequest = nil
    }
    
    func configure(with good: Product) {
        imageView.image = good.image
//        ratingLabel.text = "\(good.rating)"
//        nameLabel.text = good.name
//        descriptionLabel.text = good.desc
//        priceLabel.text = "\(good.price) ₽"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                        cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
}

private extension GoodsCollectionViewCell {
    
    func setupView() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        layer.cornerRadius = 12
        layer.masksToBounds = false
        
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor

        backgroundColor = .white
        contentView.addSubviews([imageView,
//                                 ratingLabel,
//                                 nameLabel,
//                                 descriptionLabel,
//                                 priceLabel,
//                                 toCartButton
                                ])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: centerYAnchor),
            
//            ratingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
//            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
