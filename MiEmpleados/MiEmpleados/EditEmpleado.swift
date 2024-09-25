//
//  EditEmpleado.swift
//  MiEmpleados
//
//  Created by Fran Malo on 25/9/24.
//

import SwiftUI

struct EditEmpleadoView: View {
    @ObservedObject var editVM: EditEmpleadosVM
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Section {
                    EmpleadoTextField(label: "First Name", value: $editVM.firstName, validation: editVM.fieldIsEmpty)
                    EmpleadoTextField(label: "Last Name", value: $editVM.lastName, validation: editVM.fieldIsEmpty)
                    EmpleadoTextField(label: "First Name", value: $editVM.firstName, validation: editVM.fieldIsEmpty)

                }
                header: {
                    Text("Personal data")
                        .textCase(.uppercase)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .customNavBar(title: "Edit Employee")
    }
}

#Preview {
    NavigationStack {
        EditEmpleadoView(editVM: EditEmpleadosVM(empleado: .test))
    }
}
