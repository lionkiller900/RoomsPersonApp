//
//  RoomsViewStates.swift
//  RoomsPersonApp
//
//  Created by  Donald Daniels on 15/08/22.
//

import Foundation

enum RoomsViewStates: Equatable {
    case showActivityIndicator
    case showRoomsView
    case showError(String)
    case none
}
