//
//  ViewController.swift
//  SwiftSearchDemo
//
//  Created by 高鑫 on 2017/11/21.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    let movies = Movie.movies
    var searchController : UISearchController!
    var searchResults : [Marvel] = []
    @IBOutlet weak var marvelTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.searchBarStyle = .minimal
        
        self.headerView.addSubview(searchController.searchBar)
        
        marvelTableView.delegate = self
        marvelTableView.dataSource = self
        marvelTableView.tableFooterView = UIView()
        marvelTableView.rowHeight = 120
        
        print(movies.count)
        print(marvelTableView.contentSize.height)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? searchResults.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MarvelTableViewCell
        let movie = searchController.isActive ? searchResults[indexPath.row] : movies[indexPath.row]
        cell.selectionStyle = .none
        cell.marvelImg.image = UIImage(named: movie.img)
        cell.nameLabel.text = movie.name
        cell.dateLabel.text = movie.date
        return cell
    }
    
    func searchFilter(text: String) {
        self.searchResults = movies.filter({ (movie) -> Bool in
            return movie.name.localizedCaseInsensitiveContains(text)
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if var text = searchController.searchBar.text {
            text = text.trimmingCharacters(in: .whitespaces)
            searchFilter(text: text)
            marvelTableView.reloadData()
        }
    }

}

class MarvelTableViewCell: UITableViewCell {
    @IBOutlet weak var marvelImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
}
