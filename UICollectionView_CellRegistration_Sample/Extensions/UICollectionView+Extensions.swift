//
//  UICollectionView+Extensions.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/14.
//

import UIKit

// MARK: - UICollectionView Extension
extension UICollectionView {

    // MARK: CellRegistration

    // dequeue from UINib
    func dequeueReusableCell<C, I>(
        type: C.Type,
        with item: I,
        at indexPath: IndexPath,
        handler: @escaping UICollectionView.CellRegistration<C, I>.Handler
    ) -> UICollectionViewCell where
        C: UICollectionViewListCell,
        I: Hashable
    {
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, I>(
                cellNib: UINib(nibName: String(describing: type.self), bundle: nil),
                handler: handler
            ),
            for: indexPath,
            item: item
        )
    }

    // dequeue from class
    func dequeueReusableCell<C, I>(
        class: C.Type,
        with item: I,
        at indexPath: IndexPath,
        handler: @escaping UICollectionView.CellRegistration<C, I>.Handler
    ) -> UICollectionViewCell where
        C: UICollectionViewListCell,
        I: Hashable
    {
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, I>(
                handler: handler
            ),
            for: indexPath,
            item: item
        )
    }
}
