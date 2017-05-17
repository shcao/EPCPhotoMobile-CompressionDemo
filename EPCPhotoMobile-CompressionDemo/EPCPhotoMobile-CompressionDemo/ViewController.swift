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
        //compress image size
        let image = UIImage(named: "Imageposioncnvhvn.JPG")
        let originImageData = UIImageJPEGRepresentation(image!, 1)
        var size1 = originImageData?.count
        print("original image size in KB", size1!/1024)
        let imageData = UIImageJPEGRepresentation(image!, 0.3)
        var size2 = imageData?.count
        print("compressed image size in KB", size2!/1024)
        let newImage = UIImage(data:imageData!,scale:1.0)
        
        //resize image
        let imageSize = newImage?.size
        let targetWidth = CGFloat(2880.0)
        
        let width = imageSize?.width
        let height = imageSize?.height
        
        let targetHeight = (targetWidth / width!) * height!
        
        let sizeChange = CGSize(width:targetWidth, height:targetHeight)
        
        UIGraphicsBeginImageContext(sizeChange)
        
        let rect = CGRect(origin: CGPoint(x:0.0, y:0.0), size: sizeChange)
        
        newImage?.draw(in:rect)
        
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        theImageView.image = resizeImage
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

