//
//  SectionHeaderView.swift
//  ECabin
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//旅客信息的分区视图 "高端旅客","特殊旅客","中转旅客","所有旅客","过站旅客","升舱旅客"
class SectionHeaderView: UIView {
    //  箭头
    lazy var arrowImage:UIImageView = {
        let arrow = UIImageView()
        return arrow
    }()
    //  标题
    lazy var title:UILabel = {
        let label = UILabel()
        return label
    }()
    //  类似打印机的东东
    lazy var signImage:UIImageView = {
        let arrow = UIImageView()
        return arrow
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.backgroundColor = kRGBColorFromHex(rgbValue: 0x466EC0)
        self.addSubview(arrowImage)
        self.addSubview(title)
        self.addSubview(signImage)
        //
        self.arrowImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(5)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(10.0)
            make.height.equalTo(10.0)
        }
        self.arrowImage.image = UIImage.init(named: "airLine_arrowbt_close")
        self.title.snp.makeConstraints { (make) in
            make.left.equalTo(self.arrowImage.snp.right).offset(3)
            make.top.bottom.equalTo(self).offset(0)
            make.right.equalTo(self.signImage.snp.left).offset(5)
        }
        self.title.backgroundColor = UIColor.clear
        self.title.textColor = UIColor.gray
        self.signImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-5)
            make.width.equalTo(15.0)
            make.height.equalTo(15.0)
        }
        self.signImage.image = UIImage.init(named: "airLine_iconseat_normal")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
