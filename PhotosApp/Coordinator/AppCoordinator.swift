//
//  AppCoordinator.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    enum CoordiantorState {
        case initial
        case goToMainScreen
        case willShowGallery
        case willShowCamera
        case goToCamera
        case didGoToCamera
        case goToGallery
        case didGoToGallery
    }
    
    var state:CoordiantorState
    var navigator: UINavigationController
    
    init(navigator: UINavigationController) {
        self.state = .initial
        self.navigator = navigator
    }
    
    func start() {
        loop()
    }
    
    func loop() {
        state = next(state)
        switch state {
        case .goToMainScreen:
            goToMainSceen()
        case .goToGallery:
            goToGallery()
        case .willShowGallery,.initial,.didGoToCamera,.goToCamera,.didGoToGallery,.willShowCamera:
            fatalError("Case not implemented")
        }
    }
    
    func next(_ state: CoordiantorState) -> CoordiantorState {
        switch state {
        case .initial:
            return .goToMainScreen
        case .willShowGallery:
            return .goToGallery
        case .goToCamera,.didGoToCamera,.goToGallery,.didGoToGallery,.goToMainScreen,.willShowCamera:
            return state
      
        }
    }

    func goToGallery() {
        print("In go To Galler func")
    }
    
    func goToMainSceen() {
        let vc = Builder(coordinatorOutput: { [weak self] output in
            switch output {
            case .gallery:
                self?.state = .willShowGallery
                self?.loop()
                print("Gallery")
            case .camera:
                print("Camera")
            
            }
        }).build()
        navigator.pushViewController(vc, animated: true)
    }
}
