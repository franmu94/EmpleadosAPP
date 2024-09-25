//
//  EmpleadoRow.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

struct EmpleadoRow: View {
    let empleado: Empleado
    let index: Int
    var body: some View {
        VStack (alignment: .leading) {
            HStack  {
                VStack (alignment: .leading) {
                    Text(empleado.fullName)
                        .font(.headline)
                    Text(empleado.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(empleado.username)
                        .font(.caption)
                }
            }.padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            Rectangle()
                .fill(index % 2 == 0 ? .clear : .gray.opacity(0.5))
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    EmpleadoRow(empleado: .test, index: 3)
}
