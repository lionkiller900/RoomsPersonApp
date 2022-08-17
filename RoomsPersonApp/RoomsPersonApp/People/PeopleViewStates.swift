//
//  PeopleViewStates.swift
//  RoomsPersonApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation

enum PeopleViewStates: Equatable {
    case showActivityIndicator
    case showPeopleView
    case showError(String)
    case none
}
