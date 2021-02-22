//
//  Presenter.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import Foundation

class Presenter: PresenterProtocol {
    
    var coordinatorOutPut: (ViewOutPut) -> Void
    
    init(coordinatorOutPut: @escaping (ViewOutPut) -> Void) {
        self.coordinatorOutPut = coordinatorOutPut
    }
    
    func goToGallery() {
        coordinatorOutPut(.gallery)
    }
    
    func goToCamera() {
        coordinatorOutPut(.camera)
    }
    
    
}
