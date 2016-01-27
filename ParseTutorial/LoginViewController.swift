//
//  LoginViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var userTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  let scrollViewWallSegue = "LoginSuccesful"
  let tableViewWallSegue = "LoginSuccesfulTable"
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let user = PFUser.currentUser() {
      if user.isAuthenticated() {
        self.performSegueWithIdentifier(tableViewWallSegue, sender: nil)
      }
    }
  }
  
  // MARK: - Actions
  @IBAction func logInPressed(sender: AnyObject) {
    PFUser.logInWithUsernameInBackground(userTextField.text!, password: passwordTextField.text!) { user, error in
      if user != nil {
        self.performSegueWithIdentifier(self.tableViewWallSegue, sender: nil)
      } else if let error = error {
        self.showErrorView(error)
      }
    }
  }
}
