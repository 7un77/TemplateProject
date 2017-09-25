//
//  Net.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/9/25.
//  Copyright © 2017年 北京智见互联科技有限公司. All rights reserved.
//

import Foundation

/// net core
class Net {
    
    /// net detector
    let hostReac: Reachability!
    
    init() {
        
        // init net detector
        hostReac = Reachability.forInternetConnection()
        
        hostReac.startNotifier()
        
        
        slog(message: "the network core is loaded.")
    }
}
