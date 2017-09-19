//
//  CabinSeatForFour.swift
//  ECabin
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
//  A    C    D    F

class CabinSeatForFour: UIView {

    lazy var aSeat:UILabel = {
        let label = UILabel()
        label.text = "A"
        label.textAlignment = .center
        return label
    }()
    lazy var cSeat:UILabel = {
        let label = UILabel()
        label.text = "C"
        label.textAlignment = .center
        return label
    }()
    lazy var dSeat:UILabel = {
        let label = UILabel()
        label.text = "D"
        label.textAlignment = .center
        return label
    }()
    lazy var fSeat:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.textAlignment = .center
        return label
    }()
    let space:CGFloat = 80
    let bigSpace:CGFloat = 120
    let topSpace:CGFloat = 10
    let bottomSpace:CGFloat = -10
    override init(frame: CGRect) {
        super.init(frame: frame)        
        self.addSubview(aSeat)
        self.addSubview(cSeat)
        self.addSubview(dSeat)
        self.addSubview(fSeat)
        self.initUI()
    }
    func initUI(){
        self.aSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.cSeat.snp.width)
        }
        self.cSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.aSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.dSeat.snp.width)
        }
        self.dSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.cSeat.snp.left).offset(-bigSpace)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.fSeat.snp.width)
        }
        self.fSeat.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(space)
            make.right.equalTo(self.dSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
