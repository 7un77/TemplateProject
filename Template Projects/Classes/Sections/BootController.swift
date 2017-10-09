//
//  BootController.swift
//  Template Projects
//
//  Created by 黄俊 on 2017/10/8.
//  Copyright © 2017年 Beijing Zhijian Internet Technology Co. Ltd. All rights reserved.
//

import UIKit

class BootViewController: BaseViewController {
    
    fileprivate let numberOfPage: Int = 3
    fileprivate var pageControl: UIPageControl!
    fileprivate lazy var nextButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("开始体验", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.alpha = 0.0
        button.layer.cornerRadius = 15.0
        return button
    }()
    fileprivate lazy var scrollView: UIScrollView = {
        let frame = self.view.bounds
        var scroll = UIScrollView(frame: frame)
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.scrollsToTop = false
        scroll.bounces = false
        scroll.contentOffset = CGPoint.zero
        for page in 0..<numberOfPage {
            let imageName = "\(kSRBootImageName)\(page)"
            let image = UIImage(named: "\(kSRBootImageName)\(page)")
            let imgFrame = CGRect(x: frame.size.width * CGFloat(page), y: 0, width: frame.size.width, height: frame.size.height)
            let imageView: UIImageView = UIImageView(frame: imgFrame)
            imageView.image = UIImage(named: "\(kSRBootImageName)\(page)")
            scroll.addSubview(imageView)
        }
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.nextButton)
        self.view.backgroundColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func updateViewConstraints() {
        self.nextButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        super.updateViewConstraints()
    }
    
    // 隐藏状态栏
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

extension BootViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
