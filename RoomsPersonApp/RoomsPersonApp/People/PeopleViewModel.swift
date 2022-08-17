//
//  PeopleViewModel.swift
//  RoomsPersonApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation
import Combine
import CoreNetwork

protocol PeopleViewModelAction {
    func navigateToDetails(for index: Int)
}
protocol PeopleViewModelInput {
    func getPeoples() async
    func getPeopleImage(for index: Int, completion:@escaping (Data) -> Void)
}
protocol PeopleViewModelOutput {
    var state: PeopleViewStates {get}
    var numberOfPeople: Int {get}
    func getPeople(for index: Int) -> PeopleRecord
}
final class PeopleViewModel {
    private var peopleUseCase: PeopleUseCase
    private var peopleRecords: [PeopleRecord] = []
    private weak var coordinator: PeoplesCoordinator?
    @Published  var state: PeopleViewStates = .none
    private var cancellables: Set<AnyCancellable> = Set()
    init(peopleUseCase: PeopleUseCase,
         coordinator: PeoplesCoordinator) {
        self.peopleUseCase = peopleUseCase
        self.coordinator = coordinator
    }
}

extension PeopleViewModel: PeopleViewModelAction {
    func navigateToDetails(for index: Int) {}
}

extension PeopleViewModel: PeopleViewModelOutput {
    var numberOfPeople: Int {
        return peopleRecords.count
    }
    func getPeople(for index: Int) -> PeopleRecord {
        return peopleRecords[index]
    }
}
extension PeopleViewModel: PeopleViewModelInput {
    func getPeopleImage(for index: Int, completion:@escaping (Data) -> Void) {
        Task {
            do {
                let imageData =  try await peopleUseCase.getImage(for: peopleRecords[index].avatar)
                DispatchQueue.main.async {
                    completion(imageData)
                }
            } catch {}
        }
    }
    func getPeoples() async {
        state = .showActivityIndicator
        do {
            peopleRecords = try await  peopleUseCase.execute()
            state = .showPeopleView
        } catch {
            if let error = error as? APIError {
                state = .showError(error.localizedDescription)
            }
        }
    }
}
