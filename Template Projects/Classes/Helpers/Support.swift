//
//  Support.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/9/25.
//  Copyright © 2017年 北京智见互联科技有限公司. All rights reserved.
//

import Foundation

/// support service on application
class Support {
    
    /// network core
    let net: Net!
    
    init() {
        
        Support.applicationDidStart()
        
        net = Net()
        
        slog(message: "the program support component is loaded.")
    }
    
    /// application log
    fileprivate static func applicationDidStart(){
        
        debugPrint(" ************************************************************ ")
        debugPrint(" Bundle Display Name:\(Application.name) ")
        debugPrint(" Bundle Short Version:\(Application.version) ")
        debugPrint(" Bundle Version:\(Application.buildVersion) ")
        debugPrint(" Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved. ")
        debugPrint(" ************************************************************ ")
        print("\n")
        
    }
}
