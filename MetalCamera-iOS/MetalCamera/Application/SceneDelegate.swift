//
//  File.swift
//  MetalCamera
//
//  Created by Erick Ribeiro on 16/11/23.
//  Copyright © 2023 GS. All rights reserved.
//

import Foundation
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        self.window = UIWindow(windowScene: windowScene)

        let navigationController = UINavigationController(rootViewController: MainViewController())

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

    // [...] Outros métodos do SceneDelegate
}
