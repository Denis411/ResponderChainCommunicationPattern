//
//  ViewControllerWithDismiss.swift
//  KVOCommunicationPattern
//
//  Created by Dennis Loskutov on 21.04.2022.
//
import UIKit

protocol DismissButtonProtocol: AnyObject {
    associatedtype VCDismissProtocol: UIViewController
    var dismissButton: UIButton { get set }
    func addDismissButton(VC: VCDismissProtocol)
}

extension DismissButtonProtocol {
    func addDismissButton(VC: VCDismissProtocol) {
        dismissButton.layer.backgroundColor = UIColor.blue.cgColor
        dismissButton.layer.cornerRadius = 20
        dismissButton.setTitle("Dismiss", for: .normal)
        
        VC.view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: VC.view.leadingAnchor, constant: 20).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: VC.view.trailingAnchor, constant: -20).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: VC.view.centerXAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: VC.view.bottomAnchor, constant: -50).isActive = true
    }
}
