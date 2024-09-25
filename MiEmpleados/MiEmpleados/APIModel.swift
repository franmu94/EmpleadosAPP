//
//  APIModel.swift
//  MiEmpleados
//
//  Created by Fran Malo on 20/5/24.
//

import Foundation

struct EmpleadoDTO: Codable {
    let id: Int
    let department: DepartmentDTO
    let avatar: URL?
    let address, zipcode: String
    let gender: GenderDTO
    let firstName, email, lastName: String
    let username: String
}

struct DepartmentDTO: Codable {
    let id: Int
    let name: DptoName
}

struct GenderDTO: Codable {
    let id: Int
    let gender: Gender
}

extension EmpleadoDTO {
    var toEmpleado: Empleado {
        Empleado(id: id,
                 firstName: firstName,
                 lastName: lastName,
                 email: email,
                 username: username,
                 address: address,
                 zipcode: zipcode,
                 avatar: avatar,
                 department: department.name,
                 gender: gender.gender)
    }
}
