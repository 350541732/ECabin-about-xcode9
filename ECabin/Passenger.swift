//
//  Passenger.swift
//  ECabin
//
//  Created by apple on 2017/8/31.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import UIKit
import MJExtension
//旅客 模型
class Passenger: NSObject {

    var aecRebookSeat:String? //给AEC旅客重新订座标识
    var allianceSeniorTierLevel:String? //联盟高端旅客标识
    var amount:NSNumber? //金额
    var asrSeat:String? //ASR座位标识
    var bags:String?//行李总件数
    var bagtag:String? // 旅客的行李标签号
    var bagwht:String?//行李总重量
    var birthdayonflt:String? //航班生日旅客
    var blackListTag:String? //黑名单旅客标识
    var brdNo:String?//旅客登机号信息
    var cancelChangePort:String? //取消转港标识
    var certNo:String? //证件号
    var ckiAgent:String?//执行值机的代理号
    var ckiDate:String? //执行值机操作的日期信息
    var ckiInfo:String? //值机相关信息
    var ckiOffice:String?//执行值机操作的办公室
    var ckiPid:String? //执行值机操作的终端号
    var ckiTime:String?//执行值机时间信息
    var ckiType:String? //0= 柜台值机、1=CUSS 值机、2=WEB值机
    var dep:String? //拉下类型标识
    var dest:String? //到达航站
    var destSeq:String? //到达航站序列
    var dryBatWheelchair:String? //干电池轮椅
    var ediIn:String? //进港联程EDI标识
    var edimark:String? //EDI旅客标识
    var ediOut:String? //出港联程EDI标识
    var ediwarn:String? //EDIFACT警告项
    var elecBatWheelchair:String? //电动轮椅
    var et:String? //BKO中原始数据，票号/身份证号
    var etIdNum:String? //电子票中的身份证号
    var etNum:String? //电子票票号
    var exst:String? //附加座位信息项
    var ffp:String?//常客卡号
    var ffpValidFail:String? //常客级别验证失败
    var fileName:String? //被解析的BKO报文名
    var fltDate:String? //航班日期
    var fltNum:String? //航班号
    var fltSegIds:String?
    var fqtvDetailLevel:String? //结合同步库识别的明细等级如(区别深航属性和国航属性)：‘1’，‘2’，‘3’
    var gender:String?//旅客性别信息
    var groupId:String?//团体旅客标识、团体人数
    var hostnbr:String? //旅客标识HOTNBR(旅客唯一标识)
    var idNum:String? //纸票中的身份证号
    var idx:NSNumber?  // 航段ID
    var inBn:String? // 进港旅客登机号
    var inbound:String? //旅客进港信息
    var incabinLittleAnimalNocage:String? //进客舱小动物（直接携带进客舱不需要笼子）
    var incabinLittleAnimalWithcage:String? //装舱的小动物（需要笼子装运的）
    var inCity:String? //进港出发城市
    var inClass:String? //进港旅客子仓位
    var infantName:String? //婴儿姓名
    var inFltDate:String? //进港航班日期
    var inFltNum:String? //进港航班号
    var inSeat:String? //进港座位号
    var isBlnd:String?//盲人旅客标识
    var isBsct:String? //摇篮或无人陪伴儿童标识
    var isChild:String? //儿童标识 Y：是
    var isCip:String?//CIP旅客标识
    var isDeaf:String? //失聪旅客标识
    var isFfpJk:String? //是否是金卡常旅客
    var isGoshow:String? //为订做旅客类型
    var isInfant:String?//婴儿标识
    var isSpml:String?//需要特殊餐食服务标识
    var isStcr:String? //轮椅单价标识
    var isUm:String?
    var isVip:String? //VIP旅客标识
    var isVvip:String? //VVIP Y：是
    var isXres:String?//取消订座标识
    var lastFqtvLevel:String? //结合同步库后识别的等级V,G,S,C
    var mainClass:String? //主舱位
    var mdmGender:String? //同步库中的旅客性别
    var mileage:NSNumber? //里程
    var msg:String? //旅客信息项
    var ofl:String? //被拉下旅客标识信息
    var onboardWheelchair:String? //机上轮椅
    var orig:String? //始发航站
    var origCnname:String? //始发站中文名
    var origSeq:String? //始发航站序列
    var outbound:String? //旅客出港信息
    var outCity:String? //出港目的城市
    var outClass:String? //出港旅客子仓位
    var outFltDate:String? //出港航班日期
    var outFltNum:String? //出港航班号
    var pctc:String? //紧急联系信息项
    var pil:String?  //旅客信息清单项
    var pnrCrs:String? //CRS的PNR
    var pnrIcs:String? //ICS的PNR
    var preferSeat:String? //座位个人喜好项
    var procAgent:String? //执行旅客操作的代理号
    var psgNameCn:String? //旅客中文名
    var psgNameEn:String? //旅客英文名或拼音
    var psm:String? //REMARK注释信息旅客服务信息项
    var pspt:String?  //过境信息项
    var recheckFrom:String?//从某航班换乘信息
    var recheckTo:String?//换乘到某航班信息
    var recordCreateTime:NSNumber? //记录创建时间
    var recordLastUpdateTime:String?//记录最后修改时间
    var relation:String? //旅客联系信息
    var reservedSeat:String? //出港座位号
    var rushLuggage:String? //速运行李标识
    var seatNo:String?//座位号信息
    var seatOccupied:String? //被他人占用的座位标识
    var sellClass:String?//销售舱位
    var sip:String? //代码共享航班信息
    var specialService:String? //特殊服务标识
    var specialTag:String? //特殊旅客标识 Y:是
    var spmlItem:String?//特殊餐食信息项
    var sptId:String? //特殊旅客类别
    var ssrDpna:String? //智力障碍
    var ssrLang:String? //语言障碍
    var ssrMaas:String? //特别关注旅客
    var ssrMeda:String? //病患旅客
    var ssrPpoc:String? //可携带式氧气机
    var ssrSpbg:String? //特殊行李：骨灰、乐器、血清、血浆
    var ssrSpeq:String? //体育器材
    var ssrUmad:String? //无陪老人
    var ssrUmbd:String? //无陪智力障碍
    var ssrUmdf:String? //无陪听力障碍
    var ssrUmlg:String? //无陪视力障碍
    var ssrUmpg:String? //无陪孕妇
    var ssrWcon:String? //客舱轮椅
    var ssrYfpb:String? //宾客免票
    var standByPsr:String? //候补旅客标识
    var starFfp:String? //星盟会员标识
    var starFfpNo:String? //星盟卡号
    var status:String?//旅客状态
    var suid:String? //同步库的SUID
    var telNum:String? //结合同步库后识别的手机号
    var traFltIds:NSNumber? //中转旅客号
    var udClass:String? //升降舱之前旅客的舱位代码
    var udGrade:String? //升/降舱标识
    var updateTime:String?
    var vipInfo:VipInfo?
    var vudGrade:String? //自愿升/降舱标识
    var wchrType:String?//轮椅类型信息
    var wetBatWheelchair:String? //湿电池轮椅
}
class VipInfo: NSObject,NSCoding {
    var activityFavorite:String? //活动喜好
    var cardNum:String? //卡号
    var cardType:String? //证件类型
    var certificateType:String? //证明编号
    var creater:String? //创建人
    var createTime:Date? //创建时间
    var customerManagerId:String? //客户经理ID
    var customerManagerMobile:String? //客户经理手机号
    var duty:String? //职务
    var favorite:String? //喜好
    var foodDesc:String?
    var gender:String? //性别
    var hometown:String? //家乡
    var ID:String?
    var idCard:String? //身份证号
    var memo:String? //备注
    var mobile:String? //联系方式
    var name:String? //姓名
    var nameEn:String? //旅客英文名
    var nationality:String? //民族
    var other:String? //其它信息
    var photo:String? //照片
    var seatLove:String?
    var serviceDesc:String? //服务要求
    var suid:String? //同步库的SUID
    var updatePerson:String? //更新人
    var updateTime:Date? //更新时间
    var vipLoveIds:String? //旅客喜好ID：如/1/2/
    var vipLoveNames:String? //旅客喜好名称：如/中餐/前排/
    var vipTypeId:String? //高端旅客类型序列号
    var vipTypeNames:String? //身份
    var vipTypes:NSMutableArray?
    
