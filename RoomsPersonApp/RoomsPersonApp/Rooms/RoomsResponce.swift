//
//  RoomsResponseDTO.swift
//  RoomsPersonApp
//
//  Created by Daniel on 15/08/22.
//

import Foundation
// swiftlint:disable line_length

struct RoomsResponce: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

// MARK: - Mappings to Domain

extension RoomsResponce {
    func toDomain() -> RoomRecord {
        return RoomRecord(createdAt: createdAt, occupiedMessage: isOccupied ? "Occupied" :"Not Occupied", maxOccupancy: maxOccupancy, id: id)
    }
}
