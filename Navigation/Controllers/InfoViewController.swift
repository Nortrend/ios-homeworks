//
//  InfoViewController.swift
//  Navigation
//
//  Created by Евгений Шалагинов on 19.02.2023.
//

import UIKit

class InfoViewController: UIViewController, UIAlertViewDelegate {
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Alert!", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Hello!", message: "Are y prepeared?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            print("You a prepeared!")
        }
        let noAction = UIAlertAction(title: "No", style: .default) { (action) -> Void in
            print("YOU ARE NOT PREPEARED!")
        }
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupButton()
    }
}
