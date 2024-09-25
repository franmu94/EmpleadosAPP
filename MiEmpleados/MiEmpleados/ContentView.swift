//
//  ContentView.swift
//  MiEmpleados
//
//  Created by Fran Malo on 16/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: EmpleadosVM
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(Array(vm.empleados.enumerated()), id: \.offset) { index, empleado in
                        NavigationLink(value: empleado){
                            EmpleadoRow(empleado: empleado, index: index)
                        }
                        .buttonStyle(.plain)
                    }
                }
                //.padding()
            }
            .navigationDestination(for: Empleado.self) { empleado in
                EditEmpleadoView(editVM: EditEmpleadosVM(empleado: empleado))
            }
            .customNavBar(title: "Employees List")
            .addToolBarButton {
                print("me pulsó")
            }
        }
        .customAlert(message: vm.errorMsg, showCustom: $vm.showAlert)
    }
}

#Preview {
    ContentView()
        .environmentObject(EmpleadosVM(interactor: DataTestPreview()))
}
