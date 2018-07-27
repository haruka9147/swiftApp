//
//  AppDelegate.swift
//  Assignment5
//
//  Created by 北田晴佳 on 2018/05/28.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()

        let vancouver = CityViewController()
        vancouver.title = "Vancouver"

        let toronto = CityViewController()
        toronto.title = "Toronto"
        
        let yellowknife = CityViewController()
        yellowknife.title = "Yellowknife"
        
        let edmonton = CityViewController()
        edmonton.title = "Edmonton"
        
        let calgary = CityViewController()
        calgary.title = "Calgary"
        
//        toronto.tabBarItem.image = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
//        yellowknife.tabBarItem.image = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
//        edmonton.tabBarItem.image = UITabBarItem(tabBarSystemItem: .topRated, tag: 3)
//        calgary.tabBarItem.image = UITabBarItem(tabBarSystemItem: .topRated, tag: 4)

        let controllers = [vancouver, toronto, yellowknife, edmonton, calgary]
        tabBarController.viewControllers = controllers

        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
        window?.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
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

