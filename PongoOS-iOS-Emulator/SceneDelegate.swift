//
//  SceneDelegate.swift
//  PongoOS-iOS-Emulator
//
//  Minimal scene delegate for UIKit compatibility with Info.plist
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(BootSimulator()))
        self.window = window
        window.makeKeyAndVisible()
    }
}
