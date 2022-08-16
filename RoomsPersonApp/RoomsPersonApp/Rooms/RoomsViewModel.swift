//
//  RoomsViewModel.swift
//  DirectoryApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation
import Combine
import CoreNetwork

protocol RoomsViewModelInput {
    func getRooms() async
}

protocol RoomsViewModelOutput {
      var state: RoomsViewStates {get}
      var numberOfRooms: Int {get}
      func getRooms(for index: Int) -> RoomRecord
}

final class RoomsViewModel {
    private var roomsUseCase: RoomsUseCase
    private var roomRecords: [RoomRecord] = []
    private weak var coordinator: RoomsCoordinator?
    @Published  var state: RoomsViewStates = .none
    private var cancellables: Set<AnyCancellable> = Set()
    init(roomsUseCase: RoomsUseCase,
         coordinator: RoomsCoordinator) {
        self.roomsUseCase = roomsUseCase
        self.coordinator = coordinator
    }
}

extension RoomsViewModel: RoomsViewModelOutput {
    var numberOfRooms: Int {
        return roomRecords.count
    }
    func getRooms(for index: Int) -> RoomRecord {
        return roomRecords[index]
    }
}
extension RoomsViewModel: RoomsViewModelInput {
    func getRooms() async {
        state = .showActivityIndicator
        do {
            roomRecords = try await  roomsUseCase.execute()
            state = .showRoomsView
        } catch {
            if let error = error as? APIError {
                state = .showError(error.localizedDescription)
            }
        }
    }
}
