//
//  CabinSeatForSix.swift
//  ECabin
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
// A  B  C   D   E   F
class CabinSeatForSix: UIView {
    lazy var aSeat:UILabel = {
        let label = UILabel()
        label.text = "A"
        label.textAlignment = .center
        return label
    }()
    lazy var bSeat:UILabel = {
        let label = UILabel()
        label.text = "B"
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
    lazy var eSeat:UILabel = {
        let label = UILabel()
        label.text = "E"
        label.textAlignment = .center
        return label
    }()

    lazy var fSeat:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.textAlignment = .center
        return label
    }()
    
    let space:CGFloat = 50
    let bigSpace:CGFloat = 70
    let topSpace:CGFloat = 10
    let bottomSpace:CGFloat = -10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(aSeat)
        self.addSubview(bSeat)
        self.addSubview(cSeat)
        self.addSubview(dSeat)
        self.addSubview(eSeat)
        self.addSubview(fSeat)
        initUI()
    }
    func initUI(){
        self.aSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.bSeat.snp.width)
        }
        
        self.bSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.aSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.cSeat.snp.width)
        }
        self.cSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.bSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.dSeat.snp.width)
        }
        self.dSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.cSeat.snp.left).offset(-bigSpace)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.eSeat.snp.width)
        }
        self.eSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.dSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.width.equalTo(self.fSeat.snp.width)
        }
        self.fSeat.snp.makeConstraints { (make) in
            make.right.equalTo(self.eSeat.snp.left).offset(-space)
            make.top.equalTo(self.snp.top).offset(topSpace)
            make.bottom.equalTo(self.snp.bottom).offset(bottomSpace)
            make.left.equalTo(self.snp.left).offset(space)
            make.width.equalTo(self.aSeat.snp.width)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
