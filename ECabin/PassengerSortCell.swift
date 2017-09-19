//
//  PassengerSortCell.swift
//  ECabin
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
// 旅客详细分类信息  例如头等舱VIPCIP等等 cell
class PassengerSortCell: UITableViewCell {

    lazy var title:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
        self.contentView.addSubview(title)
        self.title.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(20.0)
            make.top.bottom.right.equalTo(self).offset(0)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
