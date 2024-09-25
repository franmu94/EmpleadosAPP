//
//  MiEmpleadosApp.swift
//  MiEmpleados
//
//  Created by Fran Malo on 16/5/24.
//

import SwiftUI

@main
struct MiEmpleadosApp: App {
    @StateObject var network = NetworkStatus()
    @StateObject var vm = EmpleadosVM()
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .unavailableNetwork(status: network.status)
        }
    }
}
