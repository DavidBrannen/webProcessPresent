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

class DogCell: UITableViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var dogImage: UIImageView!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let session = URLSession(configuration: .default)
    let packSize = 2
    var urlList: [String] = []
    var imageArray: [UIImage] = []

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomDogs(packSize: packSize)
    }

    
    
// MARK: - tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packSize
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "dogCell")
        if imageArray.count > 0 {
            cell.imageView?.image = imageArray[indexPath.row]
        }

        cell.textLabel?.text = String(indexPath.row + 1)
        
        
        return (cell)
    }
    
}
