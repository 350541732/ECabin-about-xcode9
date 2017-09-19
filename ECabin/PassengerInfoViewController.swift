//
//  PassengerInfoViewController.swift
//  ECabin
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class PassengerInfoViewController: UIViewController {

    let btnImage = ["airLine_passengeinfo_normal","airLine_refresh_normal","airLine_upload_normal","airLine_flight_normal","airLine_switch_normal","airLine_changeflight_normal"] // 左侧按钮
    let setImage = ["airLine_set_normal"] //设置按钮
    let networkStateImage = ["airLine_onlinebg1","airLine_onlinebg2"] // 在线 / 本地
    let searchImage = ["flightLine_searchInput_normal"] // 搜索🔍
    let notificationName_switch = Notification.Name(rawValue: "switchToSearch") // 本地转搜索
    let notificationName_hide = Notification.Name.init("hideSliderMenu") // 隐藏侧边栏
    // 定时器
    weak var timer:Timer?
    lazy var searchFlightNoView:SearchFlightNoView = { //搜索航班视图
        let view = SearchFlightNoView()
        return view
    }()
    lazy var localFlightView:LocalFlightInfo = { //本地航班视图
       let view = LocalFlightInfo()
       return view
    }()
    lazy var clearView:UIView = { //承载 搜索航班视图 本地航班视图 的 父视图
        let view_1 = UIView()
        return view_1
    }()
    var flightDetailInfo:FlightDetailInfoView! // 航班详细信息图
    
    lazy var ecabinFuncView:EcabinFunctionTableView = { // 移动客舱系统功能表  侧栏
       let view = EcabinFunctionTableView()
       return view
    }()
    var ecabinFuncViewFlag:Bool = false // 判断移动客舱系统功能表是否在页面上的标志位
    
    lazy var passengerSort:PassengerofSort = {
        let view = PassengerofSort()
        return view
    }()
    //数据源
    lazy var dataSource:NSMutableArray = {
        let array = NSMutableArray()
        return array
    }()
    //航班动态
    lazy var flghtDynamic:FlightDynamicsView = {
         let view = FlightDynamicsView()
         return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "mainbg")?.withRenderingMode(.alwaysOriginal))!)
        //是否联网
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(networkState), userInfo: nil, repeats: true)
        NotificationCenter.default.addObserver(self, selector: #selector(switchToSearch), name: notificationName_switch, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideSliderMenu), name: notificationName_hide, object: nil)
        self.initUI()
    }
    func initUI(){
        //--------------------左侧6个按钮  tag  100-105
        for i in 0...btnImage.count-1{
            let btn = UIButton.init()
            self.view.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(5)
                make.width.equalTo(60)
                make.height.equalTo(60)
                make.top.equalTo(self.view.snp.top).offset(200+i*60)
            })
           btn.tag = 100+i
           btn.setImage(UIImage.init(named: btnImage[i]), for: .normal)
           btn.addTarget(self, action: #selector(menuBtnClick(_ :)), for: .touchUpInside)
        }
        for j in 0...setImage.count-1{
            let btn = UIButton.init()
            self.view.addSubview(btn)
            btn.snp.makeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(5)
                make.width.equalTo(60)
                make.height.equalTo(60)
                make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            })
            btn.tag = 150+j
            btn.setImage(UIImage.init(named: setImage[j]), for: .normal)
            btn.addTarget(self, action: #selector(setBtnClick(_ :)), for: .touchUpInside)
        }
        
        //在线/本地 图
        let onorOffLineImageView = UIImageView.init()
        self.view.addSubview(onorOffLineImageView)
        onorOffLineImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(210.0)
            make.top.equalTo(self.view.snp.top).offset(50.0)
            make.width.equalTo(20)
            make.height.equalTo(10.0)
        }
        onorOffLineImageView.image = UIImage.init(named: networkStateImage[0])
        onorOffLineImageView.tag = 200
        //在线/本地 字
        let onorOffLineLabel = UILabel.init()
        self.view.addSubview(onorOffLineLabel)
        onorOffLineLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(240)
            make.top.equalTo(self.view.snp.top).offset(47.0)
            make.width.equalTo(30)
            make.height.equalTo(15.0)
        }
        onorOffLineLabel.textColor = UIColor.white
        onorOffLineLabel.font = UIFont.systemFont(ofSize: 14)
        onorOffLineLabel.text = "在线"
        onorOffLineLabel.tag = 201
        //航班号
        let flightAcreg = UILabel.init()
        self.view.addSubview(flightAcreg)
        flightAcreg.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(210.0)
            make.top.equalTo(self.view.snp.top).offset(70.0)
            make.width.equalTo(60)
            make.height.equalTo(10.0)
        }
        flightAcreg.tag = 202
        flightAcreg.font = UIFont.systemFont(ofSize: 12)
        flightAcreg.text = "AAAAAA"
        flightAcreg.textColor = UIColor.orange
        //最后更新时间
        let lastUpdateLabel = UILabel.init()
        self.view.addSubview(lastUpdateLabel)
        lastUpdateLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(160.0)
            make.top.equalTo(self.view.snp.top).offset(97.0)
            make.width.equalTo(145)
            make.height.equalTo(10.0)
        }
        lastUpdateLabel.text = "最后更新时间:8月10号 16:09"
        lastUpdateLabel.font = UIFont.systemFont(ofSize: 10)
        lastUpdateLabel.tag = 203
        lastUpdateLabel.textColor = UIColor.white
        
        //----------旅客信息图
        self.view.addSubview(passengerSort)
        passengerSort.delegate = self
        self.passengerSort.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(70.0)
            make.top.equalTo(self.view.snp.top).offset(150)
            make.width.equalTo(240)
            make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
        }
        self.passengerSort.backgroundColor = UIColor.clear
        //--------->>>>>>>>>>>>>航班详细信息图<<<<<<<<<<<<<<<<-----------
        self.flightDetailInfo = FlightDetailInfoView()
        self.view.addSubview(flightDetailInfo)
        self.flightDetailInfo.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-50.0)
            make.bottom.equalTo(self.view.snp.bottom).offset(-50.0)
            make.width.equalTo(600.0)
            make.height.equalTo(450.0)
        }
