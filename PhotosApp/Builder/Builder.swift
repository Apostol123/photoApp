//
//  Builder.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class Builder {
    
    var coordinatorOutput: (ViewOutPut) -> Void
    
    init(coordinatorOutput: @escaping(ViewOutPut) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let presenter = Presenter(coordinatorOutPut: coordinatorOutput)
        let viewController = ViewController()
        viewController.presenter = presenter
        return viewController
    }
}
