//
//  UserDefaults.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/10/8.
//  Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

// 使用 where 子语句限制关联类型是字符串类型
extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}

extension UserDefaults {
    // 程序信息
    struct Application: UserDefaultsSettable {
        
        /// - lastBoot: 上次启动版本号
        enum defaultKeys: String {
            case lastBoot
        }
    }
    // 账户信息
    struct Account: UserDefaultsSettable {
        enum defaultKeys: String {
            case userName
            case age
        }
    }
    
    // 登录信息
    struct Login: UserDefaultsSettable {
        enum defaultKeys: String {
            case token
            case userId
        }
    }
}
