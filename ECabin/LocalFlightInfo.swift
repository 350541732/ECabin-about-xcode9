//
//  LocalFlightInfo.swift
//  ECabin
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit

class LocalFlightInfo: UIView,UITableViewDelegate,UITableViewDataSource {
    
    weak var delegate:PassengerInfoViewController?
    var tableView:UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.tableView = UITableView.init()
        self.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self).offset(0.0)
        }
        self.tableView.register(UINib.init(nibName: "FlightInfoCell", bundle: nil), forCellReuseIdentifier: "FlightInfoCell")
        let view = HeaderView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 50))
        view.searchBtn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        self.tableView.tableHeaderView = view
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell_flightInfo = tableView.dequeueReusableCell(withIdentifier: "FlightInfoCell", for: indexPath) as! FlightInfoCell
        return cell_flightInfo
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{            
        }else{
            print("QQQQ")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 40.0
    }
    func btnClick(_ sender:UIButton){
        //发送一个通知
        let notificationName = Notification.Name(rawValue: "switchToSearch")
        NotificationCenter.default.post(name: notificationName, object: self)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
