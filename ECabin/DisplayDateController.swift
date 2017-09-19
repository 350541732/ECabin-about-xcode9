//
//  DisplayDateController.swift
//  ECabin
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
// 点击日期按钮 出现的pop
class DisplayDateController: UIViewController {
    
    lazy var datePicker:UIDatePicker = {
        let date = UIDatePicker.init()
        return date
    }()
    let notificationName = Notification.Name.init(rawValue: "dateChanged")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(datePicker)
        self.view.backgroundColor = kRGBColorFromHex(rgbValue: 0x2B2B2B)
        self.datePicker.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(30.0)
            make.right.equalTo(self.view.snp.right).offset(-30.0)
            make.top.equalTo(self.view.snp.top).offset(10.0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-10.0)
        }
        datePicker.backgroundColor = UIColor.white
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    func dateChanged(datePicker:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        //        print(formatter.string(from: datePicker.date))
        //  发送通知——————_____————————
        NotificationCenter.default.post(name:notificationName , object: self, userInfo: ["date":formatter.string(from: datePicker.date)])
       // self.dismiss(animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
