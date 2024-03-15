//
//  ViewController.swift
//  AzCamera
//
//  Created by Sefa Aycicek on 15.03.2024.
//

import UIKit

class ViewController: UIViewController {

    let cameraHandler = CameraHandler()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraHandler.imageCallback = { image in
            self.imageView.image = image
        }
    }
    
    @IBAction func camera() {
        cameraHandler.camera(viewController: self)
    }
    
    @IBAction func photo() {
        cameraHandler.photo(viewController: self)
    }

}
