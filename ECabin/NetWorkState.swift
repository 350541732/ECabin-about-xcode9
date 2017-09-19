//
//  NetWorkState.swift
//  EFB
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import ReachabilitySwift
class NetWorkState: NSObject {
    static func isReachable() -> Bool {
        if let reachability = Reachability() {
            if reachability.isReachableViaWiFi || reachability.isReachableViaWWAN{
                return true
            }
        }
        return false
    }
    
//    static func isMobileNet() -> Bool {
//        if let reachability = Reachability() {
//            if reachability.isReachableViaWWAN {
//                return true
//            }
//        }
//        return false
//    }
}
