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
        
        let infoDictionary = Bundle.main.infoDictionary!
        let appDisplayName = infoDictionary["CFBundleDisplayName"]
        let majorVersion = infoDictionary["CFBundleShortVersionString"]
        let minorVersion = infoDictionary["CFBundleVersion"]
        debugPrint(" ************************************************************ ")
        debugPrint(" Bundle Display Name:\(appDisplayName ?? kSRTemplateProjectsTitle) ")
        debugPrint(" Bundle Short Version String:\(describing: majorVersion ?? "1.0.0") ")
        debugPrint(" Bundle Version:\(describing: minorVersion ?? 000000000000) ")
        debugPrint(" Copyright © 2017年 北京智见互联科技有限公司. All rights reserved. ")
        debugPrint(" ************************************************************ ")
        print("\n")
    }
}
