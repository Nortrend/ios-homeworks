//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Евгений Шалагинов on 19.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {


    let profileHeaderView = ProfileHeaderView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame        // Задаем frame для headerView, равный frame корневого view
    }
}
