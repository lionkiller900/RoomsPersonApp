//
//  UrlRequestTest.swift
//  RoomsPersonAppTests
//
//  Created by Donald Daniels on 15/08/22.
//

import XCTest
@testable import RoomsPersonApp
import CoreNetwork

class UrlRequestTest: XCTestCase {
    // rigth URL
    func testRequest_whenUrlIsCorrect() {
        // GIVEN
        let apiRequest = ApiRequest(baseUrl: EndPoint.baseUrl, path: "", params: ["q": "test"])
        // When
        let requeast = URLRequest.getURLRequest(for: apiRequest)
        // Then
        XCTAssertEqual(requeast!.url!.absoluteString, "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/")
    }
    // wrong URL
    func testRequest_whenUrlIsInCorrect() {
        // GIVEN
        let apiRequest = ApiRequest(baseUrl: "", path: "", params: ["q": "test"])
        // When
        let requeast = URLRequest.getURLRequest(for: apiRequest)
        // Then
        XCTAssertNil(requeast?.url)
    }
}
