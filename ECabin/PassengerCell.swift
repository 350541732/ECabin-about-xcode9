//
//  PassengerCell.swift
//  ECabin
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit

//  ------旅客信息的cell
class PassengerCell: UITableViewCell {

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
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
        self.contentView.backgroundColor = kRGBColorFromHex(rgbValue: 0x466EC0)
        self.contentView.addSubview(arrowImage)
        self.contentView.addSubview(title)
        self.contentView.addSubview(signImage)
        //
        self.arrowImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(5)
            make.centerY.equalTo(self.contentView.snp.centerY)
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
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.right.equalTo(self.contentView.snp.right).offset(-5)
            make.width.equalTo(15.0)
            make.height.equalTo(15.0)
        }
        self.signImage.image = UIImage.init(named: "airLine_iconseat_normal")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
