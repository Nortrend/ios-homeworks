//
//  PostViewController.swift
//  Navigation
//
//  Created by Евгений Шалагинов on 19.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    private lazy var button: UIBarButtonItem = {
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(action))
        return myButton
    }()
    @objc func action() {
       let infoVirwController = InfoViewController()
        infoVirwController.modalTransitionStyle = .coverVertical
        infoVirwController.modalPresentationStyle = .pageSheet
        present(infoVirwController, animated: true)
    }
    var titlePost: String = ""
    private func setupView() {
        self.view.backgroundColor = .systemMint
           self.navigationItem.title = titlePost
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationItem.rightBarButtonItems = [button]
    }
}
