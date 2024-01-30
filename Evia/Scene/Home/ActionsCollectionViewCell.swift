//
//  ActionsCollectionViewCell.swift
//  Evia
//
//  Created by Furkan on 9.12.2023.
//

import UIKit

class ActionsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "actionsCollectionViewCell"
    
    let actionsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .font(.interRegular, size: .h6)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        return button
    }()
    
   /* var isHeader: Bool = false {
            didSet {
                // isHeader değişkenine göre görünümü ayarla
                if isHeader {
                    // Başlık görünümü özellikleri
                    actionsLabel.backgroundColor = .green
                } else {
                    // Hücre görünümü özellikleri
                    actionsLabel.backgroundColor = .blue
                }
            }
        }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(actionsButton)
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        let actionsButtonConstraints = [
            actionsButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionsButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionsButton.topAnchor.constraint(equalTo: topAnchor),
            actionsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            actionsButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        NSLayoutConstraint.activate(actionsButtonConstraints)
    }
    
    // swiftlint:disable fatal_error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error
}

