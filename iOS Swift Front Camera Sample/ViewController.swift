//
//  ViewController.swift
//  iOS Swift Front Camera Sample
//
//  Created by Paul MD on 7/6/15.
//  Copyright (c) 2015 Paul MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIImageView for photot
    @IBOutlet weak var imageView: UIImageView!
    
    // Change picture button action and outlet
    @IBAction func ChangePicture(sender: AnyObject) {
        ChangePictureButton.hidden = true
        CameraButton.hidden = false
        UploadButton.hidden = false
    }
    @IBOutlet weak var ChangePictureButton: UIButton!
    
    // Camera button action and outlet
    @IBAction func Camera(sender: AnyObject) {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.Camera) {
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.Camera
                picker.cameraDevice = UIImagePickerControllerCameraDevice.Front
                picker.cameraViewTransform = CGAffineTransformScale(picker.cameraViewTransform, -1, 1);
                presentViewController(picker, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var CameraButton: UIButton!
    
    // Upload button action and outlet
    @IBAction func Upload(sender: AnyObject) {
        let picker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerControllerSourceType.SavedPhotosAlbum) {
                picker.delegate = self
                picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                picker.allowsEditing = false
                self.presentViewController(picker, animated: true, completion: nil)
                
        }
    }
    @IBOutlet weak var UploadButton: UIButton!
    
    // Standard imagePickerController function; loads image taken into imageView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        ChangePictureButton.hidden = false
        CameraButton.hidden = true
        UploadButton.hidden = true
    }
    
    // Standard imagePickerControllerDidCancel function
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
