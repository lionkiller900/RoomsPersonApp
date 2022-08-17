//
//  RoomsCoordinator.swift
//  RoomsPersonApp
//
// Created by  Donald Daniels on 15/08/2022.
//

import Foundation
import UIKit
import CoreNetwork
// swiftlint:disable line_length

class RoomsCoordinator: CoordinatorType {
    var navController: UINavigationController
    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }
    func start() {
        let networkManager = NetworkManager()
        let defualtRoomsRepository = DefaultRoomsRepository(networkManager: networkManager)
        let roomsUseCase = DefaultRoomsUseCase(roomsRepository: defualtRoomsRepository)
        let roomsViewModel = RoomsViewModel(roomsUseCase: roomsUseCase, coordinator: self)
        let roomsVC = RoomsViewController.storyboardViewController()
        roomsVC.viewModel = roomsViewModel
        navController.pushViewController(roomsVC, animated: false)
        let roomsTab = UITabBarItem(title: "Rooms", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        navController.tabBarItem = roomsTab
    }
}
