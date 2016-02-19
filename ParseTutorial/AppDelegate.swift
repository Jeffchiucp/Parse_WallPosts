//
//  AppDelegate.swift
//  WallPost
//
//  Created by Jeff Chiu on 1/17/16
//  Copyright (c) 2016 Jeff Chiu All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  lazy var coreDataStack = CoreDataStackManager()
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Parse.setApplicationId("jHZOA4z3wxnwdcIjuxqrzLmxrxgkXcaVtdICtras", clientKey: "Akqu8eTpeS3l44BOQvbpAnZzweRiuEvcPSVgzyqY")


      let navigationController = window!.rootViewController
        as! UINavigationController
      let listViewController =
      navigationController.topViewController
        as! CoreDataStackManager
//      listViewController.coreDataStack = coreDataStack
      
      return true
  }
  
  func applicationWillTerminate(application: UIApplication) {
    coreDataStack.saveContext()
  }
  
  
  
  func addTestData() {
//    guard let entity = NSEntityDescription.entityForName("file", inManagedObjectContext: managedObjectContext), personEntity = NSEntityDescription.entityForName("file", inManagedObjectContext: managedObjectContext) else {
      fatalError("Could not find file descriptions!")
    }
}

