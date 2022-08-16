//
//  PeoplesViewController.swift
//  DirectoryApp
//
//  Created by Donald Daniels on 15/08/22.
//

import UIKit
import Combine
// swiftlint:disable line_length

final class PeoplesViewController: UIViewController, Alertable {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: PeopleViewModel?
    private var bindings = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NSLocalizedString("peoples", comment: "")
        setupCollectionView()
        setupBinding()
        getPeoples()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.preferredContentSizeCategory < .extraLarge {
        } else {
           // setup your font again
        }
    }
}

// MARK: - Private Methods

extension PeoplesViewController {
    private func getPeoples() {
        Task {
            await viewModel?.getPeoples()
        }
    }
    private func setupBinding() {
        viewModel?.$state.receive(on: RunLoop.main).sink(receiveValue: {[weak self] states in
            switch states {
            case .showActivityIndicator:
                self?.showActivity()
            case .showPeopleView:
                self?.hideActivity()
                self?.collectionView.reloadData()
            case .showError( let message):
                self?.hideActivity()
                self?.showAlert(message: message)
            case .none:
                self?.hideActivity()
            }
        }).store(in: &bindings)
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.collectionViewLayout = layout
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
    private func navigateToGalleryView() {
        viewModel?.navigateToDetails(for: 1)
    }
}

extension PeoplesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfPeople ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PeopleCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let people = viewModel?.getPeople(for: indexPath.row) {
            cell.configureData(people: people)
        }
        viewModel?.getPeopleImage(for: indexPath.row, completion: { imageData in
            cell.posterImageViw.image = UIImage(data: imageData)
        })
        return cell
    }
}

extension PeoplesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let lay = collectionViewLayout as? UICollectionViewFlowLayout {
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
            return CGSize(width: widthPerItem, height: 200)
        }
        return CGSize.zero
    }
}
