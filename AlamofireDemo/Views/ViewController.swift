//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by aleksandranavruzova on 13.03.2023.
//

import UIKit

class ViewController: UIViewController {
  private let viewModel = UsersViewModel()
  
  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")

    tableView.dataSource = self
    tableView.delegate = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.rowHeight = 60

    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpTableView()
    getUsers()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

  func setUpTableView() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      ])
    tableView.separatorStyle = .none
  }
  
  func getUsers() {
    viewModel.fetchData { error in
      if let error = error {
        print("Failed to fetch users: \(error.localizedDescription)")
      } else {
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "UserTableViewCell"
    tableView.register(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
      fatalError("Unable to dequeue a cell")
    }
    let user = viewModel.users[indexPath.row]
    
    cell.configure(with: user)
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let user = viewModel.users[indexPath.row]
    
    let detailViewController = UserDetailViewController(user: user)
    navigationController?.pushViewController(detailViewController, animated: true)
  }
}


