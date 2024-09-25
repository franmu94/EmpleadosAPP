//
//  EmpleadosVM.swift
//  MiEmpleados
//
//  Created by Fran Malo on 24/9/24.
//

import Foundation

final class EmpleadosVM: ObservableObject {
    let interactor: DataInteractor
    
    @Published var empleados: [Empleado] = []
    
    @Published var showAlert = false
    @Published var errorMsg = ""
    
    init(interactor: DataInteractor = Network.shared) {
        self.interactor = interactor
        Task(priority: .high) {
            await getEmpleados()
        }
    }
    
    func getEmpleados() async {
        do {
            let empleados = try await interactor.getEmpleados()
            await MainActor.run {
                self.empleados = empleados
            }

        } catch {
            await MainActor.run {
                self.errorMsg = error.localizedDescription
                self.showAlert.toggle()
            }
        }
    }
}
