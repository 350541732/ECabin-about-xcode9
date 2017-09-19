//
//  UserManger.swift
//  ECabin
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 LeeSin. All rights reserved.
//

import Foundation
import UIKit
import FMDB
class UserManger: NSObject {
    static let defaultManger = UserManger()
    let lock = NSLock()
    lazy var fmdb:FMDatabase = {
        let path = NSHomeDirectory().appending("/Documents/UserInfo.db")
        let db = FMDatabase(path: path)
        return db
    }()
    //实例化db对象的时候就会默认打开或创建一个数据库
    override init(){
        super.init()
        if fmdb.open(){
            print(NSHomeDirectory().appending("/Documents/UserInfo.db"))
            print("打开手册数据库成功")
        }
    }
    func deleteData(){
        lock.lock()
        let sql = "DELETE FROM UserInfo"
        let result = fmdb.executeUpdate(sql, withArgumentsIn: [])
        
        if result{
            print("删除表中数据成功")
        }
        lock.unlock()
    }
    //建表
    func createTable()->Void{
        let creatSql = "create table if not exists UserInfo(id integer primary key autoincrement,userName varchar(256),password varchar(256))"
        let result = fmdb.executeUpdate(creatSql, withArgumentsIn: [])
        if result{
            print("创建用户数据库成功")
        }
    }
    //插入数据
    func insert(model:User)->Void{
        lock.lock()
        let insertSql = "insert into UserInfo(userName,password) values(?,?)"
        do {
            try fmdb.executeUpdate(insertSql, values: [model.userName ,model.password])
        }catch{
            print(fmdb.lastError())
        }
        lock.unlock()
    }
    //更新数据
    func updateWith(model:User,wokeCode:String)->Void{
        lock.lock()
        let updateSql = "update UserInfo set userName = ?,password = ? where userName = ?"
        do {
            try fmdb.executeUpdate(updateSql, values: [model.userName ,model.password ,wokeCode])
        }catch{
            print(fmdb.lastError())
        }
        lock.unlock()
    }
    // 查询全部数据
    func selectAll()->User{
        let  tmpArr = User()
        let selectSql = "select * from UserInfo"
        do {
            let rs = try fmdb.executeQuery(selectSql, values: nil)
            while rs.next() {
                tmpArr.userName = rs.string(forColumn: "userName")!
                tmpArr.password = rs.string(forColumn: "password")!
            }
        }catch{
            print(fmdb.lastError())
        }
        return tmpArr
    }

}
