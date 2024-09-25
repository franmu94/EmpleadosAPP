//
//  ApiPostModel.swift
//  MiEmpleados
//
//  Created by Fran Malo on 20/5/24.
//

import Foundation

struct EmpleadosQuery: Codable {
    var firstName: String?
    var lastName: String?
    var email: String?
}

struct EmpleadosUpdate: Codable {
    var id: Int
    var username: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var address: String?
 //   var avatar: String?
    var zipcode: String?
    var department: String?
    var gender: String?
}

extension Empleado {
    var toUpdate: EmpleadosUpdate {
        EmpleadosUpdate(id: id,
                        username: username,
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        address: address,
     //                   avatar: avatar?.absoluteString,
                        zipcode: zipcode,
                        department: department.rawValue,
                        gender: gender.rawValue)
    }
}
