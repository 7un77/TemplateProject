//
//  Convenient.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/8/15.
//  Copyright © 2017年 http://h94uang@gmail.com. All rights reserved.
//

import Foundation
import UIKit

/// 屏幕高度
let kScreenHeight:CGFloat   = UIScreen.main.bounds.size.height;
/// 屏幕宽度
let kScreenWidth:CGFloat    = UIScreen.main.bounds.size.width;
/// 菜单栏高度
let kTabbarHeight:CGFloat       = 49.0
/// 状态栏高度
let kStatusBarHeight:CGFloat    = 20.0
/// 导航栏高度
let kNavigationHeight:CGFloat   = 44.0
/// 导航栏加状态栏高度
let kStatusBarAndNavigationBarHeight:CGFloat = kStatusBarHeight + kNavigationHeight

/// 是否为 iPhone
let kIsIPhone: Bool = UIDevice.current.userInterfaceIdiom == .phone ? true : false


// MARK: 便捷构造方法

/// 日志输出
///
/// - Parameters:
///   - message:    输出信息
///   - file:       文件
///   - method:     方法
///   - line:       行数
func slog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        print("- [\((file as NSString).lastPathComponent)(\(line)) \(method)]\n- \(message)")
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

