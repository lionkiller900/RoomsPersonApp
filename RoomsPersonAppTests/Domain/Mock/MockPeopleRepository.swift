//
//  MockPeopleRepository.swift
//  RoomsPersonAppTests
//
//  Created by Daniel on 15/08/22.
//

import Foundation
import CoreNetwork
@testable import RoomsPersonApp

final class MockPeopleRepository: PeoplesRepository {
    var peoplesRecords: [PeopleRecord]?

    func getPeoples() async throws -> [PeopleRecord] {
        if peoplesRecords == nil {
            throw  APIError.invalidData
        }
       return  peoplesRecords!
    }
    func getImages(for url: String) async throws -> Data {
        if url == "invalid" {
            throw  APIError.invalidData
        }
        return url.data(using: .utf8)!
    }
    func enqueuePeopelesRecords(peoplesRecords: [PeopleRecord]) {
        self.peoplesRecords = peoplesRecords
    }
}
