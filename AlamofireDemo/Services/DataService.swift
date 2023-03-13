//
//  DataService.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import Foundation
import Alamofire

class DataService {
  func fetchData(completion: @escaping (Result<[User], Error>) -> Void) {
    let url = "https://api.mockaroo.com/api/729a5c80?count=120&key=947b40d0"
    
    AF.request(url).validate().responseDecodable(of: [User].self) { response in
      switch response.result {
      case .success(let users):
        completion(.success(users))
      case .failure(let error):
        completion(.failure(error))
      }
    }

  }
}
