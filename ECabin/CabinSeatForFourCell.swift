//
//  CabinSeatForFourCell.swift
//  ECabin
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit

class CabinSeatForFourCell: UITableViewCell {
    lazy var aSeatImg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "生日旅客")
        return img
    }()
    lazy var cSeatImg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "婴儿旅客")
        return img
    }()
    lazy var dSeatImg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "无陪儿童")
        return img
    }()
    lazy var fSeatImg:UIImageView = {
        let img = UIImageView()
        img.image = UIImage.init(named: "普通旅客")
        return img
    }()
    //  左标题
    lazy var leftRow:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "2"
        return label
    }()
    //右标题
    lazy var rightRow:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "2"
        return label
    }()
    lazy var aName:UILabel = {
        let label = UILabel()
        label.text = "科比"
        label.textAlignment = .center
        return label
    }()
    lazy var cName:UILabel = {
        let label = UILabel()
        label.text = "科比"
        label.textAlignment = .center
        return label
    }()
    lazy var dName:UILabel = {
        let label = UILabel()
        label.text = "科比"
        label.textAlignment = .center
        return label
    }()
    lazy var fName:UILabel = {
        let label = UILabel()
        label.text = "科比"
        label.textAlignment = .center
        return label
    }()
    
    let space:CGFloat = -80
    let bigSpace:CGFloat = -150
    let topSpace:CGFloat = 10
    let bottomSpace:CGFloat = -30
    let topSpaceOfLabel:CGFloat = 5
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(aSeatImg)
        self.contentView.addSubview(cSeatImg)
        self.contentView.addSubview(dSeatImg)
        self.contentView.addSubview(fSeatImg)
        self.contentView.addSubview(aName)
        self.contentView.addSubview(cName)
        self.contentView.addSubview(dName)
        self.contentView.addSubview(fName)
        self.contentView.addSubview(leftRow)
        self.contentView.addSubview(rightRow)
        initUI()
    }    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
        self.rightRow.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).offset(0)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(-space)
            make.height.equalTo(30)
        }
        self.aSeatImg.snp.makeConstraints { (make) in
            make.right.equalTo(self.rightRow.snp.left).offset(0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(bottomSpace)
            make.top.equalTo(self.contentView.snp.top).offset(topSpace)
            make.width.equalTo(self.cSeatImg.snp.width)
        }
        self.aName.snp.makeConstraints { (make) in
            make.right.equalTo(self.rightRow.snp.left).offset(0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.top.equalTo(self.aSeatImg.snp.bottom).offset(topSpaceOfLabel)
            make.width.equalTo(self.cName.snp.width)
        }
        self.cSeatImg.snp.makeConstraints { (make) in
            make.right.equalTo(self.aSeatImg.snp.left).offset(space)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(bottomSpace)
            make.top.equalTo(self.contentView.snp.top).offset(topSpace)
            make.width.equalTo(self.dSeatImg.snp.width)
        }
        self.cName.snp.makeConstraints { (make) in
            make.right.equalTo(self.aName.snp.left).offset(space)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.top.equalTo(self.cSeatImg.snp.bottom).offset(topSpaceOfLabel)
            make.width.equalTo(self.dName.snp.width)
        }
        self.dSeatImg.snp.makeConstraints { (make) in
            make.right.equalTo(self.cSeatImg.snp.left).offset(bigSpace)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(bottomSpace)
            make.top.equalTo(self.contentView.snp.top).offset(topSpace)
            make.width.equalTo(self.fSeatImg.snp.width)
        }
        self.dName.snp.makeConstraints { (make) in
            make.right.equalTo(self.cName.snp.left).offset(bigSpace)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.top.equalTo(self.dSeatImg.snp.bottom).offset(topSpaceOfLabel)
            make.width.equalTo(self.fName.snp.width)
        }
        self.fSeatImg.snp.makeConstraints { (make) in
            make.right.equalTo(self.dSeatImg.snp.left).offset(space)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(bottomSpace)
            make.top.equalTo(self.contentView.snp.top).offset(topSpace)
            make.width.equalTo(self.aSeatImg.snp.width)
        }
        self.fName.snp.makeConstraints { (make) in
            make.right.equalTo(self.dName.snp.left).offset(space)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            make.top.equalTo(self.fSeatImg.snp.bottom).offset(topSpaceOfLabel)
            make.left.equalTo(self.leftRow.snp.right).offset(0)
            make.width.equalTo(self.aName.snp.width)
        }
        self.leftRow.snp.makeConstraints { (make) in
            make.right.equalTo(self.fSeatImg.snp.left).offset(0)
            make.left.equalTo(self.contentView.snp.left).offset(0)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(-space)
            make.height.equalTo(30)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
