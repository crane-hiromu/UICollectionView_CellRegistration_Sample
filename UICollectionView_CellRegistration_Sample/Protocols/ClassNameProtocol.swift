//
//  ClassNameProtocol.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/14.
//

import Foundation
import UIKit

// MARK: - Protocol
protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {

    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

// MARK: - NSObject Extension
extension NSObject: ClassNameProtocol {}
