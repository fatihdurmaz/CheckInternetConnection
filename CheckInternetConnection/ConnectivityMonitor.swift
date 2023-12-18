//
//  ConnectivityMonitor.swift
//  CheckInternetConnection
//
//  Created by Fatih Durmaz on 17.12.2023.
//

import Foundation
import Network
import Observation

@Observable
class ConnectivityMonitor {
    private let connectivityMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false
    
    init() {
        connectivityMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        connectivityMonitor.start(queue: workerQueue)
    }
}
