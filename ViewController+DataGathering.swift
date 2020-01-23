//
//  ViewController+DataGathering.swift
//  webProcessPresent
//
//  Created by MAC on 1/16/20.
//  Copyright © 2020 MAC. All rights reserved.
//https://github.com/public-apis/public-apis
//https://dog.ceo/api/breeds/image/random

import UIKit
extension ViewController {
    
    func getRandomDogs(packSize: NSInteger){
        let group = DispatchGroup()
        urlList = []
        //create a list of dog images urls
        for _ in 1...packSize {
            let requestForADog = "https://dog.ceo/api/breeds/image/random"
            guard let url = URL(string: requestForADog) else {return}
            
            group.enter()
            let dataTask = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil { print("Error1 \(error!)"); return}
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Random Response: \(response!)")
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        /// once data is received & serialized, return with url
                        let dogURLDic = try decoder.decode(RandomDog.self, from: data)
                        let newDog = dogURLDic.message
                        self.urlList.append(newDog)
                    } catch let error {
                        print("Parsing Failed \(error.localizedDescription)")
                    }
                }
                group.leave()
            }
            dataTask.resume()
        }
        group.notify(queue: .main) {
            self.getImages()
        }
    }
    //create image breed list
    func getImages() {
        let group = DispatchGroup()
        imageArray = []
        //create a list of dog images with breed names
        for urlString in urlList {
            let requestForAImage = urlString
            guard let url = URL(string: requestForAImage) else {return}
            let urlPart = urlString.components(separatedBy: "/")
            let breed: String = urlPart[4]

            group.enter()
            let dataTask = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil { print("Error2 \(error!)"); return}
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    print("Get image Response: \(response!)")
                    return
                }
                if let data = data {
                    let newDogImage = UIImage(data: data)
                    let dogData = Dog.init(mainImage: newDogImage!, message: breed)
                    self.imageArray.append(dogData)
                }
                group.leave()
            }
            dataTask.resume()
            group.notify(queue: .main) {
                self.loadUI()
            }
        }
        
    }
    func loadUI() {
        DispatchQueue.main.async {
            self.loadView()
        }
    }
}
