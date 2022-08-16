//
//  MockNetworkManager.swift
//  DirectoryAppTests
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation
import CoreNetwork
@testable import DirectoryApp

class MockNetworkManager: Networkable {
    private var jsonFilePath = ""
    func get(apiRequest: ApiRequestType) async throws -> Data {
        if jsonFilePath == "imageDataValid" {
           return Data()
        } else if jsonFilePath == "imageDataInValid" {
            throw APIError.invalidData
        }
        let bundle = Bundle(for: MockNetworkManager.self)
        guard let url = bundle.url(forResource: jsonFilePath, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            throw APIError.invalidData
        }
        return data
    }
    func enqueue(jsonFilePath: String) {
        self.jsonFilePath = jsonFilePath
    }
}
