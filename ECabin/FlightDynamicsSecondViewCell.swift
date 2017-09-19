//
//  FlightDynamicsSecondViewCell.swift
//  ECabin
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
/*
 航班动态次级页面自定义cell
 */
class FlightDynamicsSecondViewCell: UITableViewCell {
    lazy var flightNo:UILabel = {
        let label = UILabel()
        label.text = "QW9844"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    lazy var flightDate:UILabel = {
        let label = UILabel()
        label.text = "2017.09.08"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    lazy var takeoffPlan:UILabel = {
        let label = UILabel()
        label.text = "15:45"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    lazy var arrivePlan:UILabel = {
        let label = UILabel()
        label.text = "18:00"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    lazy var status:UILabel = {
        let label = UILabel()
        label.text = "计划"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    lazy var previousFlight:UILabel = {
        let label = UILabel()
        label.text = "QW9853"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    let topSpace:CGFloat = 5
    let bottomSpace:CGFloat = -5
    let leftSpace:CGFloat = 10
    let rightSpace:CGFloat = -10
    let space:CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    func initUI(){
        self.contentView.addSubview(flightNo)
        self.contentView.addSubview(flightDate)
        self.contentView.addSubview(takeoffPlan)
        self.contentView.addSubview(arrivePlan)
        self.contentView.addSubview(status)
        self.contentView.addSubview(previousFlight)
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
