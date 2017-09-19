//
//  FlightDynamicsView.swift
//  ECabin
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//航班动态主页面  // 按航班号 按起落地 搜索等
class FlightDynamicsView: UIView,UIPopoverPresentationControllerDelegate,UITableViewDataSource,UITableViewDelegate {
    //标题
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "航班动态"
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    //按航班号按钮
    lazy var flightNoBtn:UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: "flightLine_leftbt_select"), for: .normal)
        return btn
    }()
    //起降地按钮
    lazy var landingBtn:UIButton = {
       let btn = UIButton()
       btn.setBackgroundImage(UIImage.init(named: "flightLine_rightbt_normal"), for: .normal)
       return btn
    }()
    // 日期按钮
    lazy var dateBtn:UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: "flightLine_datebox"), for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        return btn
    }()
    //前缀标签
    lazy var prefixLabel:UILabel = {
        let label = UILabel()
        label.text = "QW"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    //航班号
    lazy var flghtNo:UITextField = {
        let text = UITextField()
        let leftView = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: 20, height: 20))
        leftView.backgroundColor = UIColor.clear
        text.background = UIImage.init(named: "flightLine_searchInput_normal")
        text.placeholder = "  请输入航班号"
        text.leftView = leftView
        text.leftViewMode = .always
        text.contentVerticalAlignment = .center
        return text
    }()
    //起飞机场
    lazy var takeOffField:UITextField = {
        let text = UITextField()
        text.placeholder = "深圳"
        text.textAlignment = .center
        text.background = UIImage.init(named: "flightLine_input")
        text.isHidden = true
        return text
    }()
    //降落机场
    lazy var landingField:UITextField = {
        let text = UITextField()
        text.placeholder = "北京"
        text.textAlignment = .center
        text.background = UIImage.init(named: "flightLine_input")
        text.isHidden = true
        return text
    }()
    //搜索按钮
    lazy var searchBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "flightLine_search_up"), for: .normal)
        return btn
    }()
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "测试")
        table.backgroundColor = UIColor.clear
        //
        return table
    }()

    let leftSpace:CGFloat = 20
    let topSpace:CGFloat = 10
    let height:CGFloat = 35
    // 默认 按航班号 按钮的选中状态
    var fligtNoFlag:Bool = true
    var displayDateVC:DisplayDateController?
    weak var delegate:PassengerInfoViewController?
    let notificationName = Notification.Name.init(rawValue: "dateChanged")
    
    var flightDynamicSecondView:FlightDynamicsSecondView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        //添加观察者
        NotificationCenter.default.addObserver(self, selector: #selector(dateChanged), name: notificationName, object: nil)
    }
    func initUI(){
        self.addSubview(titleLabel)
        self.addSubview(flightNoBtn)
        self.addSubview(landingBtn)
        self.addSubview(dateBtn)
        self.addSubview(prefixLabel)
        self.addSubview(flghtNo)
        self.addSubview(searchBtn)
        self.addSubview(tableView)
        self.addSubview(takeOffField)
        self.addSubview(landingField)

        //约束
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.right.equalTo(self.snp.right).offset(0)
            make.height.equalTo(height)
        }
        self.flightNoBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
            make.width.equalTo(landingBtn)
        }
        self.landingBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-leftSpace)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
            make.left.equalTo(self.flightNoBtn.snp.right).offset(0)
            make.width.equalTo(self.landingBtn)
        }
        self.dateBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.right.equalTo(self.snp.right).offset(-leftSpace)
            make.top.equalTo(self.flightNoBtn.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
        }
        self.prefixLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.top.equalTo(self.dateBtn.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
            make.width.lessThanOrEqualTo(40.0)
        }
        self.flghtNo.snp.makeConstraints { (make) in
            make.left.equalTo(self.prefixLabel.snp.right).offset(2)
            make.top.equalTo(self.dateBtn.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
            make.right.equalTo(self.snp.right).offset(-leftSpace)
        }
        self.takeOffField.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.top.equalTo(self.dateBtn.snp.bottom).offset(topSpace)
            make.width.equalTo(self.landingField)
            make.height.equalTo(height)
        }
        self.landingField.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-leftSpace)
            make.left.equalTo(self.takeOffField.snp.right).offset(leftSpace)
            make.height.equalTo(height)
            make.top.equalTo(self.dateBtn.snp.bottom).offset(topSpace)
        }
        self.searchBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-leftSpace)
            make.top.equalTo(self.flghtNo.snp.bottom).offset(topSpace)
            make.height.equalTo(height)
            make.width.equalTo(50)
        }
        //
        self.tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(leftSpace)
            make.right.equalTo(self.snp.right).offset(-leftSpace)
            make.top.equalTo(self.searchBtn.snp.bottom).offset(40)
            make.bottom.equalTo(self.snp.bottom).offset(0)
        }
        
        self.dateBtn.setTitle(getTodayDate(), for: .normal)
        self.flightNoBtn.addTarget(self, action: #selector(flightNoClick(_ :)), for: .touchUpInside)
        self.landingBtn.addTarget(self, action: #selector(landClick(_ :)), for: .touchUpInside)
        self.dateBtn.addTarget(self, action: #selector(dateClick(_ :)), for: .touchUpInside)
        self.searchBtn.addTarget(self, action: #selector(searchClick(_ :)), for: .touchUpInside)
    }
    //获取当天日期(String)
    func getTodayDate()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = NSTimeZone(name: "Asia/Shanghai") as TimeZone!
        //东八区时间
        let dateStr: String = formatter.string(from: date)
        return dateStr
    }
    //点击 按航班号查询
    func flightNoClick(_ sender:UIButton){
        self.flightNoBtn.setImage(UIImage.init(named: "flightLine_leftbt_select"), for: .normal)
        self.landingBtn.setImage(UIImage.init(named: "flightLine_rightbt_normal"), for: .normal)
        self.fligtNoFlag = true
        self.takeOffField.isHidden = true
        self.landingField.isHidden = true
        self.prefixLabel.isHidden = false
        self.flghtNo.isHidden = false
    }
    // 点击 按起降地
    func landClick(_ sender:UIButton){
        self.flightNoBtn.setImage(UIImage.init(named: "flightLine_leftbt_normal"), for: .normal)
        self.landingBtn.setImage(UIImage.init(named: "flightLine_rightbt_select"), for: .normal)
        self.fligtNoFlag = false
        self.takeOffField.isHidden = false
        self.landingField.isHidden = false
        self.prefixLabel.isHidden = true
        self.flghtNo.isHidden = true
    }
    // 日期按钮点击
    func dateClick(_ sender:UIButton){
        displayDateVC = DisplayDateController()
        displayDateVC?.modalPresentationStyle = .popover
        displayDateVC?.preferredContentSize = CGSize.init(width: 300, height: 250)
        displayDateVC?.popoverPresentationController?.delegate = self
        displayDateVC?.popoverPresentationController?.sourceView = sender
        displayDateVC?.popoverPresentationController?.sourceRect = sender.bounds
        displayDateVC?.popoverPresentationController?.permittedArrowDirections = .left
        displayDateVC?.popoverPresentationController?.backgroundColor = kRGBColorFromHex(rgbValue: 0x2B2B2B)
        self.delegate?.present(displayDateVC!, animated: true, completion: nil)
    }
    //s搜索按钮点击
    func searchClick(_ sender:UIButton){
        self.flightDynamicSecondView = FlightDynamicsSecondView()
        self.delegate?.view.addSubview(flightDynamicSecondView!)
        self.flightDynamicSecondView?.snp.makeConstraints({ (make) in
            make.left.equalTo((self.delegate?.view.snp.left)!).offset(340)
            make.right.equalTo((self.delegate?.view.snp.right)!).offset(-30)
            make.top.equalTo((self.delegate?.view.snp.top)!).offset(40)
            make.bottom.equalTo((self.delegate?.view.snp.bottom)!).offset(-20)
        })
        self.flightDynamicSecondView?.delegate = self.delegate
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    ///************************---------接收到通知——————————————————
    func dateChanged(noti:Notification){
        if let title =  noti.userInfo?["date"]{
            DispatchQueue.main.async {
                self.dateBtn.setTitle(title as? String, for: .normal)
            }
            print(title)
        }
    }
    //  Delegate  DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "测试", for: indexPath) 
        cell.textLabel?.text = "测试"
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)行已被点击   请报警~~~~~~~")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
