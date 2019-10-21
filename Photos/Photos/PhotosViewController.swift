//
//  PhotosViewController.swift
//  Photos
//
//  Created by Cassidy Pelchat on 10/21/19.
//  Copyright © 2019 Cassidy Pelchat. All rights reserved.
//

import UIKit
import AVFoundation

class PhotosViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoDisplayed: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func importPhoto(_ sender: Any) {
        
        let photo = UIImagePickerController()
        photo.delegate = self
        
        photo.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        photo.allowsEditing = false
        
        self.present(photo, animated: true, completion: nil)
        
    }
    
    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
        let photo = UIImagePickerController()
        photo.delegate = self
        
        photo.sourceType = UIImagePickerControllerSourceType.camera
        
        photo.allowsEditing = false
        
        self.present(photo, animated: true, completion: nil)
    }
        else {
             alertNotifyUser(message: "This device does not have a camera.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoDisplayed.image = photo
        }
        else {
             alertNotifyUser(message: "The image was not imported successfully!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertNotifyUser(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) {
            (alertAction) -> Void in
            print("OK selected")
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
