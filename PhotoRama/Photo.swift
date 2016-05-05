//
//  Photo.swift
//  PhotoRama
//
//  Created by Alex Retter on 4/9/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit

class Photo {
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    var image: UIImage?
    
    init(title: String, remoteURL: NSURL, photoID: String, dateTaken: NSDate) {
        
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
}