//
//  DataManagerProtocol.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

protocol DataManagerProtocol: class {
    func savePhoto(image:UIImage)
    func getPhotos() -> [UIImage]
}
