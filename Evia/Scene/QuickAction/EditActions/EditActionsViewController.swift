//
//  EditActionViewController.swift
//  Evia
//
//  Created by Furkan on 30.03.2024.
//

import UIKit

class EditActionsViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Actions"
        label.font = .font(.interMedium, size: .large)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension EditActionsViewController {
    private func setupViews() {
        
    }
    
    private func applyConstraints() {
        
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct EditActionViewControllerPreview: PreviewProvider {
    static var previews: some View {
        EditActionsViewController().showPreview()
    }
}
#endif
