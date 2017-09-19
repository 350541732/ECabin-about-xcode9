//
//  FlightInfoView.swift
//  ECabin
//
//  Created by apple on 2017/9/5.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
// ---------------    展示航班号 航班日期 飞行航段--- 旅客航程 以及座位视图        --------------
class FlightInfoView: UIView {
    //----------   展示航班号 航班日期 飞行航段
    lazy var title:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = kRGBColorFromHex(rgbValue: 0xCD3333)
        return label
    }()
    //---------- 旅客航程
    lazy var voyageLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = kRGBColorFromHex(rgbValue: 0xCD3333)
        label.text = "旅客航程:"
        return label
    }()
    //----------- 显示航段信息的按钮
    lazy var votageBtn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "groupButton")!)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        btn.titleLabel?.textAlignment = .left
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
    }()
    //------------座位视图或者乘客列表
    lazy var seatOrPsgBtn:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "btn_bg")!)
        btn.titleLabel?.textColor = UIColor.white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitle("座位视图", for: .normal)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.addSubview(title)
        self.addSubview(voyageLabel)
        self.addSubview(votageBtn)
        self.addSubview(seatOrPsgBtn)
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0xE0EEEE)
        //约束
        self.title.sizeToFit()
        
        self.seatOrPsgBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-10)
            make.width.equalTo(70)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        self.votageBtn.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.right.equalTo(self.seatOrPsgBtn.snp.left).offset(-10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        self.voyageLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.votageBtn.snp.left).offset(-3)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo(70)
        }
        self.title.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10.0)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }

        self.votageBtn.setTitle("哈尔滨啊-青岛啊啊", for: .normal)
        self.title.text = "QW9844 2017年09月04日飞行航段：海拉尔-呼和浩特"
        self.title.sizeToFit()
        self.voyageLabel.sizeToFit()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
