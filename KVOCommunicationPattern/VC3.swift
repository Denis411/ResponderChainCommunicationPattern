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
    var buttonForCommunication = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpDissmissButton()
        setUpCommunicationButton()
    }
}

// buttons
extension VC3 {
    private func setUpDissmissButton() {
        addDismissButton(VC: self)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
    
    private func setUpCommunicationButton() {
        buttonForCommunication.layer.backgroundColor = UIColor.yellow.cgColor
        buttonForCommunication.layer.cornerRadius = 20
        buttonForCommunication.setTitle("Change color", for: .normal)
        buttonForCommunication.setTitleColor(.black, for: .normal)
        buttonForCommunication.setTitleColor(.orange, for: .highlighted)
        buttonForCommunication.addTarget(self, action: #selector(checkResponderChain), for: .touchUpInside)

        view.addSubview(buttonForCommunication)
        buttonForCommunication.translatesAutoresizingMaskIntoConstraints = false
        buttonForCommunication.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        buttonForCommunication.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        buttonForCommunication.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonForCommunication.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonForCommunication.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func dismissButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
// Step 2, send to find the aciton in hierarchy 
    @objc private func checkResponderChain() {
        UIApplication.shared.sendAction(#selector(ResponderAction.changeColor), to: nil, from: self, for: nil)
    }
}

// Step 1, declare a protocol
@objc protocol ResponderAction: AnyObject {
    func changeColor(sender: Any?)
}
