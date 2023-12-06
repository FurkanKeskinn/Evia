//
//  ViewController.swift
//  Evia
//
//  Created by Furkan on 4.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}
#endif
