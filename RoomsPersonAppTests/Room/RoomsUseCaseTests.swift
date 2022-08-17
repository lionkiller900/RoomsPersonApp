//
//  RoomsUseCaseTests.swift
//  RoomsPersonAppTests
//
//  Created by Daniel on 15/08/22.
//

import XCTest
@testable import RoomsPersonApp
import CoreNetwork
// swiftlint:disable line_length

class RoomsUseCaseTests: XCTestCase {

    var roomsUseCase: RoomsUseCase!
    let mockRoomRepository = MockRoomRepository()
    override func setUpWithError() throws {
        roomsUseCase = DefaultRoomsUseCase(roomsRepository: mockRoomRepository)
    }
    override func tearDownWithError() throws {
        roomsUseCase = nil
    }

    // when people records success
    func testGetRoomsSuccess() async {
        mockRoomRepository.enqueueRoomsRecords(roomsRecords: [RoomRecord(createdAt: "test", occupiedMessage: "occupied", maxOccupancy: 5, id: "1")])
      let roomsRecords =  try? await roomsUseCase.execute()
        XCTAssertEqual(roomsRecords?.count, 1)
        XCTAssertEqual(roomsRecords?.first?.occupiedMessage, "occupied")
    }
    // when people records fail to fetch data
    func testGetPeopleFailure() async {

        do {
            _ =  try await roomsUseCase.execute()
        } catch {
            XCTAssertEqual(error as? APIError, .invalidData)
        }
    }
}
