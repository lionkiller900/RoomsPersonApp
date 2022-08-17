//
//  RoomsViewController.swift
//  RoomsPersonApp
//
//  Created by Donald Daniels on 15/08/22.
//

import UIKit
import Combine
// swiftlint:disable line_length

final class RoomsViewController: UIViewController, Alertable {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RoomsViewModel?
    private var bindings = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("rooms", comment: "")
        setupBinding()
        getRooms()
    }
}

// MARK: - Private Methods

extension RoomsViewController {
    private func getRooms() {
        Task {
            await viewModel?.getRooms()
        }
    }
    private func setupBinding() {
        viewModel?.$state.receive(on: RunLoop.main).sink(receiveValue: {[weak self] states in
            switch states {
            case .showActivityIndicator:
                self?.showActivity()
            case .showRoomsView:
                self?.hideActivity()
                self?.tableView.reloadData()
            case .showError( let message):
                self?.hideActivity()
                self?.showAlert(message: message)
            case .none:
                self?.hideActivity()
            }
        }).store(in: &bindings)
    }
    private func showActivity() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    private func hideActivity() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
}

extension RoomsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfRooms ?? 0

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RoomsTableViewCell else {
            return UITableViewCell()
        }
        if let room = viewModel?.getRooms(for: indexPath.row) {
            cell.configureData(room: room)
        }
        return cell
    }
}
