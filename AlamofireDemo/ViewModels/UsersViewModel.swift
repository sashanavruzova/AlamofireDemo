//
//  UsersViewModel.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import Foundation

class UsersViewModel {
  var users: [User] = []
  let dataService = DataService()
  
  func fetchData(completion: @escaping (Error?) -> Void) {
    dataService.fetchData { result in
      switch result {
      case .success(let users):
        self.users = users
        completion(nil)
      case .failure(let error):
        completion(error)
      }
    }
  }
}
