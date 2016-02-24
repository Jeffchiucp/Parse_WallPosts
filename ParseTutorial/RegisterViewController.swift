//
//  RegisterViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var userTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  let scrollViewWallSegue = "SignupSuccesful"
  let tableViewWallSegue = "SignupSuccesfulTable"
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Actions
  //Sign Up Button pressed
  @IBAction func signUpPressed(sender: AnyObject) {
    //1
    let user = PFUser()
    
    //2
    user.username = userTextField.text
    user.password = passwordTextField.text
    
    //3
    user.signUpInBackgroundWithBlock { succeeded, error in
      if (succeeded) {
        //The registration was successful, go to the wall
        self.performSegueWithIdentifier(self.tableViewWallSegue, sender: nil)
      } else if let error = error {
        //Something bad has occurred
        self.showErrorView(error)
      }
    }
  }
}
