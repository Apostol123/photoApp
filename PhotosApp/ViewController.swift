//
//  ViewController.swift
//  PhotosApp
//
//  Created by Apostol, Alexandru on 22/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var photoCollection: UICollectionView!
    
    
    @IBOutlet var goToCameraButton: UIButton!
    
    @IBOutlet var goToGalleryButtpn: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureButtons()

        // Do any additional setup after loading the view.
    }
    
    func configureTitle() {
        titleLabel.text = "Photo App"
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: 28)
        titleLabel.textAlignment = .center
        
    }
    
    func configureButtons() {
        goToCameraButton.setTitle("Camera", for: .normal)
        goToCameraButton.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 28)
        goToGalleryButtpn.setTitle("Gallery", for: .normal)
        goToGalleryButtpn.titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 28)
    }
    
    
    @IBAction func goToCamera(_ sender: UIButton) {
        
    }
    
    
    @IBAction func goToGallery(_ sender: UIButton) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
