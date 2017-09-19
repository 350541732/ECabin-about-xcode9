//
//  PassengerVotageViewController.swift
//  ECabin
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//点击旅客航程出现的Pop
class PassengerVotageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    lazy var tableView:UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        return table
    }()
    lazy var dataSource:NSMutableArray = {
        let array:NSMutableArray = ["全部","晋江-青岛","晋江-哈尔滨"]
        return array
    }()
    let notificationName = Notification.Name.init(rawValue: "selecteVogate")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(10)
            make.top.equalTo(self.view.snp.top).offset(10)
            make.right.equalTo(self.view.snp.right).offset(-10)
            make.bottom.equalTo(self.view.snp.bottom).offset(-10)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath) 
        cell.textLabel?.text = self.dataSource[indexPath.row]as?String
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  发送通知         
        NotificationCenter.default.post(name:notificationName , object: self, userInfo: ["model":self.dataSource[indexPath.row]])
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

}
