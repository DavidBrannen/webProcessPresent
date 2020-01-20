//
//  DogTableViewCell.swift
//  webProcessPresent
//
//  Created by MAC on 1/16/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

//    var rankLabel: UILabel?
//    var breedLabel: UILabel?
//    var dogImage: UIImageView?
    var message : String?
    var mainImage : UIImage?
    
    let messageView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(messageView)
        addSubview(mainImageView)
        
        mainImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        messageView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let message = message {
            messageView.text = message
        }
        if let image = mainImage {
            mainImageView.image = image
        }
    }

}
