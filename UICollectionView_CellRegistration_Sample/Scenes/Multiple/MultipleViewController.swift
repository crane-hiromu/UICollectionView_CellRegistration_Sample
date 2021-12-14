//
//  MultipleViewController.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/11.
//

import UIKit

// MARK: - Controller
final class MultipleViewController: UIViewController {

    // MARK: Enum

    enum Section: Int, CaseIterable {
        case animal, sport
    }

    private let animals = ["cat", "dog", "bird", "fox"].map(AnimalModel.init(name:))
    private let sports = ["soccer", "baseball", "football", "tennis"].map(SportModel.init(name:))

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100.0)
        layout.sectionInset = .init(top: 8, left: 0, bottom: 8, right: 0)
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
extension MultipleViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }

        switch section {
        case .animal: return animals.count
        case .sport: return sports.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return .init() }

        switch section {
        case .animal:
            return collectionView.dequeueReusableCell(class: AnimalCell.self,
                                                      with: animals[indexPath.row],
                                                      at: indexPath) { cell, _, item in
                cell.configure(with: item)
            }

        case .sport:
            return collectionView.dequeueReusableCell(type: SportCell.self,
                                                      with: sports[indexPath.row],
                                                      at: indexPath) { cell, _, item in
                cell.configure(with: item)
            }
        }
    }
}
