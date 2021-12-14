//
//  SampleViewController.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/11.
//

import UIKit

// MARK: - Controller
final class SampleViewController: UIViewController {

    private let models = ["apple", "orange", "banana", "melon", "lemon"]

    private let registration = UICollectionView.CellRegistration<UICollectionViewCell, String>() { cell, indexPath, name in
        var config = UIListContentConfiguration.cell()
        config.text = name
        config.secondaryText = "text"
        cell.contentConfiguration = config
        cell.backgroundColor = .yellow
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100.0, height: 100.0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.backgroundColor = .white
        return collection
    }()

    override func loadView() {
        self.view = collectionView
    }
}

// MARK: - UICollectionViewDataSource
extension SampleViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: models[indexPath.item])
    }
}
