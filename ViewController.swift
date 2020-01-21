//
//  ViewController.swift
//  webProcessPresent
//
//  Created by MAC on 1/16/20.
//  Copyright © 2020 MAC. All rights reserved.
/*
 Thread 1 retrieves a webservice request.
 Thread 2 processes the data.
 Thread 3 presents to the UI
 func depents on this completing
 3 -> 1&2
 2 -> 1
 */

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let session = URLSession(configuration: .default)
    let packSize = 7
    var urlList: [String] = []
    var imageArray: [Dog] = []
    let tableView : UITableView = UITableView()
    let reuseIdentifier = "custom"

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DogTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        getRandomDogs(packSize: packSize)
    }

    
    
// MARK: - tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? DogTableViewCell else {print("bad cell @@@@@@@@@")
            return UITableViewCell()}

        cell.mainImage = imageArray[indexPath.row].mainImage
        cell.message = imageArray[indexPath.row].message
        cell.layoutSubviews()
        
        return (cell)
    }
    
}
