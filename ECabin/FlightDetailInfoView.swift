//
//  FlightDetailInfoView.swift
//  ECabin
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
//--------------->>>>>>>>展示旅客信息界面右下方信息：有升舱价格 日期 舱位  总人数 VIP CIP 白金卡 金卡 婴儿
class FlightDetailInfoView: UIView,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "favorit_bg")!)
        self.initUI()
    }
    func initUI(){
        self.tableView = UITableView()
        self.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self).offset(0.0)
        }
        tableView.register(CabinInfoCell.self, forCellReuseIdentifier: "CabinInfoCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        
        // header and  footer
        let headerView = DetailHeader.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 120))
        tableView.tableHeaderView = headerView
        let footerView = DetailFooter.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 130))
        tableView.tableFooterView = footerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CabinInfoCell", for: indexPath) as! CabinInfoCell
        cell.contentView.backgroundColor = kRGBColorFromHex(rgbValue: 0x466EC0)
        //////_____---------------封装一下该方法--------------
        if indexPath.row == 2{
            let string = "0/0"
            cell.cabinSeat.text = "Y"
            let attStr = NSMutableAttributedString.init(string: string)
            let str = NSString.init(string: string)
            let index = str.range(of: "/").location
            let lastIndex = (str as String).characters.count-index-1
            print(index)
            attStr.addAttribute(NSForegroundColorAttributeName, value: kRGBColorFromHex(rgbValue: 0xEEEE00), range: NSRange.init(location: 0, length: index))
            attStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange.init(location: index, length: lastIndex))
            cell.totalCount.attributedText = attStr
        }
        cell.contentView.alpha = 0.8
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
