//
//  AppDelegate.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = AppColors.themeColor
        window?.makeKeyAndVisible()
        
        //navigation bar
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = AppColors.defaultNavigationBarTitleColor
        appearance.barTintColor = AppColors.defaultNavigationBarColor
        //appearance.shadowImage = nil
        //appearance.setBackgroundImage(nil, for: .default)
        
        appearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: AppColors.defaultNavigationBarTitleColor,
            NSAttributedStringKey.font: AppFonts.defaultNavigationBarTitleFont
        ]
        
        let splitViewController = DefaultSplitViewController()
        
        
        let friendsVC = FriendsViewController()
        let friendNVC = UINavigationController.init(rootViewController: friendsVC)
        
        let detailVC = FriendDetailViewController()
        let detailNVC = UINavigationController.init(rootViewController: detailVC)
        
        splitViewController.viewControllers = [friendNVC, detailNVC]

        
        window?.rootViewController = splitViewController
        return true
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

