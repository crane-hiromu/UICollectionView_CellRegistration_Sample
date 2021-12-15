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
        C: UICollectionViewCell
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

    func dequeueReusableCell<C: UICollectionViewCell>(
        type: C.Type,
        at indexPath: IndexPath,
        handler: @escaping (C, IndexPath) -> Void = { _, _ in }
    ) -> UICollectionViewCell {
        /// モデルがないのでStringを設定しておく
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, String>(
                cellNib: UINib(nibName: String(describing: type.self), bundle: nil),
                handler: { c, i, _ in handler(c, i) }
            ),
            for: indexPath,
            item: ""
        )
    }

    // dequeue from class
    func dequeueReusableCell<C, I>(
        class: C.Type,
        with item: I,
        at indexPath: IndexPath,
        handler: @escaping UICollectionView.CellRegistration<C, I>.Handler
    ) -> UICollectionViewCell where
        C: UICollectionViewCell
    {
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, I>(
                handler: handler
            ),
            for: indexPath,
            item: item
        )
    }

    func dequeueReusableCell<C: UICollectionViewCell>(
        class: C.Type,
        at indexPath: IndexPath,
        handler: @escaping (C, IndexPath) -> Void = { _, _ in }
    ) -> UICollectionViewCell {
        /// モデルがないのでStringを設定しておく
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, String>(
                handler: { c, i, _ in handler(c, i) }
            ),
            for: indexPath,
            item: ""
        )
    }
}
