//
//  ViewController.swift
//  iOSHax2
//
//  Created by George Hsin on 11/14/16.
//  Copyright © 2016 George Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CancelButtonDelegate {
    var allGIFS = [Array<UIImage>]()
    var gifimage = [UIImage]()
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var GIFImage: UIImageView!
    @IBAction func playGIFButtonPressed(sender: UIButton) {
        GIFImage.animationImages = gifimage
        GIFImage.animationDuration = 1
        GIFImage.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    @IBAction func GIFGalleryButton(sender: UIBarButtonItem) {
        performSegueWithIdentifier("goToGIFGallery", sender: sender)
    }
 
    @IBAction func TakeAPhotoButton(sender: UIButton) {
        
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .Camera
            presentViewController(picker, animated: true, completion: nil)
        
    }
    @IBAction func SaveGIFButton(sender: UIBarButtonItem) {
        allGIFS.append(gifimage)
    }
    @IBAction func chooseFromGalleryButton(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print (info[UIImagePickerControllerOriginalImage])
            print (pickedImage)
            gifimage.append(pickedImage)
            GIFImage.contentMode = .ScaleAspectFit
            GIFImage.image = pickedImage
            GIFImage.hidden = false
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func ResetGIFButton(sender: UIButton) {
        gifimage = [UIImage]()
        GIFImage.hidden = true
        GIFImage.stopAnimating()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToGIFGallery" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! GIFGalleryController
            controller.cancelButtonDelegate = self
            controller.gifArray = allGIFS
        }
    }
    
    
        
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

