//
//  SceneDelegate.swift
//  MVVMExampleWithTimeAPI
//
//  Created by David Yoon on 2022/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        let viewCV = ViewController()
        window?.rootViewController = viewCV
        window?.makeKeyAndVisible()
    }


}

