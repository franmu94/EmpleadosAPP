//
//  NetworkStatus.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import Foundation
import Network

final class NetworkStatus: ObservableObject {
    enum Staus {
        case offline, online, Unknown
    }
    
    @Published var status = Staus.online
    
    let monitor = NWPathMonitor()
    var queue = DispatchQueue(label: "MonitorNetwork")
    
    init () {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [self] path in
            DispatchQueue.main.async {
                self.status = path.status != .unsatisfied ? .online : .offline
            }
        }
    }
}