//        self.view.bringSubview(toFront: self.flightDetailInfo)
       
        
        //搜索视图和本地航班视图的父视图
        self.view.addSubview(clearView)
        clearView.snp.makeConstraints({ (make) in
            make.right.equalTo(self.view.snp.right).offset(-100)
            make.top.equalTo(self.view.snp.top).offset(200)
            make.width.equalTo(500)
            make.height.equalTo(300)
        })
        // 搜索航班视图
        self.clearView.addSubview(self.searchFlightNoView)
        self.searchFlightNoView.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalTo(self.clearView).offset(0)
        })
        self.searchFlightNoView.searchBtn.addTarget(self, action: #selector(searchClick(_ :)), for: .touchUpInside)
        self.searchFlightNoView.localBtn.addTarget(self, action: #selector(localClick(_ :)), for: .touchUpInside)
        //本地航班视图
        self.clearView.addSubview(self.localFlightView)
        self.localFlightView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.clearView).offset(0)
        }
 
        //-------------添加移动客舱系统功能表 但是在屏幕之外
        self.view.addSubview(self.ecabinFuncView)
        self.ecabinFuncView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view).offset(0.0)
            make.width.equalTo(300)
            make.left.equalTo(self.view.snp.right).offset(0)
        }
        
        //*******************航班动态********************
        self.view.addSubview(flghtDynamic)
        self.flghtDynamic.delegate = self
        self.flghtDynamic.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(-500.0)
            make.top.equalTo(self.view.snp.top).offset(150)
            make.width.equalTo(240)
            make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
        }
        self.view.sendSubview(toBack: self.flghtDynamic)
    }
    //左侧6个按钮对应的点击操作
    func menuBtnClick(_ sender:UIButton){
        
        if sender.tag == 100{
            self.passengerSort.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(70.0)
                make.top.equalTo(self.view.snp.top).offset(150)
                make.width.equalTo(240)
                make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
            })
            self.flghtDynamic.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(-500.0)
                make.top.equalTo(self.view.snp.top).offset(150)
                make.width.equalTo(240)
                make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
            })
            self.view.bringSubview(toFront: passengerSort)
        }

        if sender.tag == 103{
            self.flghtDynamic.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(70.0)
                make.top.equalTo(self.view.snp.top).offset(150)
                make.width.equalTo(240)
                make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
            })
            //
            self.passengerSort.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view.snp.left).offset(-500.0)
                make.top.equalTo(self.view.snp.top).offset(150)
                make.width.equalTo(240)
                make.bottom.equalTo(self.view.snp.bottom).offset(0.0)
            })
            self.view.bringSubview(toFront: flghtDynamic)
        }
        if sender.tag == 104{ //----------------------------- 移动客舱系统功能表  侧栏
            if ecabinFuncViewFlag{
            }else{
                UIView.transition(with: self.ecabinFuncView, duration: 2, options: [.curveEaseIn,.showHideTransitionViews], animations: {
                    
                }, completion: { (true) in
                    self.ecabinFuncView.snp.remakeConstraints({ (make) in
                        make.top.bottom.equalTo(self.view).offset(0.0)
                        make.width.equalTo(300)
                        make.right.equalTo(self.view.snp.right).offset(0)
                    })
                    self.clearView.snp.remakeConstraints({ (make) in
                        make.top.equalTo(self.view.snp.top).offset(200)
                        make.width.equalTo(500)
                        make.height.equalTo(300)
                        make.left.equalTo(self.view.snp.right).offset(0)
                    })
                     self.view.bringSubview(toFront: self.ecabinFuncView)
                     self.ecabinFuncViewFlag = true
                })
            }
        }
    }
    //设置按钮对应的操作
    func setBtnClick(_ sender:UIButton){
        print(sender.tag)
    }
    func networkState(){
        if !NetWorkState.isReachable(){
            DispatchQueue.main.async {
                let onorOffLineImageView = self.view.viewWithTag(200) as! UIImageView
                onorOffLineImageView.image = UIImage.init(named:self.networkStateImage[1])
                let onorOffLineLabel = self.view.viewWithTag(201) as! UILabel
                onorOffLineLabel.text = "本地"
                let btn = self.view.viewWithTag(101) as! UIButton
                btn.isUserInteractionEnabled = false
                btn.setImage(UIImage.init(named: "airLine_refresh_up"), for: .normal)                
            }
        }else{
            DispatchQueue.main.async {
                let onorOffLineImageView = self.view.viewWithTag(200) as! UIImageView
                onorOffLineImageView.image = UIImage.init(named:self.networkStateImage[0])
                let onorOffLineLabel = self.view.viewWithTag(201) as! UILabel
                onorOffLineLabel.text = "在线"
                let btn = self.view.viewWithTag(101) as! UIButton
                btn.isUserInteractionEnabled = true
                btn.setImage(UIImage.init(named: "airLine_refresh_normal"), for: .normal)
            }
        }
        
    }
    deinit {
        self.timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
    //点击搜索按妞时
    func searchClick(_ sender:UIButton){
        //---------------------------VC实现网络搜索-------------------------
        print(self.searchFlightNoView.searchText.text as Any)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print(formatter.string(from: self.searchFlightNoView.datePicker.date))
        let flt_date = formatter.string(from: self.searchFlightNoView.datePicker.date)
        var flt_num = "QW"
        if let num = self.searchFlightNoView.searchText.text{
            flt_num+=num
        }
        let url = "http://172.16.3.135:8080/base/v1/departPassengers?"
        let para = ["flt_date":flt_date,"flt_num":flt_num,"orig_airport":"JJN","dest_airport":"TAO"]
        //
        Alamofire.request(url, method: .get, parameters: para, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .success :
                if let dic = response.result.value{
                    let resultArray = (dic as! NSDictionary)["result"] as! NSArray
                    for result in resultArray{
                        let model = Passenger.mj_object(withKeyValues: result)!
                        print(model.etIdNum as Any)
                        print(model.vipInfo?.idCard as Any)
                    }
                }
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    //点击本地航班按钮时
    func localClick(_ sender:UIButton){
        UIView.transition(from: searchFlightNoView, to: localFlightView, duration: 2, options: [.transitionFlipFromLeft,.showHideTransitionViews]) { (true) in
        }
    }
    //接收通知 转换为搜索
    public func switchToSearch(){
        UIView.transition(from: localFlightView, to: searchFlightNoView, duration: 2, options: [.transitionFlipFromRight,.showHideTransitionViews]) { (true) in
        }
    }
    //接收通知隐藏侧边功能栏
    public func hideSliderMenu(){
        UIView.animate(withDuration: 2) {
            self.ecabinFuncView.snp.remakeConstraints({ (make) in
                make.top.bottom.equalTo(self.view).offset(0.0)
                make.width.equalTo(300)
                make.left.equalTo(self.view.snp.right).offset(0)
            })
            self.ecabinFuncViewFlag = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
