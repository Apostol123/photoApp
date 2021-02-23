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
    
    var content:[UIImage] = [] {
        didSet {
            photoCollection.reloadData()
        }
    }
    
    var presenter: PresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureButtons()
        photoCollection.delegate = self
        photoCollection.dataSource = self
        photoCollection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "myCell")

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
//        presenter?.goToCamera()
        
        
    }
    
    
    @IBAction func goToGallery(_ sender: UIButton) {
      let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
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

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let image = info[.originalImage] as? UIImage {
            presenter?.didSelectImage(image: image)
        }
    }
}

extension ViewController: ViewProtocol {
    func update(photos: [UIImage]) {
        self.content = photos
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let item = content[indexPath.row]
        let cell = photoCollection.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .red
        return cell
    }
    
    
}
