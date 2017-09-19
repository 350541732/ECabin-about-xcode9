//
//  DetailHeader.swift
//  ECabin
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit

class DetailHeader: UIView {

    var flightAcreg:UILabel! //航班号
    var upCabinPrice:UILabel! //升舱价格
    var date:UILabel! // 日期
    var scheduleDepart:UILabel! // 计划出发
    var scheduleArrive:UILabel! // 计划到达
    var estimatedDepart:UILabel!//预计出发
    var estimatedArrive:UILabel!//预计到达
    var week:UILabel! // 星期
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0x466EC0)
        self.initUI()
    }
    func initUI(){
        self.flightAcreg = UILabel()
        self.addSubview(flightAcreg)
        self.upCabinPrice = UILabel()
        self.addSubview(upCabinPrice)
        self.date = UILabel()
        self.addSubview(date)
        self.scheduleDepart = UILabel()
        self.addSubview(scheduleDepart)
        self.scheduleArrive = UILabel()
        self.addSubview(scheduleArrive)
        self.estimatedDepart = UILabel()
        self.addSubview(estimatedDepart)
        self.estimatedArrive = UILabel()
        self.addSubview(estimatedArrive)
        self.week = UILabel()
        self.addSubview(week)
        self.flightAcreg.textColor = UIColor.white
        self.flightAcreg.font = UIFont.systemFont(ofSize: 17)
        self.upCabinPrice.textColor = UIColor.white
        self.upCabinPrice.font = UIFont.systemFont(ofSize: 17)
        self.date.textColor = UIColor.white
        self.date.font = UIFont.systemFont(ofSize: 15)
        self.date.textAlignment = .right
        self.scheduleDepart.textColor = UIColor.white
        self.scheduleDepart.font = UIFont.systemFont(ofSize: 13)
        self.scheduleArrive.textColor = UIColor.white
        self.scheduleArrive.font = UIFont.systemFont(ofSize: 13)
        self.estimatedDepart.textColor = UIColor.white
        self.estimatedDepart.font = UIFont.systemFont(ofSize: 13)
        self.estimatedArrive.textColor = UIColor.white
        self.estimatedArrive.font = UIFont.systemFont(ofSize: 13)
        self.week.textColor = UIColor.white
        self.week.font = UIFont.systemFont(ofSize: 15)
        self.week.textAlignment = .right
        //-------------------约束---------------------
        self.flightAcreg.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.width.equalTo(250.0)
            make.height.equalTo(30.0)
        }
        self.upCabinPrice.snp.makeConstraints { (make) in
            make.left.equalTo(self.flightAcreg.snp.right).offset(20.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.width.equalTo(150.0)
            make.height.equalTo(30.0)
        }
        self.date.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-30.0)
            make.top.equalTo(self.snp.top).offset(10.0)
            make.width.equalTo(150.0)
            make.height.equalTo(30.0)
        }
        self.scheduleDepart.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.flightAcreg.snp.bottom).offset(5.0)
            make.width.equalTo(100.0)
            make.height.equalTo(self.estimatedDepart.snp.height)
        }
        self.scheduleArrive.snp.makeConstraints { (make) in
            make.left.equalTo(self.scheduleDepart.snp.right).offset(20.0)
            make.top.equalTo(self.flightAcreg.snp.bottom).offset(5.0)
            make.width.equalTo(self.scheduleDepart.snp.width)
            make.height.equalTo(self.estimatedDepart.snp.height)
        }
        self.estimatedDepart.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(20.0)
            make.top.equalTo(self.scheduleDepart.snp.bottom).offset(5.0)
            make.width.equalTo(self.scheduleDepart.snp.width)
            make.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        self.estimatedArrive.snp.makeConstraints { (make) in
            make.left.equalTo(self.estimatedDepart.snp.right).offset(20.0)
            make.top.equalTo(self.scheduleDepart.snp.bottom).offset(5.0)
            make.width.equalTo(self.scheduleDepart.snp.width)
            make.bottom.equalTo(self.snp.bottom).offset(-10.0)
        }
        self.week.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-30.0)
            make.top.equalTo(self.date.snp.bottom).offset(5.0)
            make.width.equalTo(150.0)
            make.height.equalTo(30.0)
        }
        
        // 
        self.flightAcreg.text = "QW9844(海拉尔-呼哈浩特)"
        self.upCabinPrice.text = "升舱价格:70W"
        self.date.text = "2017年08月15日"
        self.scheduleDepart.text = "计划出发: 15:45"
        self.scheduleArrive.text = "计划到达: 18:00"
        self.estimatedDepart.text = "预计出发: 15:45"
        self.estimatedArrive.text = "预计到达: 18:00"
        self.week.text = "星期八"
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
