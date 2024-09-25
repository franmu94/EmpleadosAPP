//
//  ContentView.swift
//  MiEmpleados
//
//  Created by Fran Malo on 16/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = EmpleadosVM()
    var body: some View {
        List {
            ForEach(vm.empleados) { empleado in
                Text(empleado.firstName)
            }
        }
        .alert("Network Error", isPresented: $vm.showAlert) {} message: {Text(vm.errorMsg)}
    }
}

#Preview {
    ContentView()
}
