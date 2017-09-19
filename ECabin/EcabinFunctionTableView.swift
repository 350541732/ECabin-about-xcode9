//
//  EcabinFunctionTableView.swift
//  ECabin
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
//---------------------------------移动客舱系统功能表  侧栏--------------------------

class EcabinFunctionTableView: UIView {

    var ecabinFuc:UILabel! // 标题
    var hideSlideBtn:UIButton! // 隐藏侧栏
    var psgInfoBtn:UIButton! //旅客信息
    var weatherBtn:UIButton! // 天气预报
    var flightdyBtn:UIButton! // 航班动态
    var dataQueryBtn:UIButton! // 资料查询
    var runNetwork:UIButton! // 运行网
    var prepareBtn:UIButton! // 准备网
    
    let btnWidth:CGFloat = 40
    let btnHeight:CGFloat = 55
    let topSpace_1:CGFloat = 60
    let topSpace_2:CGFloat = 50
    let leftSpace_1:CGFloat = 30
    let leftSpace_2:CGFloat = 30
    weak var delegate:PassengerInfoViewController?
    let titlesArray = ["旅客信息","天气预报","航班动态","资料查询","运行网","准备网"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "rightSideBar_bg")!)
        
        self.ecabinFuc = UILabel.init()
        self.addSubview(ecabinFuc)
        self.hideSlideBtn = UIButton.init()
        self.addSubview(hideSlideBtn)
        
        self.psgInfoBtn = UIButton.init()
        self.addSubview(psgInfoBtn)

        self.weatherBtn = UIButton.init()
        self.addSubview(weatherBtn)

        self.flightdyBtn = UIButton.init()
        self.addSubview(flightdyBtn)
        
        self.dataQueryBtn = UIButton.init()
        self.addSubview(dataQueryBtn)
        
        self.runNetwork = UIButton.init()
        self.addSubview(runNetwork)
        
        self.prepareBtn = UIButton.init()
        self.addSubview(prepareBtn)
        
        self.initUI()

    }
    func initUI(){
        self.ecabinFuc.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30.0)
            make.top.equalTo(self.snp.top).offset(50.0)
            make.right.equalTo(self.hideSlideBtn.snp.left).offset(-30.0)
            make.height.equalTo(30.0)
        }
        self.ecabinFuc.text = "移动客舱系统功能表"
        self.ecabinFuc.textColor = UIColor.white
        self.ecabinFuc.textAlignment = .center
        self.ecabinFuc.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        self.hideSlideBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(50.0)
            make.right.equalTo(self.snp.right).offset(-30.0)
            make.height.equalTo(25.0)
            make.width.equalTo(50.0)
        }
        self.hideSlideBtn.setImage(UIImage.init(named: "rightSideBar_hidebt_up"), for:.normal)
        self.hideSlideBtn.tag = 999
        self.hideSlideBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        
        self.psgInfoBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace_1)
            make.top.equalTo(self.ecabinFuc.snp.bottom).offset(topSpace_1)
            make.height.equalTo(btnHeight)
            make.width.equalTo(weatherBtn.snp.width)
        }
        self.psgInfoBtn.setImage(UIImage.init(named: "rightSideBar_passengerinf_up"), for: .normal)
        self.psgInfoBtn.tag = 1000
        self.psgInfoBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)


        self.weatherBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.psgInfoBtn.snp.right).offset(leftSpace_2)
            make.top.equalTo(self.ecabinFuc.snp.bottom).offset(topSpace_1)
            make.height.equalTo(btnHeight)
            make.width.equalTo(flightdyBtn.snp.width)
        }
        self.weatherBtn.setImage(UIImage.init(named: "weathersearch_up"), for: .normal)
        self.weatherBtn.tag = 1001
        self.weatherBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        
        self.flightdyBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.weatherBtn.snp.right).offset(leftSpace_2)
            make.top.equalTo(self.ecabinFuc.snp.bottom).offset(topSpace_1)
            make.height.equalTo(btnHeight)
            make.right.equalTo(self.snp.right).offset(-leftSpace_2)
        }
        self.flightdyBtn.setImage(UIImage.init(named: "rightSideBar_flightdynamic_up"), for: .normal)
        self.flightdyBtn.tag = 1002
        self.flightdyBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)

        self.dataQueryBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace_1)
            make.top.equalTo(self.psgInfoBtn.snp.bottom).offset(topSpace_2)
            make.height.equalTo(btnHeight)
            make.width.equalTo(psgInfoBtn.snp.width)
        }
        self.dataQueryBtn.setImage(UIImage.init(named: "rightSideBar_materialsearch_up")?.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dataQueryBtn.tag = 1003
        self.dataQueryBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        
        self.runNetwork.snp.makeConstraints { (make) in
            make.left.equalTo(self.dataQueryBtn.snp.right).offset(leftSpace_2)
            make.top.equalTo(self.psgInfoBtn.snp.bottom).offset(topSpace_2)
            make.height.equalTo(btnHeight)
            make.width.equalTo(prepareBtn.snp.width)
        }
        self.runNetwork.setImage(UIImage.init(named: "rightSideBar_network_up"), for: .normal)
        self.runNetwork.tag = 1004
        self.runNetwork.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)


        self.prepareBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.runNetwork.snp.right).offset(leftSpace_2)
            make.top.equalTo(self.psgInfoBtn.snp.bottom).offset(topSpace_2)
            make.height.equalTo(btnHeight)
            make.right.equalTo(self.snp.right).offset(-leftSpace_2)
        }
        self.prepareBtn.setImage(UIImage.init(named: "hqzb"), for: .normal)
        self.prepareBtn.tag = 1005
        self.prepareBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        
        //添加标题
        for i in 0...titlesArray.count-1{
            let titleLabel = UILabel.init()
            self.addSubview(titleLabel)
            let btn = self.viewWithTag(1000+i) as! UIButton
            titleLabel.snp.makeConstraints({ (make) in
                make.centerX.equalTo(btn.snp.centerX)
                make.width.equalTo(btn.snp.width)
                make.top.equalTo(btn.snp.bottom).offset(3.0)
            })
            titleLabel.text = titlesArray[i]
            titleLabel.font = UIFont.systemFont(ofSize: 12)
            titleLabel.textColor = UIColor.white
            titleLabel.textAlignment = .center
        }
    }
    func btnClick(_ sender:UIButton){
        print(sender.tag)
        if sender.tag == 999{
            let notificationName = Notification.Name.init(rawValue: "hideSliderMenu")
            NotificationCenter.default.post(name: notificationName, object: self)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
