//
//  HighEndPassengerCell.swift
//  ECabin
//
//  Created by apple on 2017/9/6.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//*************高端旅客Cell 点击高端旅客或者下拉菜单中的cell之后 在右面出现的cell
class HighEndPassengerCell: UITableViewCell {
    //----------座位-----------
    lazy var seat:UILabel = {
        let label = UILabel()
        label.text = "9A"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //----------舱位-----------
    lazy var cabinSeat:UILabel = {
        let label = UILabel()
        label.text = "Y/R"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //----------姓名-----------
    lazy var name:UILabel = {
        let label = UILabel()
        label.text = "司马贼"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //----------性别-----------
    lazy var gender:UILabel = {
        let label = UILabel()
        label.text = "男"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //----------会员级别-----------
    lazy var membershipLevel:UILabel = {
        let label = UILabel()
        label.text = "钻石卡"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //---------职务-----------
    lazy var duty:UILabel = {
        let label = UILabel()
        label.text = "米国领导"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //--------联系电话----------
    lazy var contactNumber:UILabel = {
        let label = UILabel()
        label.text = "182****2121"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //-----------乘机次数----------
    lazy var takeFlightNum:UILabel = {
        let label = UILabel()
        label.text = "7"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //-----------服务喜好----------
    lazy var servicePreference:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //-----------家乡----------
    lazy var hometown:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    //-----------备注项----------
    lazy var remark:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    let Space:CGFloat = 22
    let topSpace:CGFloat = 5
    let bottomSpace:CGFloat = -5
    let maxWidth:CGFloat = 55
   //   HighEndHeader中touchBegan方法计算两个字的width为27；四个字为53.5 三个字为40.0
    let minWidthForTwo:CGFloat = 27.0
    let minWidthForThree:CGFloat = 40.0
    let minWidthForFour:CGFloat = 53.5
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    func initUI(){
        self.contentView.addSubview(seat)
        self.contentView.addSubview(cabinSeat)
        self.contentView.addSubview(name)
        self.contentView.addSubview(gender)
        self.contentView.addSubview(membershipLevel)
        self.contentView.addSubview(duty)
        self.contentView.addSubview(contactNumber)
        self.contentView.addSubview(takeFlightNum)
        self.contentView.addSubview(servicePreference)
        self.contentView.addSubview(hometown)
        self.contentView.addSubview(remark)
        
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
            make.width.equalTo(self.name.snp.width)
        }
        self.contactNumber.snp.makeConstraints { (make) in
            make.left.equalTo(self.duty.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(name.snp.width).multipliedBy(1.2)
        }
        self.takeFlightNum.snp.makeConstraints { (make) in
            make.left.equalTo(contactNumber.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(servicePreference.snp.width).multipliedBy(0.8)
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
            make.width.equalTo(self.remark.snp.width)
        }
        self.remark.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-Space)
            make.left.equalTo(self.hometown.snp.right).offset(Space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.name.snp.width)
        }
     
  
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
