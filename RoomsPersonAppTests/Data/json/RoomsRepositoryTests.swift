//
//  RoomsRepositoryTests.swift
//  DirectoryAppTests
//
//  Created by Donald Daniels on 15/08/22.
//

import XCTest
@testable import DirectoryApp
import CoreNetwork

class RoomsRepositoryTests: XCTestCase {

    var roomsRepository: RoomsRepository!
    let networkManager =  MockNetworkManager()
    override func setUp() {
        roomsRepository = DefaultRoomsRepository(networkManager: networkManager)
    }
    // People Valid Json
    func testGetRoomsSuccess() async {
        networkManager.enqueue(jsonFilePath: "ValidRoomsResonse")
        let roomsRecord = try? await roomsRepository.getRooms()
        XCTAssertEqual(roomsRecord?.count, 65)
        XCTAssertEqual(roomsRecord?.first?.occupiedMessage, "Not Occupied")
    }
    // Invalid response than parsing fails
    func testGetPeopleParsinFails() async {
        networkManager.enqueue(jsonFilePath: "InvalidRoomsResonse")
        do {
             _ = try await roomsRepository.getRooms()
        } catch {
            XCTAssertEqual(error as? APIError, APIError.jsonParsingFailed)
        }
    }
    // Invalid response is empty
    func testGetPeopleEmptyResonse() async {
        networkManager.enqueue(jsonFilePath: "EmptyRoomsResonse")
        do {
             _ = try await roomsRepository.getRooms()
        } catch {
            XCTAssertEqual(error as? APIError, APIError.emptyRecords)
        }
    }
    // Invalid URL
    func testGetPeopleResonseIsInvalid() async {
        networkManager.enqueue(jsonFilePath: "invalid")
        do {
             _ = try await roomsRepository.getRooms()
        } catch {
            XCTAssertEqual(error as? APIError, APIError.invalidData)
        }
    }
}
