//
//  PhotoViewController.swift
//  PhotoRama
//
//  Created by Alex Retter on 4/9/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!

    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = PhotoDataSource()
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                switch photosResult {
                case let .Success(photos):
                    print("SUCCESSFULLY FOUND \(photos.count) RECENT PHOTOS")
                    self.photoDataSource.photos = photos
                case let .Failure(error):
                    self.photoDataSource.photos.removeAll()
                    print("ERROR FETCHING RECENT PHOTOS:\(error)")
                }
                self.collectionView.reloadSections(NSIndexSet(index: 0))
            }
        }
    }
}