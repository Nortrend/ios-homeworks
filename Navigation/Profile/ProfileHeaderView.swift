//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Евгений Шалагинов on 24.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileImageView = UIImage(named: "pug")
    let nameLabel = UILabel()
    var statusLabel = UILabel()
    let editButton = UIButton(type: .system)
    var textStatus = UITextField()
    private var statusText = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    @objc func buttonPressed() {
//        let optionalString: String? = statusLabel.text
//        if let unwrappedString = optionalString {
//            print(unwrappedString)
//        } тут была функция, которая выводила статический статус в консоль
        statusLabel.text = statusText
    }
    
    @objc private func statusTextChanged(_ textStatus: UITextField) {
        statusText = textStatus.text ?? ""
    }

    private func setupUI() {
        // установка изображения профиля
        let imageView = UIImageView(image: profileImageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pug")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.frame.origin.x = 16
        imageView.frame.origin.y = 16
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        addSubview(imageView)
        
        // установка имени пользователя
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.text = "Pug Kiku"
        nameLabel.textColor = .black
        addSubview(nameLabel)
        
        // установка статуса
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.text = "Waiting for yummy"
        statusLabel.textColor = .gray
        addSubview(statusLabel)
        
        // установка элемента для введения статуса
        textStatus.translatesAutoresizingMaskIntoConstraints = false
        textStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textStatus.textColor = .black
        textStatus.backgroundColor = .white
        textStatus.layer.cornerRadius = 12
        textStatus.layer.borderWidth = 1
        textStatus.layer.borderColor = UIColor.black.cgColor
        textStatus.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textStatus.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        textStatus.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0) // добавил отступ для красоты
        addSubview(textStatus)
        
        // установка кнопки "Set status"
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitle("Set status", for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        editButton.tintColor = .white
        editButton.layer.cornerRadius = 4
        editButton.backgroundColor = .systemBlue
        let buttonHeight: CGFloat = 50 // высота кнопки в точках
        editButton.frame.size.height = buttonHeight // установка высоты кнопки, оставляем ширину без изменений
        editButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        editButton.layer.shadowColor = UIColor.black.cgColor
        editButton.layer.shadowRadius = 4
        editButton.layer.shadowOpacity = 0.7
        editButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addSubview(editButton)

        // установка ограничений
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -74),
            
            editButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            editButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 56),

            textStatus.leftAnchor.constraint(equalTo: statusLabel.leftAnchor),
            textStatus.leftAnchor.constraint(equalTo: leftAnchor, constant: 145),
            textStatus.rightAnchor.constraint(equalTo: editButton.rightAnchor),
            textStatus.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 17),
            textStatus.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -17)
        ])
        
    }
}
