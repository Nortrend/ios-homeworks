//
//  FeedViewController.swift
//  Navigation
//
//  Created by Евгений Шалагинов on 19.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    var post = Post(title: "Hello! Amazing! It works!")
    
    let stackView = UIStackView()
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        let button1 = UIButton()
        button1.setTitle("Button 1", for: .normal)
        button1.setTitleColor(.lightGray, for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.layer.shadowOffset = CGSize(width: 4, height: 4)
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowRadius = 4
        button1.layer.shadowOpacity = 0.7
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button1.tintColor = .white
        button1.layer.cornerRadius = 4
        button1.backgroundColor = .systemBlue
        
        let button2 = UIButton()
        button2.setTitle("Button 2", for: .normal)
        button2.setTitleColor(.lightGray, for: .normal)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.layer.shadowOffset = CGSize(width: 4, height: 4)
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowRadius = 4
        button2.layer.shadowOpacity = 0.7
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button2.tintColor = .white
        button2.layer.cornerRadius = 4
        button2.backgroundColor = .systemBlue
        

        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    @objc private func buttonAction() {
           let postViewController = PostViewController()
           postViewController.titlePost = post.title
           self.navigationController?.pushViewController(postViewController, animated: true)
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        setupStackView()
    }
}

