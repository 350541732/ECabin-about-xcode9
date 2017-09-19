//
//  DetailFooter.swift
//  ECabin
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit

class DetailFooter: UIView {

    var cancelLabel:UILabel! // 取消原因
    var delayLabel:UILabel! // 延误原因
    var remarkLabel:UILabel! // 备注原因
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0x466EC0)
        self.initUI()
    }
    func initUI(){
        self.cancelLabel = UILabel.init()
        self.addSubview(cancelLabel)
        self.delayLabel = UILabel.init()
        self.addSubview(delayLabel)
        self.remarkLabel = UILabel.init()
        self.addSubview(remarkLabel)
        
        self.cancelLabel.textColor = UIColor.white
        self.cancelLabel.font = UIFont.systemFont(ofSize: 13)
        self.delayLabel.textColor = UIColor.white
        self.delayLabel.font = UIFont.systemFont(ofSize: 13)
        self.remarkLabel.textColor = UIColor.white
        self.remarkLabel.font = UIFont.systemFont(ofSize: 13)
        //约束
        self.cancelLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.width.equalTo(300.0)
            make.height.equalTo(30.0)
        }
        self.delayLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.cancelLabel.snp.bottom).offset(5.0)
            make.width.equalTo(300.0)
            make.height.equalTo(self.remarkLabel.snp.height)
        }
        self.remarkLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.width.equalTo(300.0)
            make.top.equalTo(self.delayLabel.snp.bottom).offset(5.0)
            make.height.equalTo(self.cancelLabel.snp.height)
        }
        //
        
        
        self.cancelLabel.text = "取消: 未取消"
        self.delayLabel.text = "延误: 未延误"
        self.remarkLabel.text = "备注: 无"
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
