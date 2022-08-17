//
//  MockRoomRepository.swift
//  RoomsPersonAppTests
//
//  Created by Daniel on 15/08/22.
//

import Foundation
import CoreNetwork
@testable import RoomsPersonApp

final class MockRoomRepository: RoomsRepository {
    var roomsRecords: [RoomRecord]?
    func getRooms() async throws -> [RoomRecord] {
        if roomsRecords == nil {
           throw  APIError.invalidData
       }
      return  roomsRecords!
    }
    func enqueueRoomsRecords(roomsRecords: [RoomRecord]) {
        self.roomsRecords = roomsRecords
    }
}
