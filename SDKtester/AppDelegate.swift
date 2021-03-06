//
//  AppDelegate.swift
//  SDK Tester
//
//  Created by Bondi, Andrea on 20/04/2017.
//  Copyright © 2017 Bondi, Andrea. All rights reserved.
//

import UIKit
import Firebase
//import PopupBridge

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Configure the Popup Bridge SDK with the URL scheme.
        // For NativeXO this is configured in Info.plist
        POPPopupBridge.setReturnURLScheme("popupbridge")
        
        // Initialise Firebase for basic analytics
        FirebaseApp.configure()
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        // The first if condition will happen when the application is returning after
        // NativeXO SDK took control
        if(url.scheme == "sdktester"){
            let instance:PYPLCheckout = PYPLCheckout.sharedInstance() as! PYPLCheckout;
            let wasHandled:Bool = instance.openURL(app, open: url as URL, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation]);
            return wasHandled
        }
            
        // Second option is with URL scheme "popupbridge", which means that
        // the application is returning after Popup Bridge SDK took control
        else if (url.scheme == "popupbridge"){
            return POPPopupBridge.open(url, options: options)
        }
        
        else {
            return false
        }
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

