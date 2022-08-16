//
//  CoordinatorType.swift
//  RoomsPersonApp
//
//  Created by Admin on 16/08/2022.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
