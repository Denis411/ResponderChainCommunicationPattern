//
//  ViewControllerWithNextButton.swift
//  KVOCommunicationPattern
//
//  Created by Dennis Loskutov on 21.04.2022.
//
import UIKit

protocol NextButtonProtocol: AnyObject {
    associatedtype VCNextProtocolType: UIViewController
    var nextButton: UIButton { get set }
    func addNextButton(VC: VCNextProtocolType)
}

extension NextButtonProtocol {
    func addNextButton(VC: VCNextProtocolType) {
        nextButton.layer.backgroundColor = UIColor.blue.cgColor
        nextButton.layer.cornerRadius = 20
        nextButton.setTitle("Next", for: .normal)
        
        VC.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: VC.view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: VC.view.trailingAnchor, constant: -20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: VC.view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: VC.view.centerYAnchor).isActive = true
    }
}
