//
//  PassengerofSort.swift
//  ECabin
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//详细的旅客分类数量的自定义View
/*
 第一个按钮对应的旅客信息 分为 高端旅客/特殊旅客/中转旅客/所有旅客/过站旅客/升舱旅客
 */
class PassengerofSort: UIView,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    weak var delegate:PassengerInfoViewController?
    var psg:PassengerDetailInfoView?
    //座位号输入框
    lazy var searchTextField:UITextField = {
        let text = UITextField()
        let leftView = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: 30, height: 20))
        leftView.backgroundColor = UIColor.clear
        text.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "airLine_searchbox")!)
        text.leftView = leftView
        text.leftViewMode = .always
        text.delegate = self
        text.placeholder = "输入座位号快速定位"
        text.textAlignment = .left
        text.keyboardType = UIKeyboardType.default
        //  修改 键盘上的Return为Search
        text.returnKeyType = .search
        return text
    }()
    // 旅客列表
    lazy var table_view:UITableView = {
        let table = UITableView()
        table.register(PassengerSortCell.self, forCellReuseIdentifier: "PassengerSortCell")
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.delegate = self
        return table
    }()
    //初始旅客信息数据源(-----******** section *******------)
    lazy var sectionDataSource:NSMutableArray = {
        let data:NSMutableArray = ["高端旅客","特殊旅客","中转旅客","所有旅客","过站旅客","升舱旅客"]
        return data
    }()
    //判断section是否被点击的标志位
    lazy var flagArr:NSMutableArray = {
        let flag:NSMutableArray = ["0","0","0","0","0","0"] // 0 是关闭 1 是展开
        return flag
    }()
    lazy var rowDataSource:NSMutableArray = {
        let array:NSMutableArray = [["CIP[2/3]","青岛名流[10/10]","女明星1[10/12]"],["女明星3[10/12]","女明星4[10/12]"],["女明星5[10/12]","女明星6[10/12]"],["CIP[2/3]","青岛名流[10/10]","女明星1[10/12]"],["CIP[2/3]","青岛名流[10/10]","女明星1[10/12]"],["青岛名流[10/10]","女明星1[10/12]","CIP[2/3]","青岛名流[10/10]","女明星1[10/12]","CIP[2/3]","青岛名流[10/10]","女明星1[10/12]"]]
        return array
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.initUI()
    }
    func initUI(){
        self.addSubview(searchTextField)
        self.addSubview(table_view)
        self.searchTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-15)
            make.top.equalTo(2)
            make.height.equalTo(30)
        }
        self.table_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(5)
            make.left.right.bottom.equalTo(self).offset(0)
        }
    }
    //----------------------tableView dataSource  Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionDataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.flagArr[section]as! String == "1"{
            return (self.rowDataSource[section] as! [String]).count
            //  return 4
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassengerSortCell", for: indexPath) as! PassengerSortCell
        let model = (self.rowDataSource)[indexPath.section] as! [String]
        cell.title.text = model[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView(frame: CGRect.init(x: 0, y: 0, width: 600, height: 40))
        if flagArr[section] as! String == "0"{
            view.arrowImage.image = UIImage.init(named: "airLine_arrowbt_close")
            view.signImage.isHidden = true
        }else{
            view.arrowImage.image = UIImage.init(named: "airLine_arrowbt_open")
            view.signImage.isHidden = false
        }
        view.title.text = self.sectionDataSource[section] as? String
        view.tag = 666+section
        view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapClick)))
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        psg = PassengerDetailInfoView()
        self.delegate?.view.addSubview(psg!)
        psg?.delegate = self.delegate
        psg?.snp.makeConstraints { (make) in
            make.right.equalTo((self.delegate?.view.snp.right)!).offset(-10)
            make.top.equalTo((self.delegate?.view.snp.top)!).offset(50)
            make.bottom.equalTo((self.delegate?.view.snp.bottom)!).offset(-10)
            make.left.equalTo((self.delegate?.view.snp.left)!).offset(310.0)
        }
    }
    // 分区头点击
    func tapClick(tap:UITapGestureRecognizer){
        //判断是要做展开还是收缩
        let index:Int = (tap.view!).tag - 666
        
        if flagArr[index] as! String == "0"{ // 准备展开
            for i in 0...flagArr.count-1{
                flagArr.replaceObject(at: i, with: "0")
                self.table_view.reloadSections(IndexSet.init(integer:i), with: .fade)
            }
            //箭头
            flagArr.replaceObject(at: index, with: "1")
            self.table_view.reloadSections(IndexSet.init(integer:index), with: .fade)
        }else{                               //准备关闭
            flagArr.replaceObject(at: index, with: "0")
            self.table_view.reloadSections(IndexSet.init(integer: index), with: .fade)
        }
    }
    //*******************    UITextFieldDelegate    ***************
    // 输入框结束编辑状态
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        print("数据不为空可以在这执行传递数据")
    }
    // 输入框按下键盘 return 收回键盘
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // 该方法当文本框内容出现变化时 及时获取文本最新内容
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
