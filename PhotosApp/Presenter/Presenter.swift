//
//  Presenter.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class Presenter: PresenterProtocol {
    
    var coordinatorOutPut: (ViewOutPut) -> Void
    var dataManager: DataManagerProtocol
    weak var view: ViewProtocol?
    
    init(dataManager:DataManagerProtocol ,coordinatorOutPut: @escaping (ViewOutPut) -> Void) {
        self.coordinatorOutPut = coordinatorOutPut
        self.dataManager = dataManager
    }
    
    func goToGallery() {
        coordinatorOutPut(.gallery)
    }
    
    func goToCamera() {
        coordinatorOutPut(.camera)
    }
    
    func didSelectImage(image: UIImage) {
        dataManager.savePhoto(image: image)
    }
    
    func upDatePhotos() {
        view?.update(photos: dataManager.getPhotos())
    }
    
    
}
