//
//  PeopleCollectionViewCell.swift
//  RoomsPersonApp
//
//  Created by  Donald Daniels on 15/08/22.
//

import UIKit

final class PeopleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterImageViw: UIImageView!
    func configureData(people: PeopleRecord) {
        nameLabel.text = people.firstName + people.lastName
        titleLabel.text = people.jobTitle
        self.contentView.layer.borderColor = UIColor.blue.cgColor
        self.contentView.layer.borderWidth = 1.0
        posterImageViw.layer.cornerRadius = 35
        posterImageViw.clipsToBounds = true
        enableDynamicFonts()
        setupVoiceOver()
    }
    override func prepareForReuse() {
        nameLabel.text = ""
        posterImageViw.image = nil
        titleLabel.text = ""
    }
    func setupVoiceOver() {
        nameLabel.accessibilityLabel = "Name is"
        nameLabel.accessibilityValue = nameLabel.text
        posterImageViw.accessibilityHint = "image of \(String(describing: nameLabel.text))"
        titleLabel.accessibilityValue = "Job Title"
        titleLabel.accessibilityValue = titleLabel.text
    }
    func enableDynamicFonts() {
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.font = UIFont.customFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.customFont(forTextStyle: .caption2)
    }
}
