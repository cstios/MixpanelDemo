//
//  AppDelegate.swift
//  MixpanelDemo
//
//  Created by Surabhi Chopada on 03/02/17.
//  Copyright © 2017 Surabhi Chopada. All rights reserved.
//

import UIKit
import Mixpanel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IntialiseMixpanel()
        return true
    }
    
    func IntialiseMixpanel() {
        
        //Add your Mixpanel Token
        Mixpanel.initialize(token: "Your_Project_Token")
        //Event will be logged every 10 sec
        Mixpanel.mainInstance().flushInterval = 10
        
        // Identify
        var mixpanelID = UserDefaults.standard.object(forKey: "MixpanelID")
        if (mixpanelID == nil) {
            mixpanelID = UIDevice.current.identifierForVendor?.uuidString
            UserDefaults.standard.set(mixpanelID, forKey: "MixpanelID")
            }
        Mixpanel.mainInstance().identify(distinctId: mixpanelID as! String)
        // Register Super Properties
        Mixpanel.mainInstance().registerSuperProperties(["App Version" : "1.0"])
        //Track Event
        Mixpanel.mainInstance().track(event: "App Launched")
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

