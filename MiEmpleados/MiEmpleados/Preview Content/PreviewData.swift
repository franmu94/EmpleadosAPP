//
//  PreviewData.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import Foundation

struct DataTestPreview: DataInteractor {
    func getEmpleados() async throws -> [Empleado] {
        guard let url = Bundle.main.url(forResource: "testEmpleados", withExtension: "json") else { return [] }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([EmpleadoDTO].self, from: data).map(\.toEmpleado)
    }
    
    func getEmpleado(id: Int) async throws -> Empleado {
        .test
    }
}

extension Empleado {
    static let test = Empleado(id: 1, firstName: "Julio César", lastName: "Fernández", email: "jcfmunoz@icloud.com", username: "jcfmunoz", address: "Mi casa", zipcode: "00000", avatar: URL(string: "https://pbs.twimg.com/profile_images/1017076264644022272/tetffw3o_400x400.jpg")!, department: .engineering, gender: .male)
}
