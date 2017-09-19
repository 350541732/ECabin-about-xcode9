//
//  MenuViewController.swift
//  ECabin
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
import FSPagerView

class MenuViewController: UIViewController,FSPagerViewDelegate , FSPagerViewDataSource  {
    lazy var imageArray: [String] = {
        
        let array: [String] = ["flightpre","flightdynamic","networ","passengerinf","weathersearch","materialsearch"]
        return array
    }()    
    var collectionView: FSPagerView!
    var pageControl:FSPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView =  FSPagerView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 400))
        collectionView.itemSize = CGSize.init(width: 250, height: 250)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource  = self
        collectionView.delegate = self
        self.collectionView.transformer = FSPagerViewTransformer.init(type: .linear)
        self.view.addSubview(collectionView)
        collectionView.register(ImageTextCell.self, forCellWithReuseIdentifier: "ImageTextCell")
        pageControl = FSPageControl()
        pageControl.frame = CGRect.init(x: self.view.frame.width/2, y: 500, width: 100, height: 20)
        pageControl.numberOfPages = imageArray.count
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPage = 3
        self.view.addSubview(pageControl)
        self.view.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "Default-Landscape")?.withRenderingMode(.alwaysOriginal))!)
    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 6
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "ImageTextCell", at: index) as! ImageTextCell
        cell.imageview?.image = UIImage.init(named: self.imageArray[index])
        return cell
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        if self.pageControl.currentPage == index{
            print("我在最中间~")
            //做跳转操作~~~~
            let passengerVC = PassengerInfoViewController()
            self.navigationController?.pushViewController(passengerVC, animated: true)
            print(index)
        }else{
            pagerView.deselectItem(at: index, animated: true)
            pagerView.scrollToItem(at: index, animated: true)
            self.pageControl.currentPage = index
        }
    }
    //是当前居中 进入 不是居中那个滑动至居中
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard self.pageControl.currentPage != pagerView.currentIndex else {
            return
        }
        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
    }
    //默认滚动到第几个
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.scrollToItem(at: 3, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
