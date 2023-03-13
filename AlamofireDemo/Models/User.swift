//
//  User.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import Foundation

struct User: Codable {
  let id: Int
  let firstName: String
  let lastName: String
  let email: String
  let gender: String
  let avatar: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case firstName = "first_name"
    case lastName = "last_name"
    case email
    case gender
    case avatar
  }
}

