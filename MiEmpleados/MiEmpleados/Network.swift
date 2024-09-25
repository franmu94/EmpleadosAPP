//
//  Network.swift
//  MiEmpleados
//
//  Created by Fran Malo on 22/5/24.
//

import Foundation

protocol DataInteractor {
    func getEmpleados() async throws -> [Empleado]
    func getEmpleado(id: Int) async throws -> Empleado
}

struct Network: DataInteractor, NetworkInteractor{
    static let shared = Network()
    
    func getEmpleados() async throws -> [Empleado] {
        let empleados = try await getJSON(request: .get(url: .getEmpleados), type: [EmpleadoDTO].self).map(\.toEmpleado)
        return empleados
    }
    func getEmpleado(id: Int) async throws -> Empleado {
        try await getJSON(request: .get(url: .empleado), type: EmpleadoDTO.self).toEmpleado
    }
    
    private init() {}
}


