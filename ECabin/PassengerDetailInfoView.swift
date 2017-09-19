//
//  PassengerDetailInfoView.swift
//  ECabin
//
//  Created by apple on 2017/9/5.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//REMARK: 旅客详细信息自定义view **** 包含该文件目录下其他自定义view*******
class PassengerDetailInfoView: UIView,UIPopoverPresentationControllerDelegate{

    // 标题
    lazy var titleView:FlightInfoView = {
        let view = FlightInfoView()
        return view
    }()
    lazy var clearView:UIView = { // 翻转视图所需的父视图
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    lazy var hightEndPsgView:HIghtEndPassengerView = {
        let view = HIghtEndPassengerView()
        return view
    }()
    lazy var testView:PassengerSeatChartView = {
        let view = PassengerSeatChartView()
         //view.backgroundColor = UIColor.brown
        return view
    }()
    var i = false
    weak var delegate:PassengerInfoViewController?
    var vc:PassengerVotageViewController?
    let notificationName = Notification.Name.init(rawValue: "selecteVogate")
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUI()
    }
    func initUI(){
        //添加观察者
        NotificationCenter.default.addObserver(self, selector: #selector(selecteVogate), name: notificationName, object: nil)
        self.addSubview(titleView)
        self.addSubview(clearView)
        self.clearView.addSubview(testView)
        self.clearView.addSubview(hightEndPsgView)
        self.titleView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self).offset(0)
            make.height.equalTo(50)
        }
        self.clearView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self).offset(0)
            make.top.equalTo(self.titleView.snp.bottom).offset(0)
        }
        self.testView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self).offset(0)
            make.top.equalTo(self.titleView.snp.bottom).offset(0)
        }
        self.hightEndPsgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self).offset(0)
            make.top.equalTo(self.titleView.snp.bottom).offset(0)
        }
        self.titleView.seatOrPsgBtn.isSelected = false
        self.titleView.seatOrPsgBtn.addTarget(self, action: #selector(seatOrPsg(_ :)), for: .touchUpInside)
        self.titleView.votageBtn.addTarget(self, action: #selector(votageClick(_ :)), for: .touchUpInside)
        /*
         添加侧滑手势 向右滑动 石洞移出屏幕之外
         */
        let swapTap = UISwipeGestureRecognizer.init(target: self, action: #selector(swapClick(_ :)))
        self.addGestureRecognizer(swapTap)
    }
    //
    func swapClick(_ swap:UISwipeGestureRecognizer){
        if swap.direction == .right{
            self.snp.remakeConstraints({ (make) in
                make.right.equalTo((self.delegate?.view.snp.left)!).offset(-10)
                make.top.equalTo((self.delegate?.view.snp.top)!).offset(50)
                make.bottom.equalTo((self.delegate?.view.snp.bottom)!).offset(-10)
                make.width.equalTo(500)
            })
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func seatOrPsg(_ sender:UIButton){
        if !self.titleView.seatOrPsgBtn.isSelected{
            UIView.transition(from: hightEndPsgView, to: testView, duration: 2, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: { (true) in
            })
           self.titleView.seatOrPsgBtn.setTitle("座位视图", for: .normal)
        }else{
            UIView.transition(from: testView, to: hightEndPsgView, duration: 2, options: [.transitionFlipFromRight,.showHideTransitionViews], completion: { (true) in
            })
           self.titleView.seatOrPsgBtn.setTitle("乘客列表", for: .normal)
        }
        sender.isSelected = !sender.isSelected
    }
    //选择航段
    func votageClick(_ sender:UIButton){
        vc = PassengerVotageViewController()
        vc?.modalPresentationStyle = .popover
        vc?.preferredContentSize = CGSize.init(width: 200, height: 250)
        vc?.popoverPresentationController?.delegate = self
        vc?.popoverPresentationController?.sourceView = sender
        vc?.popoverPresentationController?.sourceRect = sender.bounds
        vc?.popoverPresentationController?.permittedArrowDirections = .up
        vc?.popoverPresentationController?.backgroundColor = kRGBColorFromHex(rgbValue: 0x2B2B2B)
        self.delegate?.present(vc!, animated: true, completion: nil)
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    ///************************---------接收到通知——————————————————
    func selecteVogate(noti:Notification){
        if let title =  noti.userInfo?["model"]{
            DispatchQueue.main.async {
                self.titleView.votageBtn.setTitle(title as? String, for: .normal)
            }
            print(title)
        }        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
