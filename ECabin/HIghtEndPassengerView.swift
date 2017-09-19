//
//  HIghtEndPassengerView.swift
//  ECabin
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//包括两部分（HighEndHeader + HighEndPassengerCell ）   座位 舱位 姓名 性别 会员级别 职务 联系电话 乘机次数 服务喜好 家乡 备注项 + tableview
class HIghtEndPassengerView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(HighEndPassengerCell.self, forCellReuseIdentifier: "HighEndPassengerCell")
        return table
    }()
    lazy var highEndHeader:HighEndHeader = {
        let header = HighEndHeader()
        return header
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    func initUI(){
        self.addSubview(highEndHeader)
        self.addSubview(tableView)
        self.highEndHeader.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self).offset(0)
            make.height.equalTo(40)
        }
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self).offset(0)
            make.top.equalTo(self.highEndHeader.snp.bottom).offset(0)
        }
    }
    //Delegate  Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighEndPassengerCell", for: indexPath) as! HighEndPassengerCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
