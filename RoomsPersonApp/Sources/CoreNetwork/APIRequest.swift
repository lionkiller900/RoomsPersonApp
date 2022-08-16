//
//  ApiRequest.swift
//  DirectoryApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation

public protocol ApiRequestType {
    var baseUrl: String {get}
    var path: String {get}
    var params: [String: String] {get}
}

public struct ApiRequest: ApiRequestType {
    public var baseUrl: String
    public var path: String
    public var params: [String: String]
    public init(baseUrl: String, path: String, params: [String: String] ) {
        self.baseUrl = baseUrl
        self.path = path
        self.params = params
    }
}
