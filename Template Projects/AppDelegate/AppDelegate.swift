//
//  AppDelegate.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/9/22.
//  Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var support: Support!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        support = Support()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = support.initApplicationWindow()
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

