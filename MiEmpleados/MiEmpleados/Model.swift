//
//  Model.swift
//  MiEmpleados
//
//  Created by Fran Malo on 20/5/24.
//

import Foundation

struct Empleado: Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let username: String
    let address: String
    let zipcode: String
//    let avatar: URL?
    let department: DptoName
    let gender: Gender
}
