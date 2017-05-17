//
//  ViewController.swift
//  EPCPhotoMobile-CompressionDemo
//
//  Created by Shuo Cao on 5/16/17.
//  Copyright © 2017 Ivy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView) //This add it the view controller without constraints
        imageViewConstraints() //This function is outside the viewDidLoad function that controls the constraints
    }

    let imageView: UIImageView = {
        let theImageView = UIImageView()
        let image = UIImage(named: "IMG_1023.JPG")
//        theImageView.image = UIImage(named: "IMG_1023.JPG")
        let imageData = UIImageJPEGRepresentation(image!, 0.7)
        theImageView.image = UIImage(data:imageData!,scale:1.0)
        UIGraphicsBeginImageContext(CGSize(width:2880.0,height:2880.0))
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        return theImageView
    }()
    
        func imageViewConstraints() {
        imageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