    //模型的数组属性里面又装着模型
    override class func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return["vipTypes":VipTypeModel.self]
    }
    //模型属性名和字典的key不一样
    override class func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return ["ID":"id"]
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.activityFavorite, forKey: "activityFavorite")
        aCoder.encode(self.cardNum, forKey: "cardNum")
        aCoder.encode(self.cardType, forKey: "cardType")
        aCoder.encode(self.certificateType, forKey: "certificateType")
        aCoder.encode(self.creater, forKey: "creater")
        aCoder.encode(self.createTime, forKey: "createTime")
        aCoder.encode(self.customerManagerId, forKey: "customerManagerId")
        aCoder.encode(self.customerManagerMobile, forKey: "customerManagerMobile")
        aCoder.encode(self.duty, forKey: "duty")
        aCoder.encode(self.favorite, forKey: "favorite")
        aCoder.encode(self.foodDesc, forKey: "foodDesc")
        aCoder.encode(self.gender, forKey: "gender")
        aCoder.encode(self.hometown, forKey: "hometown")
        aCoder.encode(self.idCard, forKey: "idCard")
        aCoder.encode(self.memo, forKey: "memo")
        aCoder.encode(self.mobile, forKey: "mobile")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.nameEn, forKey: "nameEn")
        aCoder.encode(self.nationality, forKey: "nationality")
        aCoder.encode(self.other, forKey: "other")
        aCoder.encode(self.photo, forKey: "photo")
        aCoder.encode(self.seatLove, forKey: "seatLove")
        aCoder.encode(self.serviceDesc, forKey: "serviceDesc")
        aCoder.encode(self.suid, forKey: "suid")
        aCoder.encode(self.updatePerson, forKey: "updatePerson")
        aCoder.encode(self.updateTime, forKey: "updateTime")
        aCoder.encode(self.vipLoveIds, forKey: "vipLoveIds")
        aCoder.encode(self.vipLoveNames, forKey: "vipLoveNames")
        aCoder.encode(self.vipTypeId, forKey: "vipTypeId")
        aCoder.encode(self.vipTypeNames, forKey: "vipTypeNames")
        aCoder.encode(self.vipTypes, forKey: "vipTypes")
        aCoder.encode(self.ID, forKey: "ID")

    }
    required init?(coder aDecoder: NSCoder) {
        self.activityFavorite = aDecoder.decodeObject(forKey: "activityFavorite") as? String
        self.cardNum = aDecoder.decodeObject(forKey: "cardNum") as? String
        self.cardType = aDecoder.decodeObject(forKey: "cardType") as? String
        self.certificateType = aDecoder.decodeObject(forKey: "certificateType") as? String
        self.creater = aDecoder.decodeObject(forKey: "creater") as? String
        self.createTime = aDecoder.decodeObject(forKey: "createTime") as? Date
        self.customerManagerId = aDecoder.decodeObject(forKey: "customerManagerId") as? String
        self.customerManagerMobile = aDecoder.decodeObject(forKey: "customerManagerMobile") as? String
        self.duty = aDecoder.decodeObject(forKey: "duty") as? String
        self.favorite = aDecoder.decodeObject(forKey: "favorite") as? String
        self.foodDesc = aDecoder.decodeObject(forKey: "foodDesc") as? String
        self.gender = aDecoder.decodeObject(forKey: "gender") as? String
        self.hometown = aDecoder.decodeObject(forKey: "hometown") as? String
        self.idCard = aDecoder.decodeObject(forKey: "idCard") as? String
        self.memo = aDecoder.decodeObject(forKey: "memo") as? String
        self.mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.nameEn = aDecoder.decodeObject(forKey: "nameEn") as? String
        self.nationality = aDecoder.decodeObject(forKey: "nationality") as? String
        self.other = aDecoder.decodeObject(forKey: "other") as? String
        self.photo = aDecoder.decodeObject(forKey: "photo") as? String
        self.seatLove = aDecoder.decodeObject(forKey: "seatLove") as? String
        self.serviceDesc = aDecoder.decodeObject(forKey: "serviceDesc") as? String
        self.suid = aDecoder.decodeObject(forKey: "suid") as? String
        self.updatePerson = aDecoder.decodeObject(forKey: "updatePerson") as? String
        self.updateTime = aDecoder.decodeObject(forKey: "updateTime") as? Date
        self.vipLoveIds = aDecoder.decodeObject(forKey: "vipLoveIds") as? String
        self.vipLoveNames = aDecoder.decodeObject(forKey: "vipLoveNames") as? String
        self.vipTypeId = aDecoder.decodeObject(forKey: "vipTypeId") as? String
        self.vipTypeNames = aDecoder.decodeObject(forKey: "vipTypeNames") as? String
        self.vipTypes = aDecoder.decodeObject(forKey: "vipTypes") as? NSMutableArray
        self.ID = aDecoder.decodeObject(forKey: "ID") as? String
    }
    override init() {
        super.init()
    }
}
class VipTypeModel: NSObject,NSCoding {
    var code:String? //代码
    var ID:NSNumber?
    var memo:String? //备注
    var name:String? //名称
    //模型属性名和字典的key不一样
    override class func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return ["ID":"id"]
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.code, forKey: "code")
        aCoder.encode(self.ID, forKey: "ID")
        aCoder.encode(self.memo, forKey: "memo")
        aCoder.encode(self.name, forKey: "name")
    }
    required init?(coder aDecoder: NSCoder) {
        self.code = aDecoder.decodeObject(forKey: "code") as? String
        self.ID  = aDecoder.decodeObject(forKey: "ID") as? NSNumber
        self.memo = aDecoder.decodeObject(forKey: "memo") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
    }
    override init() {
        super.init()
    }
    
}
