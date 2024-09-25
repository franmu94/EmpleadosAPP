//
//  URL.swift
//  MiEmpleados
//
//  Created by Fran Malo on 20/5/24.
//

import Foundation

let prod = URL(string: "https://acacademy-employees-api.herokuapp.com/api")!
let desa = URL(string: "http://localhost:8080/api")!

let api = prod

extension URL {
    static let getEmpleados = api.appending(path: "getEmpleados")
    static let empleado = api.appending(path: "empleado")
    static func getEmpleado(id: Int) -> URL {
        api.appending(path: "getEmpleado").appending(path: "\(id)")
    }
    static func findEmpleado(search: String) -> URL {
        api.appending(path: "findEmpleado").appending(path: search)
    }
    static func searchEmpleado(search: String) -> URL {
        api.appending(path: "searchEmpleado").appending(queryItems: [.search(search: search)])
    }
}

extension URLQueryItem {
    static func search(search: String) -> URLQueryItem {
        URLQueryItem(name: "search", value: search)
    }
}
