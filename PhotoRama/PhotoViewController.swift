//
//  PhotoViewController.swift
//  PhotoRama
//
//  Created by Alex Retter on 4/9/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos() {
            (PhotosResult) -> Void in
            
            switch PhotosResult {
                
            case let .Success(photos):
                print("Successfuly found \(photos.count) recent photos.")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(firstPhoto, completion: { (ImageResult) -> Void in
                        switch ImageResult {
                        case let .Success(image):
                            //self.imageView.image = image
                            NSOperationQueue.mainQueue().addOperationWithBlock {
                                self.imageView.image = image
                            }
                        case let .Failure(error):
                            print("Error downloading image \(error)")
                            
                        }
                    })
                }
                
            case let .Failure(error):
                print("Error fetching recent photos \(error)")
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextPhotoButtonTapped(sender: AnyObject) {
   
        
    }
    
}
