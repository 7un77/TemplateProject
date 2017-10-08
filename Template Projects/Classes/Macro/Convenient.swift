//
//  Convenient.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/8/15.
//  Copyright © 2017年 http://h94uang@gmail.com. All rights reserved.
//

import Foundation
import UIKit

// MARK: -便捷构造方法
/// 日志输出
///
/// - Parameters:
///   - message:    输出信息
///   - file:       文件
///   - method:     方法
///   - line:       行数
func slog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        let dformatter = DateFormatter()
        
        dformatter.dateFormat = DateTimeFormatter.Formatter_Default.rawValue
        
        let datestr = dformatter.string(from: Date())
        
        print("[\(datestr)] - [\((file as NSString).lastPathComponent)(\(line)) \(method)]\n- \(message)")
    #endif
}


/// 十六进制颜色转换
///
/// - Parameters:
///   - rgbValue:   十六进制颜色
///   - alpha:      透明度 = 1
/// - Returns:      UIColor
func UIColorFromRGB(rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
    
    return UIColor(
        
        red:    CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green:  CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue:   CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha:  CGFloat(alpha)
    )
}


/// 获取纯色图片
///
/// - Parameters:
///   - color:  颜色
///   - size:   图片大小
/// - Returns:  UIImage
func UIImageWithColor(color: UIColor, size: CGSize) -> UIImage {
    
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height);
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.addRect(rect)
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return img!
}

// MARK: -常用常量
/// 设备相关
struct Device {
    
    fileprivate static let iPhoneXHeight: CGFloat = 812.0
    
    static let width: CGFloat = { UIScreen.main.bounds.size.width }()
    static let height: CGFloat = { UIScreen.main.bounds.size.height }()
    static let tabbarHeight: CGFloat = Device.isPhoneX ? 83 : 49
    static let navigationBarHeight: CGFloat = Device.isPhoneX ? 88 : 64
    
    /// 是否模拟器
    static let isSimulator: Bool = {
        
        var isSimul = false
        
        #if arch(i386) || arch(x86_64)
            isSimul = true
        #endif
        
        return isSimul
    }()
    
    /// 是否 iPhoneX
    static let isPhoneX: Bool = { Device.height == iPhoneXHeight }()
    
    /// 是否 iPad
    static let isPad: Bool = { UIDevice.current.userInterfaceIdiom == .pad }()
    
    /// 当前设备名称
    static let name: String = { UIDevice.current.name }()
    
    /// 当前设备型号
    static let model: String = { UIDevice.current.model }()
    
    /// 设备系统版本
    static let sysVersion:Double = { UIDevice.current.systemVersion._bridgeToObjectiveC().doubleValue }()
}

/// 程序相关
struct Application {
    
    static let version: String = { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String }()
    static let name: String = {
        
        var temp = Bundle.main.infoDictionary?["CFBundleDisplayName"]
        
        return temp == nil ? kSRTemplateProjectsTitle : temp as! String
    }()
    static let buildVersion: String = {
        
        var temp = Bundle.main.infoDictionary?["CFBundleVersion"] 
        
        return temp == nil ? "000000000001" : temp as! String
    }()
}

// MARK: -DataFormatterStringEnum
/// 时间格式字符串枚举
///
/// - Formatter_Default:            yyyy-MM-dd HH:mm:ss
/// - Formatter_yyMMdd_HHmm:        yy-MM-dd HH:mm
/// - Formatter_yyyyMMdd_HHmm:      yyyy-MM-dd HH:mm
/// - Formatter_yyyyMMdd:           yyyy-MM-dd
/// - Formatter_MMdd_HHmmss:        MM-dd HH:mm:ss
/// - Formatter_MMdd_HHmm:          MM-dd HH:mm
/// - Formatter_HHmmss:             HH:mm:ss
/// - Formatter_HHmm:               HH:mm
/// - Formatter_MMdd:               MM-dd
/// - Formatter_yyMMdd:             yy-MM-dd
/// - Formatter_yyyyMMddHHmmss:     yyyyMMddHHmmss
/// - Formatter_yyyyMMdd_HHmmssSSS: yyyy-MM-dd HH:mm:ss.SSS
/// - Formatter_yyyyHHddHHmmssSSS:  yyyyMMddHHmmssSSS
/// - Formatter_yyyy_MM_dd:         yyyy.MM.dd
enum DateTimeFormatter:String {
    case Formatter_Default            = "yyyy-MM-dd HH:mm:ss"
    case Formatter_yyMMdd_HHmm        = "yy-MM-dd HH:mm"
    case Formatter_yyyyMMdd_HHmm      = "yyyy-MM-dd HH:mm"
    case Formatter_yyyyMMdd           = "yyyy-MM-dd"
    case Formatter_MMdd_HHmmss        = "MM-dd HH:mm:ss"
    case Formatter_MMdd_HHmm          = "MM-dd HH:mm"
    case Formatter_HHmmss             = "HH:mm:ss"
    case Formatter_HHmm               = "HH:mm"
    case Formatter_MMdd               = "MM-dd"
    case Formatter_yyMMdd             = "yy-MM-dd"
    case Formatter_yyyyMMddHHmmss     = "yyyyMMddHHmmss"
    case Formatter_yyyyMMdd_HHmmssSSS = "yyyy-MM-dd HH:mm:ss.SSS"
    case Formatter_yyyyHHddHHmmssSSS  = "yyyyMMddHHmmssSSS"
    case Formatter_yyyy_MM_dd         = "yyyy.MM.dd"
}

