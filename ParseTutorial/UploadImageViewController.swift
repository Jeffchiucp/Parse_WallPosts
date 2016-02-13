//
//  UploadImageViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit
import CoreData

class UploadImageViewController: UIViewController {
  
  @IBOutlet weak var imageToUpload: UIImageView!
  @IBOutlet weak var commentTextField: UITextField!
  @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
  
  var username: String?
  var pffiles = [PFFile]()
  // pffiles is an array of the pffile
  // need to look into the managedObjectContext
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  //fetchRequest for PFfile
  //let fetchRequest = NSFetchRequest(PFFile : "pffile")
    
    let fetchRequest = NSFetchRequest(entityName : "pffile")
//    fetchRequest =
//    do {
//      if let PFfiles {
//      try managedObjectContext.executeFetchRequest(fetchRequest)
//      as? [Pffile] {
//        PFFile = PFfiles
//      }
//    } catch {
//      fatalError("Error fetching data!")
//    }
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Actions
  @IBAction func selectPicturePressed(sender: AnyObject) {
    //Open a UIImagePickerController to select the picture
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    presentViewController(imagePicker, animated: true, completion: nil)
  }

  
  
  @IBAction func sendPressed(sender: AnyObject) {
    
   if imageToUpload.image == nil { showMessageView("Wow, you don't have the image. You cannot to move on"); return }
    
    commentTextField.resignFirstResponder()
    
    //Disable the send button until we are ready
    // check if the image is wrapped
    // "Wow, you don't have the image. You cannot to move on"
    // print(a line that it does not work)
    
    navigationItem.rightBarButtonItem?.enabled = false
    
    loadingSpinner.startAnimating()
    
    //TODO: Upload a new picture
    
    
    let pictureData = UIImageJPEGRepresentation(imageToUpload.image!, 0.5)
    
    //1
    let file = PFFile(name: "image", data: pictureData!)
    file.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
      if succeeded {
        //2
        self.saveWallPost(file)
      } else if let error = error {
        //3
        self.showErrorView(error)
      }
      }, progressBlock: { percent in
        //4
        print("Uploaded: \(percent)%")
    })
  }
  
  func saveWallPost(file: PFFile)
  {
    //1
    let wallPost = WallPost(image: file, user: PFUser.currentUser()!, comment: self.commentTextField.text)
    //2
    wallPost.saveInBackgroundWithBlock{ succeeded, error in
      if succeeded {
        //3
        self.navigationController?.popViewControllerAnimated(true)
      } else {
        //4
        if let _ = error?.userInfo["error"] as? String {
          self.showErrorView(error!)
        }
      }
    }
  }
  
}

extension UploadImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    var newImage: UIImage
    //Place the image in the imageview
    if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
      newImage = possibleImage
    } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
      newImage = possibleImage
    } else {
      return
    }
    print(newImage.size)
  imageToUpload.image = newImage
dismissViewControllerAnimated(true, completion: nil)
  }
}