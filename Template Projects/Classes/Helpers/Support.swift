//
//  Support.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/9/25.
//  Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved.
//

import UIKit

/// support service on application
class Support {
    
    /// network core
    var net: Net!
    
    init() {
        
        Support.applicationDidStart()
        
        self.net = Net()
        
        slog(message: "the program support component is loaded.")
    }
    
    
    /// validate first launch status
    public func initApplicationWindow() -> BaseViewController {
        if UserDefaults.Application.string(forKey: .lastBoot) == Application.version {
            UserDefaults.Application.set(value: Application.version, forKey: .lastBoot)
            return BootViewController()
        }else {
            return ViewController()
        }
    }
    
    /// application log
    fileprivate static func applicationDidStart(){
        
        debugPrint(" ************************************************************************************ ")
        debugPrint(" Bundle Display Name:\(Application.name) ")
        debugPrint(" Bundle Short Version:\(Application.version) ")
        debugPrint(" Bundle Version:\(Application.buildVersion) ")
        debugPrint(" Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved. ")
        debugPrint(" ************************************************************************************ ")
        print("\n")
        
    }
}
