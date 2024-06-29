//
//  DevicesCollectionViewCell.swift
//  Evia
//
//  Created by Furkan on 1.01.2024.
//

import UIKit

class DevicesCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "devicesCollectionViewCell"
    
    let bookmarkIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.Icons.home)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Air Conditioner"
        label.numberOfLines = 0
        label.font = .font(.interMedium, size: .h6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchButton: UISwitch = {
        let button = UISwitch()
        button.isOn = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bookmarkIcon)
        contentView.addSubview(textLabel)
        contentView.addSubview(switchButton)
        contentView.layer.cornerRadius = 16
        applyConstraints()
    }
    
    private func applyConstraints() {
        let iconConstraints = [
            bookmarkIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            bookmarkIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            bookmarkIcon.widthAnchor.constraint(equalToConstant: 25),
            bookmarkIcon.heightAnchor.constraint(equalToConstant: 25)
        ]
        NSLayoutConstraint.activate(iconConstraints)
        
        let textLabelConstraints = [
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ]
        NSLayoutConstraint.activate(textLabelConstraints)
        
        let switchButtonConstraints = [
            switchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            switchButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(switchButtonConstraints)
    }
    
    // swiftlint:disable fatal_error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error
    
    func configure(with deviceData: Devices) {
        textLabel.text = deviceData.name
        switchButton.isOn = deviceData.isLocked
    }
}
