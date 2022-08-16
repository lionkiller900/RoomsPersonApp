//
//  EndPoints.swift
//  DirectoryApp
//
//  Created by Donald Daniels on 15/08/22.

import Foundation

public struct EndPoint {
    public static let baseUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
}

public enum Path: String {
    case rooms
    case people
}
