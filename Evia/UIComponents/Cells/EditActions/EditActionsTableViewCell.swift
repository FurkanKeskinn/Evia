//
//  EditActionsTableViewCell.swift
//  Evia
//
//  Created by Furkan on 30.03.2024.
//

import UIKit

class EditActionsTableViewCell: UITableViewCell {
    
    static let identifier = "EditActionsTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Arriving Home"
        label.font = .font(.interRegular, size: .h4)
        label.textColor = .appBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Icons.icTrash), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let iconsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let mainstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mainstackView)
        mainstackView.addArrangedSubview(titleLabel)
        mainstackView.addArrangedSubview(iconsStackView)
        iconsStackView.addArrangedSubview(deleteButton)
        applyConstraints()
    }
    
    // swiftlint:disable fatal_error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error
    
    private func applyConstraints() {
        
        
        let mainstackViewConstraint = [
            mainstackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            mainstackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            mainstackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainstackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
        ]
        
        
        let allConstraints = [
            mainstackViewConstraint
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}
