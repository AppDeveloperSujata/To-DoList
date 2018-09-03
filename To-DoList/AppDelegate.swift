//
//  AppDelegate.swift
//  To-DoList
//
//  Created by Sujata Shyam on 8/20/18.
//  Copyright © 2018 Sujata Shyam. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        //print(Realm.Configuration.defaultConfiguration.fileURL)

        do
        {
            _ = try Realm()
        }
        catch
        {
            print("Error initializing new realm, \(error)")
        }
        
        
        
        
        return true
    }

   
   
    
}
