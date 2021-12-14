//
//  AppDelegate.swift
//  UICollectionView_CellRegistration_Sample
//
//  Created by Tsuruta, Hiromu | ECID on 2021/12/11.
//

import UIKit

// MARK: - UIResponder
@main
final class AppDelegate: UIResponder {}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        .init(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {}
}
