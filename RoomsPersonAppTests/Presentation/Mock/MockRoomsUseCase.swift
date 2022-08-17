//
//  MockRoomsUseCase.swift
//  DirectoryAppTests
//
//  Created by Donald Daniels on 15/08/22.

import Foundation
import XCTest
import CoreNetwork
@testable import RoomsPersonApp

class MockRoomsUseCase: RoomsUseCase {
    var roomsRecords: [RoomRecord]?
   func execute() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}
