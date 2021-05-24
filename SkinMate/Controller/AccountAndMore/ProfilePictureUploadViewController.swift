//
//  ProfilePictureUploadViewController.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Extension to pick image from gallery.
extension AccountViewController:  UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func uploadPicture() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImage = pickedImage
            profilePic.image = selectedImage
            ProfilePhotoUpload.shared.uploadPhoto(image: selectedImage)
            dismiss(animated: true, completion: nil)
        }
        
    }
}
