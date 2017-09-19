//
//  PassengerSeatChartView.swift
//  ECabin
//
//  Created by apple on 2017/9/10.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
// ----------------------旅客座位图
class PassengerSeatChartView: UIView,UITableViewDelegate,UITableViewDataSource {

    lazy var table_View:UITableView = {
        let table = UITableView()
        table.register(CabinSeatForSixCell.self, forCellReuseIdentifier: "CabinSeatForSixCell")
        table.register(CabinSeatForFourCell.self, forCellReuseIdentifier: "CabinSeatForFourCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    func initUI(){
        self.addSubview(table_View)
        self.table_View.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self).offset(0)
        }
    }
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 4
        }else{
            return 7
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0{
            let cell_six = tableView.dequeueReusableCell(withIdentifier: "CabinSeatForSixCell", for: indexPath) as! CabinSeatForSixCell
            cell_six.selectionStyle = .none
            //添加手势
            let tap_a = UITapGestureRecognizer.init(target: self, action: #selector(tapOfClick(_:)))
            cell_six.aSeatImg.addGestureRecognizer(tap_a)
            cell_six.aSeatImg.tag = 10000+indexPath.row*10+indexPath.row
            cell_six.aSeatImg.isUserInteractionEnabled = true
            return cell_six
        }else{
            let cell_four = tableView.dequeueReusableCell(withIdentifier: "CabinSeatForFourCell", for: indexPath) as! CabinSeatForFourCell
            cell_four.selectionStyle = .none
            return cell_four
        } 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view_six = CabinSeatForSix()
        let view_four = CabinSeatForFour()
        if section == 0{
            view_six.backgroundColor = UIColor.blue
            return view_six
        }else{
            view_four.backgroundColor = UIColor.orange
            return view_four
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tapOfClick(_ tap:UITapGestureRecognizer){
        let view = tap.view as! UIImageView
        print(view.tag)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
