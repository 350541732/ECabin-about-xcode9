//
//  HighEndHeader.swift
//  ECabin
//
//  Created by apple on 2017/9/5.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//---------------高端旅客 分组头   SectionHeader
class HighEndHeader: UIView {
//座位 舱位 姓名 性别 会员级别 职务 联系电话 乘机次数 服务喜好 家乡 备注项
    //----------座位-----------
    lazy var seat:UILabel = {
        let label = UILabel()
        label.text = "座位"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
     //----------舱位-----------
    lazy var cabinSeat:UILabel = {
        let label = UILabel()
        label.text = "舱位"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //----------姓名-----------
    lazy var name:UILabel = {
        let label = UILabel()
        label.text = "姓名"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //----------性别-----------
    lazy var gender:UILabel = {
        let label = UILabel()
        label.text = "性别"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //----------会员级别-----------
    lazy var membershipLevel:UILabel = {
        let label = UILabel()
        label.text = "会员级别"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //---------职务-----------
    lazy var duty:UILabel = {
        let label = UILabel()
        label.text = "职务"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //--------联系电话----------
    lazy var contactNumber:UILabel = {
        let label = UILabel()
        label.text = "联系电话"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //-----------乘机次数----------
    lazy var takeFlightNum:UILabel = {
        let label = UILabel()
        label.text = "乘机次数"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //-----------服务喜好----------
    lazy var servicePreference:UILabel = {
        let label = UILabel()
        label.text = "服务喜好"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //-----------家乡----------
    lazy var hometown:UILabel = {
        let label = UILabel()
        label.text = "家乡"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    //-----------备注项----------
    lazy var remark:UILabel = {
        let label = UILabel()
        label.text = "备注项"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    let Space:CGFloat = 15
    let topSpace:CGFloat = 5
    let bottomSpace:CGFloat = -5
    let maxWidth:CGFloat = 100
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.addSubview(seat)
        self.addSubview(cabinSeat)
        self.addSubview(name)
        self.addSubview(gender)
        self.addSubview(membershipLevel)
        self.addSubview(duty)
        self.addSubview(contactNumber)
        self.addSubview(takeFlightNum)
        self.addSubview(servicePreference)
        self.addSubview(hometown)
        self.addSubview(remark)
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0xEEE9E9)
        //约束
        self.seat.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10.0)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.cabinSeat.snp.width)
        }
        self.cabinSeat.snp.makeConstraints { (make) in
            make.left.equalTo(self.seat.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.name.snp.width)
        }
        self.name.snp.makeConstraints { (make) in
            make.left.equalTo(self.cabinSeat.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.gender.snp.width)
        }
        self.gender.snp.makeConstraints { (make) in
            make.left.equalTo(self.name.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.membershipLevel.snp.width)
        }
        self.membershipLevel.snp.makeConstraints { (make) in
            make.left.equalTo(self.gender.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
           make.width.equalTo(self.duty.snp.width)
        }
        self.duty.snp.makeConstraints { (make) in
            make.left.equalTo(self.membershipLevel.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
           make.width.equalTo(self.contactNumber.snp.width)
        }
        self.contactNumber.snp.makeConstraints { (make) in
            make.left.equalTo(self.duty.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(takeFlightNum.snp.width)
        }
        self.takeFlightNum.snp.makeConstraints { (make) in
            make.left.equalTo(contactNumber.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(servicePreference.snp.width)
        }
        self.servicePreference.snp.makeConstraints { (make) in
            make.left.equalTo(takeFlightNum.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.hometown.snp.width)
        }
        self.hometown.snp.makeConstraints { (make) in
            make.left.equalTo(self.servicePreference.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
        }
        self.remark.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-Space)
            make.left.equalTo(self.hometown.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.name.snp.width)
        }
//        self.seat.backgroundColor = UIColor.blue
//        self.cabinSeat.backgroundColor = UIColor.brown
//        self.name.backgroundColor = UIColor.brown
//        self.gender.backgroundColor = UIColor.brown
//        self.membershipLevel.backgroundColor = UIColor.brown
//        self.duty.backgroundColor = UIColor.brown
//        self.contactNumber.backgroundColor = UIColor.brown
//        self.takeFlightNum.backgroundColor = UIColor.brown
//        self.servicePreference.backgroundColor = UIColor.brown
//        self.hometown.backgroundColor = UIColor.brown
//        self.remark.backgroundColor = UIColor.brown
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
