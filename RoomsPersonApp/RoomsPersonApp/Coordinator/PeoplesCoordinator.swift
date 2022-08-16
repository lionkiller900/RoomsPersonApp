//
//  PeoplesCoordinator.swift
//  DirectoryApp
//
//  Created by  Donald Daniels on 15/08/22.
//

import Foundation
import UIKit
import CoreNetwork

// swiftlint:disable line_length
protocol PeoplesCoordinatoryType: AnyObject {
    func navigatToPeopleDetails(people: PeopleRecord)
}

class PeoplesCoordinator: CoordinatorType, PeoplesCoordinatoryType {
    var navController: UINavigationController
    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }
    func start() {
        let networkManager = NetworkManager()
        let defualtPeopleRepository = DefaultPeopleRepository(networkManager: networkManager)
        let peopleUseCase = DefaultPeopleUseCase(peoplesRepository: defualtPeopleRepository)
        let peopleViewModel = PeopleViewModel(peopleUseCase: peopleUseCase, coordinator: self)
        let peopleVC = PeoplesViewController.storyboardViewController()
        peopleVC.viewModel = peopleViewModel
        navController.pushViewController(peopleVC, animated: false)
        let peoplesTab = UITabBarItem(title: "People", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
        navController.tabBarItem = peoplesTab
    }
    func navigatToPeopleDetails(people: PeopleRecord) {}
}
