//
//  Remember.swift
//  ECabin
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import Foundation
import UIKit
import FMDB

class Remember: NSObject {
    var rememberState:Bool!
}
class RememberManger: NSObject {
    static let defaultManger = RememberManger()
    let lock = NSLock()
    lazy var fmdb:FMDatabase = {
        let path = NSHomeDirectory().appending("/Documents/RememberInfo.db")
        let db = FMDatabase(path: path)
        return db
    }()
    //实例化db对象的时候就会默认打开或创建一个数据库
    override init(){
        super.init()
        if fmdb.open(){
            print(NSHomeDirectory().appending("/Documents/RememberInfo.db"))
            print("打开手册数据库成功")
        }
    }
    func deleteData(){
        lock.lock()
        let sql = "DELETE FROM RememberInfo"
        let result = fmdb.executeUpdate(sql, withArgumentsIn: [])
        if result{
            print("删除表中数据成功")
        }
        lock.unlock()
    }
    //建表
    func createTable()->Void{
        let creatSql = "create table if not exists RememberInfo(id integer primary key autoincrement,rememberState BOOL)"
        let result = fmdb.executeUpdate(creatSql, withArgumentsIn: [])
        if result{
            print("创建用户数据库成功")
        }
    }
    //插入数据
    func insert(model:Remember)->Void{
        lock.lock()
        let insertSql = "insert into RememberInfo(rememberState) values(?)"
        do {
            try fmdb.executeUpdate(insertSql, values: [model.rememberState])
        }catch{
            print(fmdb.lastError())
        }
        lock.unlock()
    }
    //更新数据
    func updateWith(model:Remember)->Void{
        lock.lock()
        let updateSql = "update RememberInfo set rememberState = ?"
        do {
            try fmdb.executeUpdate(updateSql, values: [model.rememberState])
        }catch{
            print(fmdb.lastError())
        }
        lock.unlock()
    }
    // 查询全部数据
    func selectAll()->[Remember]{
        var  tmpArr = [Remember]()
        let selectSql = "select * from RememberInfo"
        do {
            let rs = try fmdb.executeQuery(selectSql, values: nil)
            while rs.next() {
                let model = Remember()
                model.rememberState = rs.bool(forColumn: "rememberState")
                tmpArr.append(model)
            }
        }catch{
            print(fmdb.lastError())
        }
        return tmpArr
    }
    
}
