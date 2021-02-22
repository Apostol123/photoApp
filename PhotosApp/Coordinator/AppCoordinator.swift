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
        case didGoToManinScreen
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
        case .didGoToManinScreen,.initial,.goToCamera,.didGoToCamera,.goToGallery,.didGoToGallery:
            fatalError("Case not implemented")
        }
    }
    
    func next(_ state: CoordiantorState) -> CoordiantorState {
        switch state {
        case .initial:
            return .goToMainScreen
        case .didGoToManinScreen,.goToCamera,.didGoToCamera,.goToGallery,.didGoToGallery,.goToMainScreen:
            return state
        }
    }
    
    func goToMainSceen() {
        let vc = ViewController()
        navigator.pushViewController(vc, animated: true)
    }
}
