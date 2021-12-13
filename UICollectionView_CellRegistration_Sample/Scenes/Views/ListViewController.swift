//
//  ListViewController.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/11.
//

import UIKit

// MARK: - Controller
final class ListViewController: UICollectionViewController {

    // MARK: Enum

    enum Section: Int, CaseIterable {
        case sample, sampleDataSource

        var name: String {
            switch self {
            case .sample:
                return "1) CellRegistration の実装例"
            case .sampleDataSource:
                return "2) CellRegistration を複数を使った実装例"
            }
        }

        var controller: UIViewController {
            switch self {
            case .sample:
                return SampleViewController()
            case .sampleDataSource:
                return MultipleViewController()
            }
        }
    }

    // MARK: Property

    private let registration = UICollectionView.CellRegistration<UICollectionViewCell, Section>() { cell, indexPath, section in
        var config = UIListContentConfiguration.cell()
        config.text = section.name
        cell.contentConfiguration = config
    }

    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 44)
        return layout
    }()

    // MARK: Initializer

    init() {
        super.init(collectionViewLayout: layout)
        collectionView.backgroundColor = .white
    }

    required convenience init?(coder: NSCoder) {
        self.init()
    }

    // MARK: Override

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        Section.allCases.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        collectionView.dequeueConfiguredReusableCell(using: registration,
                                                     for: indexPath,
                                                     item: Section(rawValue: indexPath.row))
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {

        guard let vc = Section(rawValue: indexPath.row)?.controller else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
