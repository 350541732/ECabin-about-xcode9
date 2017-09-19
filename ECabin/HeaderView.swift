//
//  HeaderView.swift
//  ECabin
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
class HeaderView: UIView {
    var flightInfoLabel:UILabel!
    var searchBtn:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.flightInfoLabel = UILabel.init()
        self.addSubview(flightInfoLabel)
        self.flightInfoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.bottom.equalTo(self.snp.bottom).offset(-10.0)
            make.width.equalTo(150.0)
        }
        self.flightInfoLabel.text = "本地航班信息列表"
        self.flightInfoLabel.font = UIFont.systemFont(ofSize: 16)
        self.flightInfoLabel.textColor = UIColor.black
        
        self.searchBtn = UIButton.init()
        self.addSubview(searchBtn)
        self.searchBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-20.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.bottom.equalTo(self.snp.bottom).offset(-10.0)
            make.width.equalTo(80)
        }
        self.searchBtn.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "btn_bg")!)
        self.searchBtn.setTitle("查询航班", for: .normal)
        self.searchBtn.setTitleColor(UIColor.white, for: .normal)
        //按钮动作~
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
