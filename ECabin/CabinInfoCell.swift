//
//  CabinInfoCell.swift
//  ECabin
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit

class CabinInfoCell: UITableViewCell {

    var cabinSeat:UILabel! // 舱位
    var totalCount:UILabel! // 总人数
    var Vip:UILabel! // VIP
    var Cip:UILabel! // CIP
    var PlatinumCard:UILabel! //白金卡
    var goldCard:UILabel! // 金卡
    var baby:UILabel! //婴儿
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = kRGBColorFromHex(rgbValue: 0x1874CD)

    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
        self.cabinSeat = UILabel()
        self.contentView.addSubview(cabinSeat)
        self.totalCount = UILabel()
        self.contentView.addSubview(totalCount)
        self.Vip = UILabel()
        self.contentView.addSubview(Vip)
        self.Cip = UILabel()
        self.contentView.addSubview(Cip)
        self.PlatinumCard = UILabel()
        self.contentView.addSubview(PlatinumCard)
        self.goldCard = UILabel()
        self.contentView.addSubview(goldCard)
        self.baby = UILabel()
        self.contentView.addSubview(baby)
        self.cabinSeat.text = "舱位"
        self.cabinSeat.textColor = UIColor.white
        self.cabinSeat.font = UIFont.systemFont(ofSize: 13)
        self.totalCount.text = "总人数"
        self.totalCount.textColor = UIColor.white
        self.totalCount.font = UIFont.systemFont(ofSize: 13)
        self.Vip.text = "VIP"
        self.Vip.textColor = UIColor.white
        self.Vip.font = UIFont.systemFont(ofSize: 13)
        self.Cip.text = "CIP"
        self.Cip.textColor = UIColor.white
        self.Cip.font = UIFont.systemFont(ofSize: 13)
        self.PlatinumCard.text = "白金卡"
        self.PlatinumCard.textColor = UIColor.white
        self.PlatinumCard.font = UIFont.systemFont(ofSize: 13)
        self.goldCard.text = "金卡"
        self.goldCard.textColor = UIColor.white
        self.goldCard.font = UIFont.systemFont(ofSize: 13)
        self.baby.text = "婴儿"
        self.baby.textColor = UIColor.white
        self.baby.font = UIFont.systemFont(ofSize: 13)

        //约束
        self.cabinSeat.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.totalCount.snp.width)
        }
        self.totalCount.snp.makeConstraints { (make) in
            make.left.equalTo(self.cabinSeat.snp.right).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.Vip.snp.width)
        }
        self.Vip.snp.makeConstraints { (make) in
            make.left.equalTo(self.totalCount.snp.right).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.Cip.snp.width)
        }
        self.Cip.snp.makeConstraints { (make) in
            make.left.equalTo(self.Vip.snp.right).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.PlatinumCard.snp.width)
        }
        self.PlatinumCard.snp.makeConstraints { (make) in
            make.left.equalTo(self.Cip.snp.right).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.goldCard.snp.width)
        }
        self.goldCard.snp.makeConstraints { (make) in
            make.left.equalTo(self.PlatinumCard.snp.right).offset(20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
            make.width.equalTo(self.baby.snp.width)
        }
        self.baby.snp.makeConstraints { (make) in
            make.left.equalTo(self.goldCard.snp.right).offset(20.0)
            make.right.equalTo(self.contentView.snp.right).offset(-20.0)
            make.top.equalTo(self.contentView.snp.top).offset(10.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10.0)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
