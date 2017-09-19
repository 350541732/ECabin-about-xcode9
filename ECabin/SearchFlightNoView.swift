//
//  SearchFlightNoView.swift
//  ECabin
//
//  Created by apple on 2017/8/11.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
//根据航班号查询的view
class SearchFlightNoView: UIView {
    var dockView:UIView!// 菜单 放置 搜索textfield 搜索按钮 本地航班按钮
    var datePickerView:UIView! //日期选择器
    var showLeg:UIView! // 展示航段
    weak var delegate:PassengerInfoViewController?
    lazy var flightLabel:UILabel = { // 展示航班号
       let label = UILabel.init()
        return label
    }()
    lazy var searchText:UITextField = { //搜索输入框
       let text = UITextField.init()
       return text
    }()
    lazy var searchBtn:UIButton = {// 按钮
       let btn = UIButton.init()
       return btn
    }()
    lazy var localBtn:UIButton = { // 本地航班按钮
        let btn = UIButton.init()
        return btn
    }()
    lazy var datePicker:UIDatePicker = {
       let date = UIDatePicker.init()
       return date
    }()
    lazy var legView:UIView = { // 飞行航段父视图
       let leg = UIView.init()
       return leg
    }()
    lazy var legImage:UIImageView = { //请选择飞行航段的imageview
       let image = UIImageView.init()
       return image
    }()
    lazy var legLabel_1:UILabel = { // 展示航段1
        let label = UILabel.init()
        return label
    }()
    lazy var legLabel_2:UILabel = { // 展示航段2
        let label = UILabel.init()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        self.dockView = UIView.init()
        self.addSubview(self.dockView)
        self.datePickerView = UIView.init()
        self.addSubview(self.datePickerView)
        self.showLeg = UIView.init()
        self.addSubview(self.showLeg)
        // 
        self.dockView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(0.0)
            make.right.equalTo(self).offset(0.0)
            make.top.equalTo(self).offset(0.0)
            make.height.equalTo(50.0)
        }
        //PART-1
        self.dockView.backgroundColor = UIColor.white
        self.dockView.addSubview(flightLabel)
        self.dockView.addSubview(self.searchText)
        self.dockView.addSubview(self.searchBtn)
        self.dockView.addSubview(self.localBtn)
        self.flightLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.dockView.snp.left).offset(10.0)
            make.bottom.equalTo(self.dockView.snp.bottom).offset(-5.0)
            make.width.equalTo(110.0)
            make.top.equalTo(self.dockView.snp.top).offset(10.0)
        }
        self.flightLabel.text = "航班号: QW"
        self.flightLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        self.searchText.snp.makeConstraints { (make) in
            make.left.equalTo(self.flightLabel.snp.right).offset(5.0)
            make.top.equalTo(self.dockView.snp.top).offset(10.0)
            make.width.equalTo(200)
            make.bottom.equalTo(self.dockView.snp.bottom).offset(-5.0)
        }
        self.searchText.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "ordercellofcw_bg"))!)
        self.searchText.clipsToBounds = true
        self.searchText.layer.cornerRadius = 8
        self.searchBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.searchText.snp.right).offset(15.0)
            make.top.equalTo(self.dockView.snp.top).offset(10.0)
            make.bottom.equalTo(self.dockView.snp.bottom).offset(-5.0)
            make.width.equalTo(60.0)
        }
        self.searchBtn.setImage(UIImage.init(named: "setting_searchbt_up"), for: .normal)
        
        self.localBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.searchBtn.snp.right).offset(10.0)
            make.top.equalTo(self.dockView.snp.top).offset(10.0)
            make.bottom.equalTo(self.dockView.snp.bottom).offset(-5.0)
            make.width.equalTo(self.searchBtn.snp.width)
        }
        
        self.localBtn.setImage(UIImage.init(named: "setting_flightbt_up"), for: .normal)
        //PART -2
        self.datePickerView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(0.0)
            make.right.equalTo(self.snp.right).offset(0.0)
            make.top.equalTo(self.dockView.snp.bottom).offset(0.0)
            make.bottom.equalTo(self.showLeg.snp.top).offset(0.0)
        }
        self.datePickerView.backgroundColor = UIColor.gray
        self.datePickerView.addSubview(self.datePicker)
        
        self.datePicker.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.datePickerView.snp.centerX)
            make.width.equalTo(300.0)
            make.top.equalTo(self.datePickerView.snp.top).offset(5.0)
            make.bottom.equalTo(self.datePickerView.snp.bottom).offset(-5)
        }
        datePicker.backgroundColor = UIColor.white
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        //PART-3
        self.showLeg.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(0.0)
            make.right.equalTo(self).offset(0.0)
            make.top.equalTo(self.datePickerView.snp.bottom).offset(0.0)
            make.bottom.equalTo(self.snp.bottom).offset(0.0)
        }
        self.showLeg.backgroundColor = UIColor.white
        
        self.showLeg.addSubview(self.legImage)
        self.legImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.showLeg.snp.top).offset(2.0)
            make.centerX.equalTo(self.showLeg.snp.centerX)
            make.width.equalTo(130.0)
            make.height.equalTo(20.0)
        }
        self.legImage.image = UIImage.init(named: "showMuliSegTitle")
        
        self.showLeg.addSubview(self.legLabel_1)
        self.showLeg.addSubview(self.legLabel_2)
        self.legLabel_1.snp.makeConstraints { (make) in
            make.left.equalTo(self.showLeg.snp.left).offset(20.0)
            make.top.equalTo(self.legImage.snp.bottom).offset(2.0)
            make.bottom.equalTo(self.showLeg.snp.bottom).offset(-10.0)
            make.width.equalTo(100.0)
        }
        self.legLabel_1.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "setting_button_up")!)
        self.legLabel_1.text = "北京-华盛顿"
        self.legLabel_1.textColor = UIColor.white
        self.legLabel_2.snp.makeConstraints { (make) in
            make.left.equalTo(self.legLabel_1.snp.right).offset(30.0)
            make.top.equalTo(self.legImage.snp.bottom).offset(2.0)
            make.bottom.equalTo(self.showLeg.snp.bottom).offset(-10.0)
            make.width.equalTo(100.0)
        }
        self.legLabel_2.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "setting_button_up")!)
        self.legLabel_2.text = "华盛顿-莫斯科"
        self.legLabel_2.textColor = UIColor.white
    }
    func dateChanged(datePicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
//        print(formatter.string(from: datePicker.date))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
