//
//  UserTableViewCell.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    let avatarView = UIImageView()
    let nameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(avatarView)
        contentView.addSubview(nameLabel)

        avatarView.clipsToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 60),
            avatarView.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with user: User) {
        nameLabel.text = "\(user.firstName) \(user.lastName)"

        DispatchQueue.global(qos: .background).async {
            if let imageUrl = URL(string: user.avatar),
                let imageData = try? Data(contentsOf: imageUrl),
                let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.avatarView.image = image
                }
            }
        }
    }
}
