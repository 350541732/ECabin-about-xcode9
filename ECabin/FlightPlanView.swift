//
//  FlightPlanView.swift
//  ECabin
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
/*
 航班计划表中的 航班号 航班日期 计飞 计达 状态 前序航班
 */
class FlightPlanView: UIView {

    lazy var flightNo:UILabel = {
        let label = UILabel()
        label.text = "航班号"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var flightDate:UILabel = {
        let label = UILabel()
        label.text = "航班日期"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var takeoffPlan:UILabel = {
        let label = UILabel()
        label.text = "计划起飞时间"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var arrivePlan:UILabel = {
        let label = UILabel()
        label.text = "计划到达时间"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var status:UILabel = {
        let label = UILabel()
        label.text = "状态"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    lazy var previousFlight:UILabel = {
        let label = UILabel()
        label.text = "前序航班"
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    let topSpace:CGFloat = 5
    let bottomSpace:CGFloat = -5
    let leftSpace:CGFloat = 10
    let rightSpace:CGFloat = -10
    let space:CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(flightNo)
        self.addSubview(flightDate)
        self.addSubview(takeoffPlan)
        self.addSubview(arrivePlan)
        self.addSubview(status)
        self.addSubview(previousFlight)
        
        self.flightNo.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.flightDate)
        }
        self.flightDate.snp.makeConstraints { (make) in
            make.left.equalTo(self.flightNo.snp.right).offset(space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.takeoffPlan.snp.width)
        }
        self.takeoffPlan.snp.makeConstraints { (make) in
            make.left.equalTo(self.flightDate.snp.right).offset(space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.arrivePlan.snp.width)
        }
        self.arrivePlan.snp.makeConstraints { (make) in
            make.left.equalTo(self.takeoffPlan.snp.right).offset(space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.status.snp.width)
        }
        self.status.snp.makeConstraints { (make) in
            make.left.equalTo(arrivePlan.snp.right).offset(space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.previousFlight.snp.width)
        }
        self.previousFlight.snp.makeConstraints { (make) in
            make.left.equalTo(self.status.snp.right).offset(space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.right.equalTo(self.snp.right).offset(rightSpace)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
