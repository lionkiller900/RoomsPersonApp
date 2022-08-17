//
//  MokcPeopleUseCase.swift
//  RoomsPersonApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation
@testable import RoomsPersonApp
import XCTest
import CoreNetwork

class MokcPeopleUseCase: PeopleUseCase {
    var peoplesRecords: [PeopleRecord]?
    func execute() async throws -> [PeopleRecord] {
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    func getImage(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    func enqueuePeopelesRecords(peoplesRecords: [PeopleRecord]) {
        self.peoplesRecords = peoplesRecords
    }
}
