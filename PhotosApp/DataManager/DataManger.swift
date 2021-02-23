//
//  DataManger.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class DataManger: DataManagerProtocol {
    
    let userDefaults = UserDefaults.standard
    weak var presenter: PresenterProtocol?
    
    func savePhoto(image: UIImage) {
        UserDefaults.resetStandardUserDefaults()
         userDefaults.set([image],forKey: "ImagePhotos1")
//        if var  photos = userDefaults.imageArray(forKey: "ImagePhotos") {
//        photos.append(image)
//        userDefaults.set(photos,forKey: "ImagePhotos")
//        } else {
//             userDefaults.set([image],forKey: "ImagePhotos")
//        }
        presenter?.upDatePhotos()
    }
    
    func getPhotos() -> [UIImage]{
        return userDefaults.imageArray(forKey: "ImagePhotos1")!
    }
    
    
}


extension UserDefaults {
    func imageArray(forKey key: String) -> [UIImage]? {
        guard let array = self.array(forKey: key) as? [Data] else {
            return nil
        }
        return array.compactMap() { UIImage(data: $0) }
    }

    func set(_ imageArray: [UIImage], forKey key: String) {
        self.set(imageArray.compactMap({ $0.pngData() }), forKey: key)
    }
}
