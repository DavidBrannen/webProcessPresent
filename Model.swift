//
//  Model.swift
//  webProcessPresent
//
//  Created by MAC on 1/16/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

let packSize = 7 //Choose a pack size

struct RandomDog : Codable {
    let message : String
}

struct Dog {
    let mainImage: UIImage
    let message : String
}
