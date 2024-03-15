//
//  CameraHandler.swift
//  AzCamera
//
//  Created by Sefa Aycicek on 15.03.2024.
//

import UIKit

class CameraHandler : NSObject {
    
    var imageCallback : ((UIImage?)->())? = nil
    
    func camera(viewController : UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let myPickerController = UIImagePickerController()
            myPickerController.sourceType = .camera
            myPickerController.delegate = self
            viewController.present(myPickerController, animated: true)
        }
    }
    
    func photo(viewController : UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let myPickerController = UIImagePickerController()
            myPickerController.sourceType = .photoLibrary
            myPickerController.delegate = self
            viewController.present(myPickerController, animated: true)
        }
    }

}

extension CameraHandler : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           imageCallback?(image)
            
            picker.dismiss(animated: true)
        }
    
    }
}

