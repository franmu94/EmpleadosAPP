//
//  EditEmpleado.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

final class EditEmpleadosVM: ObservableObject {
    let empleado: Empleado
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var username = ""
    @Published var address = ""
    @Published var zipcode = ""
    @Published var department = ""
    @Published var gender = ""
    
    @Published var isError = false
    
    init(empleado: Empleado) {
        self.empleado = empleado
        initEmpleado()
    }
    
    func initEmpleado() {
        firstName = empleado.firstName
        lastName = empleado.lastName
        email = empleado.email
        username = empleado.username
        address = empleado.address
        zipcode = empleado.zipcode
        department = empleado.department.rawValue
        gender = empleado.gender.rawValue
    }
    
    func fieldIsEmpty(value: String) -> Bool {
        value.isEmpty
    }
}
