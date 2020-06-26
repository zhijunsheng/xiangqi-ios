//
//  SceneDelegate.swift
//  CChess
//
//  Created by Zhijun Sheng on 2020-06-23.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        var game = CChessGame()
//        game.pieces = [
//            CChessPiece(col: 0, row: 0, imageName: "bj"),
//            CChessPiece(col: 1, row: 0, imageName: "bm"),
//            CChessPiece(col: 2, row: 0, imageName: "bx"),
//            CChessPiece(col: 3, row: 0, imageName: "bs"),
//        ]
//
        for i in 0..<2 {
            game.pieces.insert(CChessPiece(col: 0 + i * 8, row: 0, imageName: "bj"))
            game.pieces.insert(CChessPiece(col: 0 + i * 8, row: 9, imageName: "rj"))
            
            game.pieces.insert(CChessPiece(col: 1 + i * 6, row: 0, imageName: "bm"))
            game.pieces.insert(CChessPiece(col: 1 + i * 6, row: 9, imageName: "rm"))
            
            game.pieces.insert(CChessPiece(col: 2 + i * 4, row: 0, imageName: "bx"))
            game.pieces.insert(CChessPiece(col: 2 + i * 4, row: 9, imageName: "rx"))

            game.pieces.insert(CChessPiece(col: 3 + i * 2, row: 0, imageName: "bs"))
            game.pieces.insert(CChessPiece(col: 3 + i * 2, row: 9, imageName: "rs"))

            game.pieces.insert(CChessPiece(col: 1 + i * 6, row: 2, imageName: "bp"))
            game.pieces.insert(CChessPiece(col: 1 + i * 6, row: 7, imageName: "rp"))
        }
        
        for i in 0..<5 {
            game.pieces.insert(CChessPiece(col: i * 2, row: 3, imageName: "bz"))
            game.pieces.insert(CChessPiece(col: i * 2, row: 5, imageName: "rz"))
        }
        
        game.pieces.insert(CChessPiece(col: 4, row: 0, imageName: "bb"))
        game.pieces.insert(CChessPiece(col: 4, row: 9, imageName: "rb"))
        
        let contentView = ContentView(game: game)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

