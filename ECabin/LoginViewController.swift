//
//  LoginViewController.swift
//  ECabin
//
//  Created by apple on 2017/6/30.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
//  imageview上加两个textfield 一个button
class LoginViewController: UIViewController {

    var login_View:UIView! //登录框图
    var wokecodeTF:UITextField! // 工号
    var passwordTF:UITextField! // 密码
    let aUser = UserManger.defaultManger.selectAll()
    let remember = RememberManger.defaultManger.selectAll().first!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    func initUI(){
        //设置背景图1
        self.view.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "login_bg")?.withRenderingMode(.alwaysOriginal))!)
        //登录框
        self.login_View = UIView.init()
        self.view.addSubview(login_View)
        self.login_View.snp.makeConstraints { (make) in
            // 登录图得中心点为父视图中心点向上偏移100
            make.centerX.equalTo(self.view.snp.centerX)
            make.centerY.equalTo(self.view.snp.centerY).offset(-100)
            make.width.equalTo(550)
            make.height.equalTo(400)
        }
        self.login_View.backgroundColor = UIColor.init(patternImage: (UIImage.init(named: "login_loginbox")?.withRenderingMode(.alwaysOriginal))!)
        // 工号
        self.wokecodeTF = UITextField.init()
        self.login_View.addSubview(wokecodeTF)
        self.wokecodeTF.snp.makeConstraints { (make) in
            make.left.equalTo(self.login_View).offset(200)
            make.top.equalTo(self.login_View).offset(235)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        self.wokecodeTF.keyboardType = .numberPad
        self.wokecodeTF.textColor = UIColor.white
        self.wokecodeTF.isSecureTextEntry = false
        if remember.rememberState!{
            self.wokecodeTF.text = aUser.userName
        }
        //密码
        self.passwordTF = UITextField.init()
        self.login_View.addSubview(passwordTF)
        self.passwordTF.snp.makeConstraints { (make) in
            make.left.equalTo(self.login_View).offset(200)
            make.top.equalTo(self.login_View).offset(290)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        self.passwordTF.keyboardType = .numberPad
        self.passwordTF.textColor = UIColor.white
        self.passwordTF.isSecureTextEntry = true
        //登录按钮
        let loginBtn = UIButton.init()
        self.login_View.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.login_View.snp.right).offset(-140.0)
            make.bottom.equalTo(self.login_View.snp.bottom).offset(-10.0)
            make.width.equalTo(50.0)
            make.height.equalTo(50.0)
        }
        loginBtn.setImage(UIImage.init(named: "login_gobt_normal"), for: .normal)
        loginBtn.addTarget(self, action: #selector(loginClick(_ :)), for: .touchUpInside)
        //记住工号按钮
        let rememberBtn = UIButton.init()
        self.login_View.addSubview(rememberBtn)
        rememberBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.login_View.snp.left).offset(120.0)
            make.bottom.equalTo(self.login_View.snp.bottom).offset(-12.0)
            make.width.height.equalTo(20.0)
        }
        if remember.rememberState!{
          rememberBtn.setImage(UIImage.init(named: "login_checkbox_down"), for: .normal)
        }else{
          rememberBtn.setImage(UIImage.init(named: "login_checkbox_normal"), for: .normal)
        }
        rememberBtn.addTarget(self, action: #selector(rememberBtnClick(_ :)), for: .touchUpInside)
    }
    func loginClick(_ sender:UIButton){
        if self.wokecodeTF.text == "" || self.passwordTF.text == ""{
           self.alter(title: "错误信息", "请核对您所输入的账户信息")
        }else{
            let userModel = User()
            userModel.userName = self.wokecodeTF.text!
            userModel.password = self.passwordTF.text!.md5
            print(userModel.password)
            UserManger.defaultManger.deleteData()
            UserManger.defaultManger.insert(model: userModel)
            let viewVC = MenuViewController()
            self.navigationController?.pushViewController(viewVC, animated: true)

        }
    }
    func rememberBtnClick(_ sender:UIButton){
        
        if !remember.rememberState{
            remember.rememberState = true
            sender.setImage(UIImage.init(named: "login_checkbox_down"), for: .normal)
            RememberManger.defaultManger.updateWith(model: remember)
        }else{
            remember.rememberState = false
            sender.setImage(UIImage.init(named: "login_checkbox_normal"), for: .normal)
            RememberManger.defaultManger.updateWith(model: remember)
        }
    }
    func alter(title:String,_ message:String){
        let vc:UIAlertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)

            let action2:UIAlertAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default, handler: nil)
            vc.addAction(action2)
            DispatchQueue.main.async {
                if self.presentedViewController==nil{
                    self.present(vc, animated: true, completion: nil)
                }else{
                    self.dismiss(animated: false, completion: nil)
                    self.present(vc, animated: true, completion: nil)
                }
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
