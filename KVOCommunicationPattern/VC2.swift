//
//  VC2.swift
//  KVOCommunicationPattern
//
//  Created by Dennis Loskutov on 21.04.2022.
//

import UIKit

class VC2: UIViewController, NextButtonProtocol, DismissButtonProtocol {
    typealias VCDismissProtocol = UIViewController
    typealias VCNextProtocolType = UIViewController
    var nextButton: UIButton = UIButton()
    var dismissButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
        view.backgroundColor = .red
    }
}

// Buttons
extension VC2 {
    private func setUpButtons() {
        addNextButton(VC: self)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        addDismissButton(VC: self)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
    
    @objc private func nextButtonAction() {
        let vc = VC3()
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func dismissButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
