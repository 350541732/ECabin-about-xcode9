//
//  FlightDynamicsSecondView.swift
//  ECabin
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//航班动态次级页面
/*
 包括展示所查询的航班计划(tableview)以及天气状况两部分
 */
class FlightDynamicsSecondView: UIView,UITableViewDataSource,UITableViewDelegate {

    lazy var titleView:FlightPlanView = {
        let view = FlightPlanView()
        return view
    }()
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(FlightDynamicsSecondViewCell.self, forCellReuseIdentifier: "FlightDynamicsSecondViewCell")
        table.separatorStyle = .none
        table.backgroundColor = UIColor.clear
        return table
    }()
    weak var delegate:PassengerInfoViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.addSubview(titleView)
        self.addSubview(tableView)
        self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "flightLine_rightBG")!)
        self.titleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(180)
            make.width.equalTo(530)
            make.height.equalTo(30)
        }
        self.tableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.titleView.snp.bottom).offset(10)
            make.width.equalTo(530)
            make.height.equalTo(130)
        }
        
    }
    //Datasource  Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightDynamicsSecondViewCell", for: indexPath) as! FlightDynamicsSecondViewCell
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
