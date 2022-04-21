//
//  ViewController.swift
//  KVOCommunicationPattern
//
//  Created by Dennis Loskutov on 21.04.2022.
//

import UIKit

class ViewController: UIViewController, NextButtonProtocol{
    typealias VCNextProtocolType = UIViewController
    var nextButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        view.backgroundColor = .red
    }
}

// Buttons
extension ViewController {
    private func setUpButton() {
        addNextButton(VC: self)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    }
    
    @objc private func nextButtonAction() {
        let vc = VC2()
        present(vc, animated: true, completion: nil)
    }
}

// Step 3 determen action to perform
extension ViewController: ResponderAction {
    func changeColor(sender: Any?) {
        print("Done")
        view.backgroundColor = UIColor(hue: CGFloat.random(in: 0...1),
                                       saturation: CGFloat.random(in: 0...1),
                                       brightness: CGFloat.random(in: 0...1),
                                       alpha: 1)
    }
}
