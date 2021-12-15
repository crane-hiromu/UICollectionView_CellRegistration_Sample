//
//  SportCell.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/13.
//

import UIKit

// MARK: - Model
struct SportModel {
    var name: String
}

// MARK: - Cell
final class SportCell: UICollectionViewCell {

    // MARK: Property

    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: Internal Method

    func configure(with model: SportModel) {
        nameLabel.text = model.name
    }
}
