//
//  AnimalCell.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/13.
//

import UIKit

// MARK: - Model
struct AnimalModel: Hashable {
    var name: String
}

// MARK: - Cell
final class AnimalCell: UICollectionViewListCell {

    // MARK: Property

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .orange
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    required convenience init?(coder: NSCoder) {
        self.init(frame: .zero)
    }

    // MARK: Internal Method

    func configure(with model: AnimalModel) {
        nameLabel.text = model.name
    }
}
