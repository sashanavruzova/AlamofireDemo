//
//  UserDetailViewController.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import UIKit

class UserDetailViewController: UIViewController {
  
  var user: User?
  
  private lazy var nameLabel = makeLabel()
  private lazy var emailLabel = makeLabel()
  private lazy var genderLabel = makeLabel()
  
  init(user: User) {
    super.init(nibName: nil, bundle: nil)
    self.user = user
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    setupLabels()
  }
  
  private func makeLabel() -> UILabel {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }
  
  private func setupLabels() {
    guard let user = user else { return }
    
    nameLabel.text = "\(user.firstName) \(user.lastName)"
    emailLabel.text = "Email: \(user.email)"
    genderLabel.text = "Gender: \(user.gender)"
    
    view.addSubview(nameLabel)
    view.addSubview(emailLabel)
    view.addSubview(genderLabel)
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
      emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      genderLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
      genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      genderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
}

