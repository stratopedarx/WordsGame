//
//  Connectivity.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 18.08.2022.
//

import Alamofire

class Connectivity {
    static let shared = Connectivity()
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    var listener: ((NetworkReachabilityManager.NetworkReachabilityStatus) -> Void)?
    var manager: NetworkReachabilityManager?
    
    init() {
        manager = NetworkReachabilityManager()
        manager?.startListening(onUpdatePerforming: { status in
            self.listener?(status)
        })
    }
}
