//
//  RoomsTableViewCell.swift
//  RoomsPersonApp
//
//  Created by  Donald Daniels on 15/08/22.
//

import UIKit
// swiftlint:disable line_length

final class RoomsTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var occupiedLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    override func prepareForReuse() {
        idLabel.text = ""
        occupiedLabel.text = ""
        maxOccupancyLabel.text = ""
        createdAtLabel.text = ""
    }
    func configureData(room: RoomRecord) {
        idLabel.text = room.id
        occupiedLabel.text = room.occupiedMessage
        maxOccupancyLabel.text = "\(room.maxOccupancy)"
        createdAtLabel.text = room.createdAt
        setupVoiceOver()
        enableDynamicFonts()
    }
    func setupVoiceOver() {
        self.accessibilityLabel = "Room Details"
        self.accessibilityValue =  "id is \(String(describing: idLabel.text)) room is \(String(describing: occupiedLabel.text)) max occupancy of room is \(String(describing: maxOccupancyLabel.text))"
    }
    func enableDynamicFonts() {
        idLabel.adjustsFontForContentSizeCategory = true
        idLabel.font = UIFont.customFont(forTextStyle: .caption1)
        occupiedLabel.adjustsFontForContentSizeCategory = true
        occupiedLabel.font = UIFont.customFont(forTextStyle: .caption2)
        maxOccupancyLabel.adjustsFontForContentSizeCategory = true
        maxOccupancyLabel.font = UIFont.customFont(forTextStyle: .caption2)
        createdAtLabel.adjustsFontForContentSizeCategory = true
        createdAtLabel.font = UIFont.customFont(forTextStyle: .caption2)

    }
}
