//
//  VC3.swift
//  KVOCommunicationPattern
//
//  Created by Dennis Loskutov on 21.04.2022.
//

import UIKit

class VC3: UIViewController, DismissButtonProtocol {
    typealias VCDismissProtocol = UIViewController
    var dismissButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpButton()
    }
}

extension VC3 {
    private func setUpButton() {
        addDismissButton(VC: self)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
    
    @objc private func dismissButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
