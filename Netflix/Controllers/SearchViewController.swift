//
//  SearchViewController.swift
//  Netflix
//
//  Created by Maryna Bolotska on 30/07/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles: [Title] = [Title]()

      private let discoverTable: UITableView = {
          let table = UITableView()
          table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
          return table
      }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
               navigationController?.navigationBar.prefersLargeTitles = true
               navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.backgroundColor = .systemBackground
        
        view.addSubview(discoverTable)
              discoverTable.delegate = self
              discoverTable.dataSource = self

              fetchDiscoverMovies()
    }
    

}
