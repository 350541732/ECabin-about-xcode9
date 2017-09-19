//
//  FlightInfoCell.swift
//  ECabin
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit

class FlightInfoCell: UITableViewCell {

    var dateLabel:UILabel! // 航班日期
    var flightLabel:UILabel! // 航班号
    var flightCode4:UILabel! // 航班起降城市
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.dateLabel = UILabel.init()
        self.contentView.addSubview(dateLabel)
        self.flightLabel = UILabel.init()
        self.contentView.addSubview(flightLabel)
        self.flightCode4 = UILabel.init()
        self.contentView.addSubview(flightCode4)
        self.dateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(5.0)
            make.top.equalTo(self.contentView.snp.top).offset(5.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5.0)
            make.width.equalTo(100.0)
        }
        self.flightLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.dateLabel.snp.left).offset(10.0)
            make.top.equalTo(self.contentView.snp.top).offset(5.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5.0)
            make.width.equalTo(100.0)
        }
        self.flightCode4.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView.snp.right).offset(-5.0)
            make.top.equalTo(self.contentView.snp.top).offset(5.0)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-5.0)
            make.width.equalTo(100)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
